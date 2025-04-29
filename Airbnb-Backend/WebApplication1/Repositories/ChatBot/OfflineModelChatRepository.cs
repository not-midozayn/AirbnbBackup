//using System.Text.Json;
//using System.Text.RegularExpressions;
//using Microsoft.EntityFrameworkCore;
//using WebApplication1.DTOS.Booking;
//using WebApplication1.Interfaces;
//using WebApplication1.Interfaces.ChatBot;
//using WebApplication1.Models;
//using WebApplication1.Models.ChatBot;

//namespace WebApplication1.Repositories.ChatBot
//{
//    public class OfflineModelChatRepository : IChatRepository
//    {
//        private readonly IAiRepository _aiService;
//        private readonly AirbnbDBContext _context;
//        private readonly IWishListRepository _wishlistService;
//        private readonly IListing _listingService;
//        private readonly IBooking _bookingService;
//        private readonly IReview _reviewService;
//        private readonly List<string> includeProperties =
//        [
//            "ListingPhotos",
//            "ListingAmenities",
//            "ListingAmenities.Amenity",
//            "Reviews",f
//            "Reviews.Reviewer",
//            "Host"
//        ];

//        public OfflineModelChatRepository(
//            IAiRepository aiService,
//            AirbnbDBContext context,
//            IWishListRepository wishlistService,
//            IListing listingService,
//            IBooking bookingService,
//            IReview reviewService)
//        {
//            _aiService = aiService;
//            _context = context;
//            _wishlistService = wishlistService;
//            _listingService = listingService;
//            _bookingService = bookingService;
//            _reviewService = reviewService;
//        }

//        public async Task<string> CreateNewConversationAsync(string userId)
//        {
//            var conversationId = Guid.NewGuid().ToString();
//            var conversation = new Conversation
//            {
//                Id = conversationId,
//                UserId = userId,
//                CreatedAt = DateTime.UtcNow
//            };
//            // Create initial greeting message from assistant
//            var welcomeMessage = new ChatMessage
//            {
//                UserId = userId,
//                IsFromUser = false,
//                Content = "Hello! I'm your Airbnb assistant. I can help you search for listings, manage your wishlist, make bookings, and more. How can I assist you today?",
//                Timestamp = DateTime.UtcNow,
//                ConversationId = conversationId
//            };
//            _context.Conversations.Add(conversation);
//            _context.ChatMessages.Add(welcomeMessage);
//            await _context.SaveChangesAsync();

//            return conversationId;
//        }

//        public async Task<List<ChatMessage>> GetConversationHistoryAsync(string userId, string conversationId)
//        {
//            return await _context.ChatMessages
//                .Where(m => m.UserId == userId && m.ConversationId == conversationId)
//                .OrderBy(m => m.Timestamp)
//                .ToListAsync();
//        }

//        public async Task<ChatMessage> ProcessMessageAsync(string userId, string message, string conversationId)
//        {
//            // Save user message
//            var userMessage = new ChatMessage
//            {
//                UserId = userId,
//                IsFromUser = true,
//                Content = message,
//                Timestamp = DateTime.UtcNow,
//                ConversationId = conversationId
//            };

//            _context.ChatMessages.Add(userMessage);
//            await _context.SaveChangesAsync();

//            // Get conversation history for context
//            var history = await GetConversationHistoryAsync(userId, conversationId);

//            var conversationText = string.Join("\n", history.Select(m =>
//                m.IsFromUser ? $"User: {m.Content}" : $"Assistant: {m.Content}"));

//            // Step 1: Determine the intent using your existing code
//            var (intentType, parameters) = await DetermineIntentAsync(message, conversationText);

//            // Step 2: Check if the query is Airbnb-related
//            if (!IsAirbnbRelated(message) && intentType == "general_question")
//            {
//                // Create a ChatMessage object instead of returning a string directly
//                var assistantResponseMessage = new ChatMessage // Renamed variable to avoid conflict
//                {
//                    UserId = userId,
//                    IsFromUser = false,
//                    Content = "I'm your Airbnb assistant and can only help with Airbnb-related questions. " +
//                              "Please ask me about searching for listings, making bookings, managing your wishlist, or other Airbnb services.",
//                    Timestamp = DateTime.UtcNow,
//                    ConversationId = conversationId
//                };
//                return assistantResponseMessage;
//            }
//            // Step 3: Handle the intent with appropriate business logic
//            string responseContent = await HandleIntentAsync(userId, intentType, parameters, message, conversationText);

//            var assistantResponseMessageFinal = new ChatMessage // Renamed variable to avoid conflict
//            {
//                UserId = userId,
//                IsFromUser = false,
//                Content = responseContent,
//                Timestamp = DateTime.UtcNow,
//                ConversationId = conversationId
//            };

//            _context.ChatMessages.Add(assistantResponseMessageFinal);
//            await _context.SaveChangesAsync();

//            return assistantResponseMessageFinal;
//        }

//        private async Task<string> HandleIntentAsync(string userId, string intentType, Dictionary<string, object> parameters, string message, string conversationText)
//        {
//            string responseContent;

//            try
//            {
//                switch (intentType)
//                {
//                    case "add_to_wishlist":
//                        responseContent = await HandleAddToWishlistAsync(userId, parameters);
//                        break;
//                    case "search_listings":
//                        responseContent = await HandleSearchListingsAsync(parameters);
//                        break;
//                    case "make_booking":
//                        responseContent = await HandleMakeBookingAsync(userId, parameters);
//                        break;
//                    //case "add_review":
//                    //    responseContent = await HandleAddReviewAsync(userId, parameters);
//                    //    break;
//                    default:
//                        // For general conversation, use the AI service
//                        responseContent = await _aiService.GenerateResponseAsync(message, conversationText);
//                        break;
//                }
//            }
//            catch (Exception ex)
//            {
//                responseContent = $"I encountered an issue while processing your request: {ex.Message}. Could you try again with more details?";
//            }

//            return responseContent;
//        }
//        private async Task<(string Type, Dictionary<string, object> Parameters)> DetermineIntentAsync(string message, string conversationHistory)
//        {
//            // Structured prompt with clear examples
//            var prompt = @"
//Task: Determine the user's intent from their message.
//You must classify the intent into one of these categories:
//- add_to_wishlist: When user wants to add a listing to their wishlist
//- search_listings: When user wants to search for listings with specific criteria
//- make_booking: When user wants to book a listing
//- add_review: When user wants to write a review for a listing
//- general_question: For general questions about Airbnb

//Response format: JSON with 'type' and 'parameters'. For example:
//{""type"": ""add_to_wishlist"", ""parameters"": {""listingName"": ""Beach House""}}

//Examples:
//User: Add Beach House to my wishlist
//Response: {""type"": ""add_to_wishlist"", ""parameters"": {""listingName"": ""Beach House""}}

//User: Find me a place in Paris with 2 bedrooms
//Response: {""type"": ""search_listings"", ""parameters"": {""location"": ""Paris"", ""bedrooms"": 2}}

//User: Book Mountain Cabin for 3 nights with 2 guests
//Response: {""type"": ""make_booking"", ""parameters"": {""listingName"": ""Mountain Cabin"", ""nights"": 3, ""guests"": 2}}

//User message: """ + message + @"""
//Your response (JSON only):";

//            var response = await _aiService.GenerateResponseAsync(prompt, "");

//            // Extract JSON using regex
//            var jsonMatch = Regex.Match(response, @"\{.*\}", RegexOptions.Singleline);

//            if (jsonMatch.Success)
//            {
//                try
//                {
//                    var jsonStr = jsonMatch.Value;
//                    var intentObj = JsonSerializer.Deserialize<JsonElement>(jsonStr);

//                    var type = intentObj.GetProperty("type").GetString() ?? "general_question";
//                    var parameters = new Dictionary<string, object>();

//                    if (intentObj.TryGetProperty("parameters", out var paramsElement) &&
//                        paramsElement.ValueKind == JsonValueKind.Object)
//                    {
//                        foreach (var param in paramsElement.EnumerateObject())
//                        {
//                            parameters[param.Name] = param.Value.ValueKind switch
//                            {
//                                JsonValueKind.String => param.Value.GetString(),
//                                JsonValueKind.Number => param.Value.GetInt32(),
//                                JsonValueKind.True => true,
//                                JsonValueKind.False => false,
//                                _ => null
//                            };
//                        }
//                    }

//                    return (type, parameters);
//                }
//                catch
//                {
//                    // If JSON parsing fails, try to extract intent through pattern matching
//                    return ExtractIntentWithPatterns(message);
//                }
//            }

//            // Fallback to pattern matching
//            return ExtractIntentWithPatterns(message);
//        }

//        // Add pattern-based intent extraction as fallback
//        private (string Type, Dictionary<string, object> Parameters) ExtractIntentWithPatterns(string message)
//        {
//            string lowercaseMsg = message.ToLower();

//            // Add to wishlist patterns
//            if (lowercaseMsg.Contains("add") && (lowercaseMsg.Contains("wishlist") || lowercaseMsg.Contains("favorite")))
//            {
//                // Extract listing name
//                string listingName = ExtractListingName(message);
//                return ("add_to_wishlist", new Dictionary<string, object> { { "listingName", listingName } });
//            }

//            // Search patterns
//            if ((lowercaseMsg.Contains("search") || lowercaseMsg.Contains("find") || lowercaseMsg.Contains("look for"))
//                && (lowercaseMsg.Contains("listing") || lowercaseMsg.Contains("place") || lowercaseMsg.Contains("stay")))
//            {
//                var parameters = new Dictionary<string, object>();

//                // Extract location
//                var locationMatch = Regex.Match(message, @"in\s+([A-Za-z\s]+)");
//                if (locationMatch.Success)
//                {
//                    parameters["location"] = locationMatch.Groups[1].Value.Trim();
//                }

//                // Extract bedrooms
//                var bedroomsMatch = Regex.Match(message, @"(\d+)\s+bedroom");
//                if (bedroomsMatch.Success)
//                {
//                    parameters["bedrooms"] = int.Parse(bedroomsMatch.Groups[1].Value);
//                }

//                return ("search_listings", parameters);
//            }

//            // Booking patterns
//            if (lowercaseMsg.Contains("book") || lowercaseMsg.Contains("reserve"))
//            {
//                var parameters = new Dictionary<string, object>();

//                // Extract listing name
//                string listingName = ExtractListingName(message);
//                parameters["listingName"] = listingName;

//                // Extract nights
//                var nightsMatch = Regex.Match(message, @"(\d+)\s+night");
//                if (nightsMatch.Success)
//                {
//                    parameters["nights"] = int.Parse(nightsMatch.Groups[1].Value);
//                }

//                // Extract guests
//                var guestsMatch = Regex.Match(message, @"(\d+)\s+guest");
//                if (guestsMatch.Success)
//                {
//                    parameters["guests"] = int.Parse(guestsMatch.Groups[1].Value);
//                }

//                return ("make_booking", parameters);
//            }

//            // Review patterns
//            if (lowercaseMsg.Contains("review") || lowercaseMsg.Contains("rate") ||
//                lowercaseMsg.Contains("stars") || lowercaseMsg.Contains("rating"))
//            {
//                var parameters = new Dictionary<string, object>();

//                // Extract listing name
//                string listingName = ExtractListingName(message);
//                parameters["listingName"] = listingName;

//                // Extract rating
//                var ratingMatch = Regex.Match(message, @"(\d+)\s+star");
//                if (ratingMatch.Success)
//                {
//                    parameters["rating"] = int.Parse(ratingMatch.Groups[1].Value);
//                }

//                // Extract comment
//                var commentMatch = Regex.Match(message, @"(saying|comment|review)\s+(.+)$");
//                if (commentMatch.Success)
//                {
//                    parameters["comment"] = commentMatch.Groups[2].Value.Trim();
//                }

//                return ("add_review", parameters);
//            }

//            // Default to general question
//            return ("general_question", new Dictionary<string, object>());
//        }

//        private string ExtractListingName(string message)
//        {
//            // Try to extract listing name using common patterns
//            var patterns = new List<string>
//            {
//                @"add\s+(.+?)\s+to",
//                @"book\s+(.+?)\s+for",
//                @"review\s+(.+?)\s+with",
//                @"review\s+(.+?)\s+saying",
//                @"rate\s+(.+?)\s+with"
//            };

//            foreach (var pattern in patterns)
//            {
//                var match = Regex.Match(message, pattern, RegexOptions.IgnoreCase);
//                if (match.Success)
//                {
//                    return match.Groups[1].Value.Trim();
//                }
//            }

//            // If no pattern matches, use a more general approach
//            var words = message.Split(' ');
//            for (int i = 0; i < words.Length - 1; i++)
//            {
//                // Look for common indicators that the next words might be a listing name
//                if (words[i].ToLower() == "add" || words[i].ToLower() == "book" ||
//                    words[i].ToLower() == "review" || words[i].ToLower() == "rate")
//                {
//                    // Take the next 2-4 words as a potential listing name
//                    var nameWords = words.Skip(i + 1).Take(Math.Min(4, words.Length - i - 1));
//                    var potentialName = string.Join(" ", nameWords);

//                    // Stop at common stop words
//                    potentialName = Regex.Split(potentialName, @"\sto\s|\sfor\s|\swith\s|\ssaying\s")[0];

//                    return potentialName.Trim();
//                }
//            }

//            // Last resort: return the whole message without common keywords
//            return Regex.Replace(message, @"\b(add|book|review|rate|to|wishlist|favorite|for|with|nights|guests|stars)\b", "", RegexOptions.IgnoreCase).Trim();
//        }



//        private bool IsAirbnbRelated(string message)
//        {
//            // Simple check for Airbnb-related keywords
//            string lowercaseMsg = message.ToLower();
//            string[] airbnbKeywords = new[] {"airbnb", "booking", "listing", "host", "stay", "accommodation",
//                                    "reservation", "wishlist", "review", "property", "check-in", "check-out"};

//            return airbnbKeywords.Any(keyword => lowercaseMsg.Contains(keyword));
//        }

//        //public async Task<string> ProcessUserMessageAsync(string userMessage, string conversationHistory)
//        //{
//        //    // Step 1: Determine the intent using your existing code
//        //    var (intentType, parameters) = await DetermineIntentAsync(userMessage, conversationHistory);

//        //    // Step 2: Check if the query is Airbnb-related
//        //    if (!IsAirbnbRelated(userMessage) && intentType == "general_question")
//        //    {
//        //        return "I'm your Airbnb assistant and can only help with Airbnb-related questions. " +
//        //               "Please ask me about searching for listings, making bookings, managing your wishlist, or other Airbnb services.";
//        //    }

//        //    // Step 3: Handle the intent with appropriate business logic
//        //    var response = await HandleIntentAsync(userId, intentType, parameters, userMessage, conversationHistory);
//        //    return response;
//        //}

//        private async Task<string> HandleAddToWishlistAsync(string String_userId, Dictionary<string, object> parameters)
//        {
//            var searchCriteriaString = DictionaryParser(parameters);
//            string listingName = null;

//            // Check multiple possible key variations
//            foreach (var key in new[] { "listingName", "listing", "name", "listing_name", "listing name" })
//            {
//                if (searchCriteriaString.TryGetValue(key, out var value) && !string.IsNullOrEmpty(value))
//                {
//                    listingName = value.ToString();
//                    break;
//                }
//            }

//            if (string.IsNullOrEmpty(listingName))
//            {
//                return "I couldn't determine which listing you want to add to your wishlist. Could you specify the listing name?";
//            }

//            var listing = await GetListingsWithDetails(searchCriteriaString);
//            var firstListing = listing.FirstOrDefault();
//            if (listing == null)
//            {
//                return $"I couldn't find a listing called '{listingName}'. Please check the name and try again.";
//            }
//            Guid userId = Guid.Parse(String_userId);
//            // Check if user has a default wishlist or create one
//            var wishlist = await _wishlistService.GetUserWishlistsAsync(userId);


//            await _wishlistService.AddItemToWishlistAsync(userId, firstListing.Id);

//            return $"Great! I've added '{firstListing.Title}' to your wishlist.";
//        }

//        private async Task<string> HandleSearchListingsAsync(Dictionary<string, object> parameters)
//        {

//            var searchCriteriaString = DictionaryParser(parameters);
//            // Perform search
//            var listings = await GetListingsWithDetails(searchCriteriaString);

//            if (listings == null || !listings.Any())
//            {
//                return "I couldn't find any listings matching your criteria. Try adjusting your search parameters.";
//            }

//            // Format results
//            var resultText = $"I found {listings.Count()} listings matching your criteria:\n\n";
//            foreach (var listing in listings.Take(5))
//            {
//                resultText += $"• {listing.Title} - {listing.PricePerNight:C} per night - {listing.Country}\n";
//            }

//            if (listings.Count() > 5)
//            {
//                resultText += $"\nAnd {listings.Count() - 5} more results. You can view all results on the search page.";
//            }

//            return resultText;
//        }

//        private async Task<string> HandleMakeBookingAsync(string userId, Dictionary<string, object> parameters)
//        {
//            if (!parameters.TryGetValue("listingName", out var listingNameObj) || listingNameObj is not string listingName)
//            {
//                return "I need the name of the listing you want to book. Please specify the listing name.";
//            }

//            var searchCriteriaString = DictionaryParser(parameters);

//            // Get default values for missing parameters
//            int guests = 1;
//            int nights = 1;
//            DateTime checkIn = DateTime.Now.AddDays(1);

//            if (parameters.TryGetValue("guests", out var guestsObj) && guestsObj is int guestsVal)
//            {
//                guests = guestsVal;
//            }

//            if (parameters.TryGetValue("nights", out var nightsObj) && nightsObj is int nightsVal)
//            {
//                nights = nightsVal;
//            }

//            // Find the listing
//            var listingArray = await GetListingsWithDetails(searchCriteriaString);
//            var listing = listingArray.FirstOrDefault(l =>
//                l.Title.Contains(listingName, StringComparison.OrdinalIgnoreCase)
//            );
//            if (listing == null)
//            {
//                return $"I couldn't find a listing called '{listingName}'. Please check the name and try again.";
//            }

//            var booking = new CreateBookingDTO
//            {
//                ListingId = listing.Id,
//                CheckInDate = checkIn,
//                CheckOutDate = checkIn.AddDays(nights),
//                GuestsCount = guests,
//                SpecialRequests = parameters.ContainsKey("specialRequests") ? parameters["specialRequests"].ToString() : null
//            };
//            var bookingId = await _bookingService.CreateBooking(booking);

//            return $"I've started a booking for '{listing.Title}' for {guests} guest(s) for {nights} night(s) starting {checkIn:d}. " +
//                   $"The total price would be {listing.PricePerNight * nights:C}. You can proceed to payment from your bookings page.";
//        }

//        private async Task<IEnumerable<Listing>> GetListingsWithDetails(Dictionary<string, string> queryParams)
//        {
//            return await GetByNameAsync(queryParams, includeProperties);
//        }
//        private async Task<IEnumerable<Listing>> GetByNameAsync(Dictionary<string, string> queryParams, List<string> includeProperties = null)
//        {
//            // Start with base query
//            IQueryable<Listing> query = _context.Set<Listing>();

//            // Apply name filter if present
//            if (queryParams.TryGetValue("name", out var name) && !string.IsNullOrWhiteSpace(name))
//            {
//                query = query.Where(l => l.Title != null && l.Title.Contains(name));
//            }
//            else
//            {
//                return Enumerable.Empty<Listing>(); // Return empty if no name provided
//            }

//            // Apply includes if specified
//            if (includeProperties != null)
//            {
//                query = includeProperties.Aggregate(query,
//                    (current, property) => current.Include(property));
//            }

//            // Execute query
//            return await query.AsNoTracking().ToListAsync();
//        }

//        private Dictionary<string , string> DictionaryParser (Dictionary<string, object> parameters)
//        {
//            var searchCriteria = new Dictionary<string, object>();
//            foreach (var param in parameters)
//            {
//                if (param.Value != null)
//                {
//                    searchCriteria[param.Key] = param.Value;
//                }
//            }

//            var searchCriteriaString = searchCriteria.ToDictionary(
//                kvp => kvp.Key,
//                kvp => kvp.Value?.ToString() ?? string.Empty
//            );
//            return searchCriteriaString;
//        }

//        // Fix for CS1061: Removed the incorrect inclusion of 'Currency' in the query.  
//        public IEnumerable<Booking> GetUserBookings(Guid userId)
//        {
//            return _context.Bookings
//                .Include(b => b.Listing)
//                .Where(b => b.GuestId == userId)
//                .ToList();
//        }

//        public Booking GetBookingDetails(Guid id)
//        {
//            return _context.Bookings
//                .Include(b => b.Listing)
//                .Include(b => b.Guest)
//                .FirstOrDefault(b => b.Id == id);
//        }
//    }
//}
