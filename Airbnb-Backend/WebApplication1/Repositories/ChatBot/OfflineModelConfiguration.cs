//using System.Text;
//using System.Text.Json;
//using System.Text.Json.Serialization;
//using WebApplication1.Interfaces.ChatBot;

//namespace WebApplication1.Repositories.ChatBot
//{
//    public class OfflineModelConfiguration : IAiRepository
//    {
//        private readonly HttpClient _httpClient;
//        private readonly string _modelName;
//        private readonly IConfiguration _configuration;
//        private readonly IHttpClientFactory _httpClientFactory;
//        private readonly string _systemPrompt;


//        public OfflineModelConfiguration(HttpClient httpClient,
//                       IConfiguration configuration,
//                       IHttpClientFactory httpClientFactory)
//        {
//            _httpClient = httpClient ?? throw new ArgumentNullException(nameof(httpClient));
//            _configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));
//            _httpClientFactory = httpClientFactory ?? throw new ArgumentNullException(nameof(httpClientFactory));

//            // Configuration with validation
//            _modelName = _configuration["AI:ModelName"]?.Trim() ?? "phi";
//            _systemPrompt = _configuration["AI:SystemPrompt"] ?? "You are a helpful Airbnb assistant.";
//            var endpoint = _configuration["AI:EndpointUrl"]?.Trim() ?? "http://localhost:11434";

//            if (!Uri.TryCreate(endpoint, UriKind.Absolute, out var baseUri))
//            {
//                throw new ArgumentException($"Invalid endpoint URL in configuration: {endpoint}");
//            }

//            _httpClient.BaseAddress = baseUri;

//            // Debug output
//            Console.WriteLine($"[OllamaAiRepository] Initialized with Model: {_modelName}, Endpoint: {baseUri}");
//        }

//        public async Task<string> GenerateResponseAsync(string prompt, string conversationHistory)
//        {
//            try
//            {
//                var fullPrompt = string.IsNullOrEmpty(conversationHistory) ? prompt :
//                $"{conversationHistory}\n\nBased on the above conversation, {prompt}";
//                var requestBody = new
//                {
//                    model = _modelName, // Use the smallest viable model for your needs
//                    prompt = prompt,
//                    stream = false,    // Keep false to avoid additional overhead
//                    options = new
//                    {
//                        num_predict = 30,          // Reduced from 50 to limit output length
//                        num_threads = 2,           // Keep low (2 is good for dual-core CPUs)
//                        temperature = 0.5,         // Slightly lower for more focused outputs
//                        repeat_last_n = 16,        // Smaller context for repeat prevention
//                        repeat_penalty = 1.1,      // Mild repeat prevention
//                        seed = -1,                 // Random seed
//                        top_k = 20,                // Reduced from default (40) for speed
//                        top_p = 0.4,               // More focused sampling
//                        stop = new[] { "\n" },     // Stop at newline to limit output
//                        num_ctx = 512              // Reduced context window if possible
//                    }
//                };

//                var content = new StringContent(
//                    JsonSerializer.Serialize(requestBody),
//                    Encoding.UTF8,
//                    "application/json");

//                using var response = await _httpClient.PostAsync("/api/generate", content);

//                if (!response.IsSuccessStatusCode)
//                {
//                    var errorContent = await response.Content.ReadAsStringAsync();
//                    throw new HttpRequestException($"Ollama API Error ({response.StatusCode}): {errorContent}");
//                }
//                var responseString = await response.Content.ReadAsStringAsync();
//                var responseData = JsonSerializer.Deserialize<OllamaResponse>(responseString);
//                return await ProcessApiResponse(response);
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine($"GenerateResponseAsync error: {ex.Message}");
//                throw; // Re-throw for upstream handling
//            }
//        }

//        private async Task<string> ProcessApiResponse(HttpResponseMessage response)
//        {
//            var responseString = await response.Content.ReadAsStringAsync();

//            // Try parsing as single JSON first
//            try
//            {
//                Console.WriteLine($"Raw JSON Response: {responseString}");
//                var responseData = JsonSerializer.Deserialize<OllamaResponse>(responseString);
//                if (!string.IsNullOrEmpty(responseData?.Response))
//                {
//                    return responseData.Response;
//                }
//            }
//            catch (JsonException) { /* Ignore and try streaming approach */ }

//            // Fallback to streaming NDJSON parsing
//            try
//            {
//                using var stream = await response.Content.ReadAsStreamAsync();
//                using var reader = new StreamReader(stream);

//                var responseBuilder = new StringBuilder();
//                string line;

//                while ((line = await reader.ReadLineAsync()) != null)
//                {
//                    if (string.IsNullOrWhiteSpace(line)) continue;

//                    try
//                    {
//                        var partialResponse = JsonSerializer.Deserialize<OllamaResponse>(line);
//                        if (partialResponse?.Response != null)
//                        {
//                            responseBuilder.Append(partialResponse.Response);
//                        }
//                    }
//                    catch (JsonException ex)
//                    {
//                        Console.WriteLine($"JSON parsing warning: {ex.Message}");
//                    }
//                }

//                return responseBuilder.Length > 0
//                    ? responseBuilder.ToString()
//                    : "Received empty response from AI model.";
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine($"Response processing failed: {ex.Message}");
//                return "I couldn't process the AI response properly.";
//            }
//        }

//        public async Task<T> ExecuteToolAsync<T>(string toolName, object parameters)
//        {
//            // Implement with proper error handling
//            try
//            {
//                // Your tool execution logic here
//                return default;
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine($"Tool execution error: {ex.Message}");
//                throw;
//            }
//        }

//        private class OllamaResponse
//        {
//            [JsonPropertyName("model")]
//            public string Model { get; set; }

//            [JsonPropertyName("response")]
//            public string Response { get; set; }

//            [JsonPropertyName("done")]
//            public bool Done { get; set; }

//            [JsonPropertyName("created_at")]
//            public string CreatedAt { get; set; }

//            [JsonPropertyName("done_reason")]
//            public string DoneReason { get; set; }

//            // Add this to check for valid content
//            public bool HasContent => !string.IsNullOrWhiteSpace(Response);
//        }
//    }
//}