using WebApplication1.Models.ChatBot;

namespace WebApplication1.Interfaces.ChatBot
{
    public interface IChatRepository
    {
        Task<ChatMessage> ProcessMessageAsync(string userId, string message, string conversationId);
        Task<List<ChatMessage>> GetConversationHistoryAsync(string userId, string conversationId);
        Task<IEnumerable<Conversation>> GetAllConversationsAsync(string userId);
        Task<string> CreateNewConversationAsync(string userId);
    }
}
