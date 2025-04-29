﻿using System.Text.RegularExpressions;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages.Manage;
using WebApplication1.Interfaces.ChatBot;
using WebApplication1.Models;
using WebApplication1.Models.ChatBot;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http.HttpResults;


namespace WebApplication1.Repositories.ChatBot
{
    public class ModelKeyChatRepository : IChatRepository   
    {
        private readonly IAiRepository _aiService;
        private readonly AirbnbDBContext _context;
        private readonly string _modelKey;

        public ModelKeyChatRepository(
            IAiRepository aiService,
            AirbnbDBContext context,
            IConfiguration configuration)
        {
            _aiService = aiService;
            _context = context;
            _modelKey = configuration["LLM:ApiKey"];
        }

        public async Task<string> CreateNewConversationAsync(string email)
        {
            var user = await GetCurrentUser(email);
            var conversationId = Guid.NewGuid().ToString();
            var conversation = new Conversation
            {
                Id = conversationId,
                UserId = user.Id.ToString(),
                CreatedAt = DateTime.UtcNow
            };

            _context.Conversations.Add(conversation);
            await _context.SaveChangesAsync();

            return conversationId;
        }

        public async Task<List<ChatMessage>> GetConversationHistoryAsync(string email, string conversationId)
        {
            var user = await GetCurrentUser(email);
            return await _context.ChatMessages
                    .Where(m => m.UserId == user.Id.ToString() &&
                                m.ConversationId == conversationId)
                    .OrderBy(m => m.Timestamp)
                    .ToListAsync();
        }
        public async Task<IEnumerable<Conversation>> GetAllConversationsAsync(string userId)
        {
            // Parse userId early to fail fast if invalid
            var userGuid = Guid.Parse(userId);

            // Fetch the user with their conversations
            var user = await _context.Users
                .Include(u => u.Conversations) // Ensure conversations are loaded
                .FirstOrDefaultAsync(u => u.Id == userGuid);

            // Return empty list if user or conversations not found
            if (user?.Conversations == null)
            {
                return Enumerable.Empty<Conversation>();
            }
            var conversations = _context.Conversations
                .Where(c => c.UserId == user.Id.ToString())
                .OrderBy(c => c.CreatedAt)
                .ToList();
            // Return ordered conversations
            if(conversations == null)
            {
                return  Enumerable.Empty<Conversation>();
            }
            return conversations;
        }

        public async Task<ChatMessage> ProcessMessageAsync(string email, string message, string conversationId)
        {
            var user = await GetCurrentUser(email);
            var conversation = _context.Conversations
                .Where(c => c.Id == conversationId).FirstOrDefault();
            // Check if this exact message already exists in the database
            var existingMessage = await _context.ChatMessages
                .FirstOrDefaultAsync(m => m.UserId == user.Id.ToString()
                                      && m.ConversationId == conversationId
                                      && m.Content == message
                                      && m.IsFromUser == true
                                      && m.Timestamp > DateTime.UtcNow.AddMinutes(-1)); // Add a time check to avoid false positives

            ChatMessage userMessage;
            if (existingMessage == null)
            {
                // Create and save the new user message if it doesn't exist
                userMessage = new ChatMessage
                {
                    UserId = user.Id.ToString(),
                    IsFromUser = true,
                    Content = message,
                    Timestamp = DateTime.UtcNow,
                    ConversationId = conversationId
                };
                _context.ChatMessages.Add(userMessage);
                await _context.SaveChangesAsync(); // Save immediately to prevent race conditions
            }
            else
            {
                // Use the existing message
                userMessage = existingMessage;
            }

            if (!IsAirbnbRelated(message))
            {
                return await CreateRejectionMessage(email, conversationId);
            }
            
            var history = await GetConversationHistoryAsync(email, conversationId);
            var conversationText = string.Join("\n", history.Select(m => $"{m.Content}"));
            var responseContent = await _aiService.GenerateResponseAsync(message, conversationText);

            // Check if this exact response already exists
            var existingResponse = await _context.ChatMessages
                .FirstOrDefaultAsync(m => m.UserId == user.Id.ToString()
                                      && m.ConversationId == conversationId
                                      && m.Content == responseContent
                                      && m.IsFromUser == false
                                      && m.Timestamp > DateTime.UtcNow.AddMinutes(-1));

            conversation.Title = userMessage.Content.Length <= 50
                ? userMessage.Content
                : userMessage.Content.Substring(0, 50) + "...";
            ChatMessage assistantResponse;
            if (existingResponse == null)
            {
                // Create and save the new assistant response if it doesn't exist
                assistantResponse = new ChatMessage
                {
                    UserId = user.Id.ToString(),
                    IsFromUser = false,
                    Content = responseContent,
                    Timestamp = DateTime.UtcNow,
                    ConversationId = conversationId
                };
                _context.ChatMessages.Add(assistantResponse);
                await _context.SaveChangesAsync();
            }
            else
            {
                // Use the existing response
                assistantResponse = existingResponse;
            }

            return assistantResponse;
        }

        private bool IsAirbnbRelated(string message)
        {
            var lowercaseMsg = message.ToLower();
            var airbnbKeywords = new[]
            {
                "airbnb", "booking", "listing", "host", "guest", "stay", "rental",
                "property", "reservation", "check-in", "check-out", "amenities",
                "cancellation policy", "security deposit", "cleaning fee",
                "vacation rental", "hosting", "superhost", "experience",
                "long-term stay", "short-term rental", "house rules"
            };

            var forbiddenPatterns = new[]
            {
                @"\b(weather|news|sports|stock market|politics|entertainment)\b",
                @"\b(how to make|create|build|invest in|buy|sell)\b",
                @"\b(history of|biography|science|math|physics|chemistry)\b"
            };

            // Check for explicit Airbnb keywords
            if (airbnbKeywords.Any(keyword => lowercaseMsg.Contains(keyword)))
                return true;

            // Check against forbidden topics
            if (forbiddenPatterns.Any(pattern => Regex.IsMatch(lowercaseMsg, pattern)))
                return false;

            // Final check using AI model
            return CheckWithAiModel(message).Result;
        }

        private async Task<bool> CheckWithAiModel(string message)
        {
            var prompt = $@"Is this question related to Airbnb or vacation rentals? 
                        Respond only with 'true' or 'false'.
                        Question: '{message}'
                        Response:";

            var response = await _aiService.GenerateResponseAsync(prompt, "");
            return response.Trim().Equals("true", StringComparison.OrdinalIgnoreCase);
        }

        private async Task<ChatMessage> CreateRejectionMessage(string Email, string conversationId)
        {
            var user = await _context.Users
            .FirstOrDefaultAsync(u => u.Email == Email);
            return new ChatMessage
            {
                UserId = user.Id.ToString(),
                IsFromUser = false,
                Content = $"Hi {user.FirstName}, I specialize exclusively in Airbnb-related questions. " +
                         "Please ask about:\n" +
                         "- Vacation rental listings\n" +
                         "- Booking policies\n" +
                         "- Hosting guidelines\n" +
                         "- Airbnb features\n" +
                         "- Payment and safety systems",
                Timestamp = DateTime.UtcNow,
                ConversationId = conversationId
            };
        }
        private async Task<ApplicationUser> GetCurrentUser(string email)
        {
            return await _context.Users
            .FirstOrDefaultAsync(u => u.Email == email);
        }
    }
}