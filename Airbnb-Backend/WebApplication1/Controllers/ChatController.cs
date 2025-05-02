// Controllers/ChatController.cs
using System.Security.Claims;
using System.Text.Json;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.DTOS.Authentication;
using WebApplication1.DTOS.ChatBot;
using WebApplication1.Interfaces;
using WebApplication1.Interfaces.ChatBot;
using WebApplication1.Models.ChatBot;
using WebApplication1.Repositories;
using WebApplication1.Repositories.ChatBot;

namespace AirbnbClone.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    //[Authorize(Roles = $"{UserRoles.Guest},{UserRoles.Host},{UserRoles.Admin}")]
    public class ChatController : ControllerBase
    {
        private readonly IChatRepository _chatService;
        private readonly IAiRepository _aiRepository;
        private readonly IUserRepository _userRepository;

        public ChatController(IChatRepository chatService, IAiRepository aiRepository, IUserRepository userRepository)
        {
            _chatService = chatService;
            _aiRepository = aiRepository;
            _userRepository = userRepository;
        }

        [HttpPost("conversation")]
        public async Task<ActionResult<string>> CreateConversation()
        {
            var userId = _userRepository.GetCurrentUserId().ToString();
            var conversationId = await _chatService.CreateNewConversationAsync(userId);
            return Ok(new { conversationId });
        }
        [HttpGet("conversations")]
        public async Task<ActionResult<IEnumerable<Conversation>>> GetMostRecentConversationAsync()
        {
            var userId = _userRepository.GetCurrentUserId().ToString();
            if (string.IsNullOrEmpty(userId))
            {
                return BadRequest("User ID not found in token");
            }

            var conversations = await _chatService.GetAllConversationsAsync(userId);
            return Ok(conversations.OrderByDescending(m => m.CreatedAt));
        }
        [HttpGet("conversation/{conversationId}")]
        public async Task<ActionResult<List<ChatMessage>>> GetConversation(string conversationId)
        {
            var userId = _userRepository.GetCurrentUserId().ToString();
            var messages = await _chatService.GetConversationHistoryAsync(userId, conversationId);
            return Ok(messages);
        }

        [HttpPost("send")]
        public async Task<ActionResult<ChatMessage>> SendMessage([FromBody] SendMessageRequest request)
        {
            var userId = _userRepository.GetCurrentUserId().ToString();
            var response = await _chatService.ProcessMessageAsync(userId, request.Message, request.ConversationId);
            return Ok(response);
        }



        [HttpPost("audio")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public async Task<IActionResult> ProcessAudioMessage([FromForm] IFormFile audioFile, [FromForm] string conversationId)
        {
            if (audioFile == null || audioFile.Length == 0)
                return BadRequest("No audio file was provided.");

            try
            {
                var userId = _userRepository.GetCurrentUserId().ToString();

                // Step 1: Transcribe the audio using Whisper API
                string transcription = await _aiRepository.TranscribeAudioAsync(audioFile);

                // Step 2: Process the transcription using existing chat service
                var response = await _chatService.ProcessMessageAsync(userId, transcription, conversationId);

                return Ok(new
                {
                    transcription = transcription,
                    response = response
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }
    }


    public class SendMessageRequest
    {
        public string Message { get; set; }
        public string ConversationId { get; set; }
    }
}