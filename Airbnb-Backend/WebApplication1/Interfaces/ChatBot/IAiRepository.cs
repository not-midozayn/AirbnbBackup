namespace WebApplication1.Interfaces.ChatBot
{
    public interface IAiRepository
    {
        Task<string> GenerateResponseAsync(string prompt, string conversationHistory);
        Task<T> ExecuteToolAsync<T>(string toolName, object parameters);
        Task<string> TranscribeAudioAsync(IFormFile audioFile);

    }
}
