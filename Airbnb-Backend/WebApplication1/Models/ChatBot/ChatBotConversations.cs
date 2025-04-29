namespace WebApplication1.Models.ChatBot
{
    public class Conversation
    {
        public string Id { get; set; }
        public string UserId { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime LastMessageAt { get; set; }
        public string Title { get; set; }

        // Navigation property for related messages
        public virtual ICollection<ChatMessage> Messages { get; set; }

        public Conversation()
        {
            Messages = new HashSet<ChatMessage>();
        }
    }
}
