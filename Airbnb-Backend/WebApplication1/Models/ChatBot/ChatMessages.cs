namespace WebApplication1.Models.ChatBot
{
    public class ChatMessage
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public bool IsFromUser { get; set; }
        public string Content { get; set; }
        public DateTime Timestamp { get; set; }
        public string ConversationId { get; set; }
    }
}
