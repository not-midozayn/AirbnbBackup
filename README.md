# Airbnb Clone

A full-stack web application that replicates the core functionality of Airbnb, allowing users to list properties, search for accommodations, and make bookings.

## 🚀 Features

### User Management
- User registration and authentication
- Profile management and verification
- Host and guest profiles
- Password reset functionality

### Property Listings
- Create, edit, and delete property listings
- Upload multiple property images
- Set property details (location, amenities, pricing)
- Property availability calendar
- Real-time property search and filtering

### Booking System
- Search properties by location, dates, and guests
- Interactive booking calendar
- Instant booking and request-to-book options
- Booking management for hosts and guests
- Payment integration

### User Experience
- Responsive design for mobile and desktop
- Interactive maps integration
- Advanced search filters
- User reviews and ratings
- Wishlist functionality

## 🛠️ Tech Stack

### Frontend
- **Framework:** Angular with HTML
- **Styling:** CSS/Tailwind CSS
- **State Management:** Angular Signals

### Backend
- **Runtime:** ASP.NET Core 9.0
- **Framework:** Entity Framework Core/ASP.NET Core 9.0
- **Database:** Microsoft SQL Server
- **Authentication:** JWT

### Additional Services
- **Maps:** Google Maps API
- **Payments:** Stripe
- **Email:** MailHog

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

- Visual Studio Community
- Visual Studio Code
- Node.js
- npm
- Angular CLI
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Git

## 🔧 Installation

### 1. Clone the Repository
```bash
git clone https://github.com/not-midozayn/Airbnb_Clone.git
cd Airbnb_Clone
```

### 2. Frontend Setup
```bash
# Navigate to frontend directory and install dependencies
cd Airbnb-Frontend
npm install
```

### 3. Backend Setup

#### Database Configuration
1. Open the solution file: `Airbnb-Backend\WebApplication1.sln`
2. Install required NuGet packages:
   - Entity Framework Core
   - Entity Framework Power Tools
3. Delete the existing migrations folder: `Airbnb-Backend\WebApplication1\Migrations`
4. Run these commands in the Package Manager Console:
   ```bash
   add-migration M1 -context AirbnbDBContext
   Update-Database -Context AirbnbDBContext
   ```

#### Database Population
1. Open SQL Server Management Studio (SSMS)
2. Run the script: `Additional Files\final Database Script.sql`
3. Replace the uploads folder at `Airbnb-Backend\WebApplication1\wwwroot\uploads` with the content from `Additional Files\uploads.rar`

#### Environment Configuration
Update the following settings in `Airbnb-Backend\WebApplication1\appsettings.json`:
- Connection string
- Email settings

**Default Password:** All users in the database have the password `Password@1`

### 4. Stripe Setup
1. Install Stripe CLI on your device and add it to environment variables
2. Add Stripe secrets as specified in `Additional Files\Stripe Secrets.txt`
3. Open command prompt and run:
   ```bash
   stripe listen --forward-to https://localhost:7200/api/payment/webhook
   ```

### 5. File Storage Configuration
- Profile pictures: `Airbnb-Backend\WebApplication1\wwwroot\uploads\profiles`
- Listing pictures: `Airbnb-Backend\WebApplication1\wwwroot\uploads`
- Database stores only the file paths

### 6. Google Maps API
Configure your Google Maps API key in the application settings.

## 🚀 Running the Application

### Backend (ASP.NET Core)
1. Open Visual Studio Community
2. Load the solution file: `Airbnb-Backend\WebApplication1.sln`
3. Click "Run" or press F5

### Frontend (Angular)
```bash
cd Airbnb-Frontend
npm start
```

### Production Build
```bash
# Build the frontend application
npm run build

# Start production server
npm start
```

**Application URLs:**
- Frontend: `http://localhost:4200`
- Backend API: `https://localhost:7200`

## 📚 API Documentation

### Authentication Endpoints
- `POST /api/Account/Register` - Register new user
- `POST /api/Account/Login` - User login
- `POST /api/Account/Logout` - User logout
- `POST /api/Account/ChangePassword` - Change password
- `POST /api/Account/ForgotPassword` - Request password reset
- `POST /api/Account/ResetPassword` - Reset password
- `GET /api/Account/CurrentUser` - Get current user info

### Property Endpoints
- `GET /api/Property` - Get all properties
- `GET /api/Property/{id}` - Get property by ID
- `POST /api/Property` - Create new property
- `PUT /api/Property/{id}` - Update property
- `DELETE /api/Property/{id}` - Delete property
- `GET /api/Property/Search` - Search properties
- `GET /api/Property/Categories` - Get property categories
- `GET /api/Property/Types` - Get property types
- `GET /api/Property/Amenities` - Get available amenities
- `GET /api/Property/MyListings` - Get host's properties

### Booking Endpoints
- `GET /api/Booking` - Get all bookings
- `GET /api/Booking/{id}` - Get booking by ID
- `POST /api/Booking` - Create new booking
- `PUT /api/Booking/{id}` - Update booking
- `DELETE /api/Booking/{id}` - Cancel booking
- `GET /api/Booking/MyBookings` - Get user's bookings
- `GET /api/Booking/HostBookings` - Get host's property bookings

### User Endpoints
- `GET /api/User/Profile` - Get user profile
- `PUT /api/User/Profile` - Update user profile
- `GET /api/User/{id}` - Get user by ID
- `GET /api/User/Hosts` - Get all hosts
- `PUT /api/User/BecomeHost` - Update user to host status

### Wishlist Endpoints
- `GET /api/Wishlist` - Get user's wishlists
- `POST /api/Wishlist` - Create new wishlist
- `PUT /api/Wishlist/{id}` - Update wishlist
- `DELETE /api/Wishlist/{id}` - Delete wishlist
- `POST /api/Wishlist/AddProperty` - Add property to wishlist
- `DELETE /api/Wishlist/RemoveProperty` - Remove property from wishlist

### Payment Endpoints
- `POST /api/Payment/Create` - Create payment intent
- `POST /api/Payment/Confirm` - Confirm payment
- `GET /api/Payment/History` - Get payment history

### Media Endpoints
- `POST /api/Media/Upload` - Upload media files
- `DELETE /api/Media/{id}` - Delete media file
- `GET /api/Media/Property/{id}` - Get property media

## 📁 Project Structure

```
Airbnb_Clone/
├── Airbnb-Frontend/                    # Angular frontend application
│   ├── src/
│   │   ├── app/
│   │   │   ├── core/                   # Core functionality
│   │   │   │   ├── models/             # Data models
│   │   │   │   ├── services/           # Shared services
│   │   │   │   └── guards/             # Route guards
│   │   │   │
│   │   │   ├── features/               # Feature modules
│   │   │   │   ├── AirbnbYourHome/     # Host features
│   │   │   │   │   ├── add-listing/    # Add new listing
│   │   │   │   │   ├── become-a-host/  # Host onboarding
│   │   │   │   │   ├── host-drafts/    # Draft listings
│   │   │   │   │   └── host-listing/   # Listing management
│   │   │   │   │
│   │   │   │   ├── account-settings/   # User account settings
│   │   │   │   ├── home/               # Homepage component
│   │   │   │   ├── leaflet-map/        # Map functionality
│   │   │   │   ├── listing-card/       # Listing card component
│   │   │   │   ├── listing-details/    # Listing details page
│   │   │   │   ├── property-type/      # Property type selection
│   │   │   │   └── wishlist/           # Wishlist functionality
│   │   │   │
│   │   │   └── shared/                 # Shared components
│   │   ├── assets/                     # Static assets
│   │   └── styles/                     # Global styles
│   │
│   ├── angular.json
│   ├── tailwind.config.js
│   └── package.json
│
├── Airbnb-Backend/                     # ASP.NET Core backend
│   ├── WebApplication1/                # Main API project
│   │   ├── Controllers/                # API endpoints
│   │   ├── Models/                     # Data models
│   │   ├── Services/                   # Business logic
│   │   ├── Mappings/                   # AutoMapper profiles
│   │   ├── Migrations/                 # Database migrations
│   │   ├── wwwroot/uploads/            # File storage
│   │   └── appsettings.json            # Configuration
│   │
│   ├── core/                           # Core business logic
│   │   ├── Models/                     # Domain models
│   │   └── Services/                   # Core services
│   │
│   ├── Repo/                           # Data access layer
│   │   ├── Context/                    # Database context
│   │   └── Repositories/               # Data repositories
│   │
│   └── WebApplication1.sln             # Solution file
│
└── Additional Files/                   # Setup resources
    ├── final Database Script.sql       # Database initialization
    ├── uploads.rar                     # Sample images
    └── Stripe Secrets.txt              # Stripe configuration
```

## 🔐 Security Features

- Input validation and sanitization
- Secure password hashing with ASP.NET Core Identity
- JWT token authentication
- CORS configuration
- File upload restrictions
- SQL injection prevention through Entity Framework

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**not-midozayn**
- GitHub: [@not-midozayn](https://github.com/not-midozayn)

## 🙏 Acknowledgments

- Inspired by Airbnb's user interface and functionality
- Thanks to all contributors who helped improve this project
- Special thanks to the open-source community for the amazing tools and libraries

## 📞 Support

If you have any questions or need help with the project, please:
1. Check the existing issues on GitHub
2. Create a new issue if your problem isn't already reported
3. Provide detailed information about your setup and the issue

## 🔮 Future Enhancements

- [ ] Mobile app development (React Native/Flutter)
- [ ] Advanced recommendation system
- [ ] Multi-language support
- [ ] Real-time notifications
- [ ] Video property tours
- [ ] Social media integration
- [ ] Advanced analytics dashboard
- [ ] AI-powered pricing suggestions

---

⭐ Don't forget to star this repository if you found it helpful!
