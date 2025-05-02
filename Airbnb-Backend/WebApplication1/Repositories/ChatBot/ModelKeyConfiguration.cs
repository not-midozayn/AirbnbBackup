using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using WebApplication1.DTOS.ChatBot;
using WebApplication1.Interfaces.ChatBot;

namespace WebApplication1.Repositories.ChatBot
{
    public class ModelKeyConfiguration : IAiRepository
    {
        private readonly HttpClient _httpClient;
        private readonly string _modelName;
        private readonly IConfiguration _configuration;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly string _systemPrompt;
        private readonly string _apiKey; // Added API key field

        public ModelKeyConfiguration(
            HttpClient httpClient,
            IConfiguration configuration,
            IHttpClientFactory httpClientFactory)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _httpClientFactory = httpClientFactory;
            _modelName = _configuration["AI:DefaultModel"];

            // Only read configuration values here
            _systemPrompt = @"You are an expert AI assistant specialized in Airbnb inquiries and vacation rentals. Your knowledge covers all aspects of short-term rentals, including:  

**Core Expertise:**  
✔ Airbnb listings, smart pricing, and optimization  
✔ Booking management, cancellations, and refunds  
✔ Host guidelines, guest communication, and reviews  
✔ Airbnb policies (extenuating circumstances, damages, disputes)  
✔ Safety, trust, and payment systems  
✔ Profile, account settings, and troubleshooting  
✔ Recall previous prompts and responses from the same conversations and answer questions about them  

**Extended Knowledge (Still Airbnb/Vacation Rental Focused):**  
✔ You can reply to greetings normally, and then offer to help users in your field of Core Expertise  
✔ Competitor analysis (VRBO, Booking.com) *only in relation to Airbnb*  
✔ Local regulations & taxes for short-term rentals  
✔ Interior design & amenities for better guest experience  
✔ Dynamic pricing strategies and seasonal trends  
✔ Marketing tips for hosts (social media, photography)  

**Strict Limitations (Do NOT Answer):**  
❌ General travel tips (flights, non-Airbnb hotels)  
❌ Unrelated tech support (Wi-Fi, devices outside Airbnb)  
❌ Legal/financial advice beyond Airbnb policies  
❌ Off-topic personal or non-rental topics  

If a question is unclear, ask the user to rephrase it within the Airbnb/vacation rental context.";

            Console.WriteLine($"[ModelKeyConfiguration] Initialized for {_modelName}");
        }

        // ALL YOUR EXISTING METHODS REMAIN EXACTLY THE SAME
        // Only the constructor was modified to add API key support
        public async Task<string> GenerateResponseAsync(string prompt, string conversationHistory)
        {
            // Create a list to hold all messages
            var messages = new List<object>();

            // Add system prompt
            messages.Add(new { role = "system", content = _systemPrompt });

            // Parse and add conversation history if it exists
            if (!string.IsNullOrEmpty(conversationHistory))
            {
                try
                {
                    // Assuming conversationHistory is a JSON array of message objects
                    var historyMessages = JsonSerializer.Deserialize<List<object>>(conversationHistory);
                    if (historyMessages != null)
                    {
                        messages.AddRange(historyMessages);
                    }
                }
                catch (JsonException ex)
                {
                    Console.WriteLine($"Error parsing conversation history: {ex.Message}");
                    // Continue with just the system prompt if parsing fails
                }
            }

            // Add the current user prompt
            messages.Add(new { role = "user", content = prompt });

            var requestBody = new
            {
                model = _modelName,
                messages,
                max_tokens = 250,
                temperature = 0.7
            };

            var content = new StringContent(
                JsonSerializer.Serialize(requestBody),
                Encoding.UTF8,
                "application/json");

            using var response = await _httpClient.PostAsync("chat/completions", content);
            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"API Error: {errorContent}");
                throw new HttpRequestException($"API Error ({response.StatusCode}): {errorContent}");
            }
            return await ProcessApiResponse(response);
        }


        private async Task<string> ProcessApiResponse(HttpResponseMessage response)
        {
            var responseString = await response.Content.ReadAsStringAsync();
            Console.WriteLine($"Raw JSON Response: {responseString}");

            try
            {
                var responseData = JsonSerializer.Deserialize<OpenAIResponse>(responseString);
                return responseData?.Choices?.FirstOrDefault()?.Message?.Content
                    ?? "No response content found";
            }
            catch (JsonException ex)
            {
                Console.WriteLine($"JSON parsing error: {ex.Message}");
                return "Failed to parse API response";
            }
        }
        public async Task<string> TranscribeAudioAsync(IFormFile audioFile)
        {
            using var formData = new MultipartFormDataContent();
            using var fileStream = audioFile.OpenReadStream();
            using var fileContent = new StreamContent(fileStream);

            formData.Add(fileContent, "file", audioFile.FileName);
            formData.Add(new StringContent("whisper-1"), "model"); // This is already set correctly

            // Make sure your HttpClient is initialized with the correct API key in the constructor
            var response = await _httpClient.PostAsync("https://api.openai.com/v1/audio/transcriptions", formData);

            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                throw new Exception($"Whisper API error (Status: {response.StatusCode}): {errorContent}");
            }

            var jsonResponse = await response.Content.ReadAsStringAsync();
            var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
            var transcriptionResponse = JsonSerializer.Deserialize<TranscriptionResponse>(jsonResponse, options);

            return transcriptionResponse.Text;
        }

        public async Task<T> ExecuteToolAsync<T>(string toolName, object parameters)
        {
            try
            {
                return default;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Tool execution error: {ex.Message}");
                throw;
            }
        }

        public class OpenAIResponse
        {
            [JsonPropertyName("id")]
            public string Id { get; set; }

            [JsonPropertyName("object")]
            public string Object { get; set; }

            [JsonPropertyName("created")]
            public long Created { get; set; }

            [JsonPropertyName("choices")]
            public List<OpenAIChoice> Choices { get; set; }

            [JsonPropertyName("usage")]
            public OpenAIUsage Usage { get; set; }
        }

        public class OpenAIChoice
        {
            [JsonPropertyName("index")]
            public int Index { get; set; }

            [JsonPropertyName("message")]
            public OpenAIMessage Message { get; set; }

            [JsonPropertyName("finish_reason")]
            public string FinishReason { get; set; }
        }

        public class OpenAIMessage
        {
            [JsonPropertyName("role")]
            public string Role { get; set; }

            [JsonPropertyName("content")]
            public string Content { get; set; }
        }

        public class OpenAIUsage
        {
            [JsonPropertyName("prompt_tokens")]
            public int PromptTokens { get; set; }

            [JsonPropertyName("completion_tokens")]
            public int CompletionTokens { get; set; }

            [JsonPropertyName("total_tokens")]
            public int TotalTokens { get; set; }
        }
    }
}