using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebApplication1.Migrations
{
    /// <inheritdoc />
    public partial class lastmigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AmenityCategory",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "NEWID()"),
                    name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AmenityCategory", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "CancellationPolicies",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    description = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    fullRefundDays = table.Column<int>(type: "int", nullable: true),
                    partialRefundDays = table.Column<int>(type: "int", nullable: true),
                    partialRefundPercentage = table.Column<decimal>(type: "decimal(5,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Cancella__3214EC07F9731500", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Currencies",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    code = table.Column<string>(type: "char(3)", unicode: false, fixedLength: true, maxLength: 3, nullable: false),
                    symbol = table.Column<string>(type: "varchar(5)", unicode: false, maxLength: 5, nullable: false),
                    name = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Currenci__3214EC07C2D97148", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PaymentMethods",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    stripeId = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    stripeCode = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__PaymentM__3214EC07982F688D", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PropertyTypes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    propertyTypeName = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    icon = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Property__3214EC07238ECA57", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "RoomTypes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    roomTypeName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__RoomType__3214EC0769FE7197", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "VerificationStatus",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    value = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Verifica__3214EC0713125C7D", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Amenities",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    categoryId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    icon = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true),
                    createdAt = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Amenitie__3214EC07787697E8", x => x.Id);
                    table.ForeignKey(
                        name: "FK__Amenities__categ__6A30C649",
                        column: x => x.categoryId,
                        principalTable: "AmenityCategory",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    firstName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    lastName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    dateOfBirth = table.Column<DateTime>(type: "datetime", nullable: true),
                    profilePictureURL = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    createdAt = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())"),
                    updatedAt = table.Column<DateTime>(type: "datetime", nullable: true),
                    bio = table.Column<string>(type: "varchar(max)", unicode: false, nullable: true),
                    isHost = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    isVerified = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    verificationStatusId = table.Column<int>(type: "int", nullable: false),
                    isAdmin = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    lastLogin = table.Column<DateTime>(type: "datetime", nullable: true),
                    preferredLanguage = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: true, defaultValue: "en"),
                    currencyId = table.Column<int>(type: "int", nullable: true, defaultValue: 1),
                    UserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    email = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    passwordHash = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    phoneNumber = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Users__3214EC07CF81F701", x => x.Id);
                    table.ForeignKey(
                        name: "FK__Users__currencyI__4CA06362",
                        column: x => x.currencyId,
                        principalTable: "Currencies",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Users__verificat__4BAC3F29",
                        column: x => x.verificationStatusId,
                        principalTable: "VerificationStatus",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    RoleId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Conversations",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    LastMessageAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ApplicationUserId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Conversations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Conversations_AspNetUsers_ApplicationUserId",
                        column: x => x.ApplicationUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Listings",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    hostId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    title = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    description = table.Column<string>(type: "varchar(max)", unicode: false, nullable: true),
                    propertyTypeId = table.Column<int>(type: "int", nullable: false),
                    roomTypeId = table.Column<int>(type: "int", nullable: false),
                    capacity = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
                    bedrooms = table.Column<int>(type: "int", nullable: false),
                    bathrooms = table.Column<int>(type: "int", nullable: false),
                    pricePerNight = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    securityDeposit = table.Column<decimal>(type: "decimal(10,2)", nullable: true),
                    serviceFee = table.Column<decimal>(type: "decimal(10,2)", nullable: true, defaultValue: 0m),
                    addressLine1 = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    addressLine2 = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    city = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    state = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    country = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    postalCode = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: false),
                    latitude = table.Column<decimal>(type: "decimal(10,8)", nullable: true),
                    longitude = table.Column<decimal>(type: "decimal(11,8)", nullable: true),
                    instantBooking = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    createdAt = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())"),
                    updatedAt = table.Column<DateTime>(type: "datetime", nullable: true),
                    minNights = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
                    maxNights = table.Column<int>(type: "int", nullable: false),
                    cancellationPolicyId = table.Column<int>(type: "int", nullable: true),
                    averageRating = table.Column<decimal>(type: "decimal(10,2)", nullable: true),
                    reviewCount = table.Column<int>(type: "int", nullable: true, defaultValue: 0),
                    isActive = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    currencyId = table.Column<int>(type: "int", nullable: true, defaultValue: 1),
                    verificationStatusId = table.Column<int>(type: "int", nullable: false, defaultValue: 1)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Listings__3214EC0736988D9A", x => x.Id);
                    table.ForeignKey(
                        name: "FK__Listing__verificat__4BAC3F29",
                        column: x => x.verificationStatusId,
                        principalTable: "VerificationStatus",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Listings__cancel__5CD6CB2B",
                        column: x => x.cancellationPolicyId,
                        principalTable: "CancellationPolicies",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Listings__curren__5DCAEF64",
                        column: x => x.currencyId,
                        principalTable: "Currencies",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Listings__hostId__59FA5E80",
                        column: x => x.hostId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK__Listings__proper__5AEE82B9",
                        column: x => x.propertyTypeId,
                        principalTable: "PropertyTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK__Listings__roomTy__5BE2A6F2",
                        column: x => x.roomTypeId,
                        principalTable: "RoomTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Wishlist",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    userId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    isPublic = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    createdAt = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Wishlist__3214EC075E6F8444", x => x.Id);
                    table.ForeignKey(
                        name: "FK__Wishlist__userId__7B5B524B",
                        column: x => x.userId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ChatMessages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsFromUser = table.Column<bool>(type: "bit", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Timestamp = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ConversationId = table.Column<string>(type: "nvarchar(450)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ChatMessages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ChatMessages_Conversations_ConversationId",
                        column: x => x.ConversationId,
                        principalTable: "Conversations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AdditionalInformation",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    listingId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    data = table.Column<string>(type: "varchar(max)", unicode: false, nullable: false),
                    description = table.Column<string>(type: "varchar(max)", unicode: false, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Additio__3214EC07F0A1500F", x => x.Id);
                    table.ForeignKey(
                        name: "FK__Additiona__listi__7D439ABD",
                        column: x => x.listingId,
                        principalTable: "Listings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AvailabilityCalendar",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    listingId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    date = table.Column<DateTime>(type: "date", nullable: false),
                    isAvailable = table.Column<bool>(type: "bit", nullable: true),
                    specialPrice = table.Column<decimal>(type: "decimal(10,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Availabi__3214EC076FC3A8E2", x => x.Id);
                    table.ForeignKey(
                        name: "FK__Availabil__listi__07C12930",
                        column: x => x.listingId,
                        principalTable: "Listings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Bookings",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    guestId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    listingId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    checkInDate = table.Column<DateTime>(type: "date", nullable: false),
                    checkOutDate = table.Column<DateTime>(type: "date", nullable: false),
                    guestsCount = table.Column<int>(type: "int", nullable: false),
                    totalPrice = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    status = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: false, defaultValue: "Pending"),
                    bookingDate = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())"),
                    updatedAt = table.Column<DateTime>(type: "datetime", nullable: true),
                    specialRequests = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    cancellationReason = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    paymentTimeOut = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "DATEADD(MINUTE, 15, GETDATE())"),
                    paymentIntentId = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Bookings__3214EC07AB24997F", x => x.Id);
                    table.ForeignKey(
                        name: "FK__Bookings__guestI__114A936A",
                        column: x => x.guestId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Bookings__listin__123EB7A3",
                        column: x => x.listingId,
                        principalTable: "Listings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ListingAmenities",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    amenityId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ListingId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__ListingA__3214EC074C630FAB", x => x.Id);
                    table.ForeignKey(
                        name: "FK__ListingAm__Listi__6E01572D",
                        column: x => x.ListingId,
                        principalTable: "Listings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK__ListingAm__ameni__6D0D32F4",
                        column: x => x.amenityId,
                        principalTable: "Amenities",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ListingPhotos",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    listingId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    url = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    caption = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    displayOrder = table.Column<int>(type: "int", nullable: true, defaultValue: 0),
                    isPrimary = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    uploadedAt = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__ListingP__3214EC078C970EA8", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ListingPhotos_Listing",
                        column: x => x.listingId,
                        principalTable: "Listings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Messages",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    senderId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    recipientId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    listingId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    content = table.Column<string>(type: "varchar(max)", unicode: false, nullable: false),
                    sentTime = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())"),
                    ThreadId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    isRead = table.Column<bool>(type: "bit", nullable: true, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Messages__3214EC077DF3B4BD", x => x.Id);
                    table.ForeignKey(
                        name: "FK__Messages__listin__75A278F5",
                        column: x => x.listingId,
                        principalTable: "Listings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK__Messages__recipi__74AE54BC",
                        column: x => x.recipientId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Messages__sender__73BA3083",
                        column: x => x.senderId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "WishlistItems",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    wishlistId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    listingId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    addedAt = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Wishlist__3214EC07B48E1F30", x => x.Id);
                    table.ForeignKey(
                        name: "FK__WishlistI__listi__02084FDA",
                        column: x => x.listingId,
                        principalTable: "Listings",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__WishlistI__wishl__01142BA1",
                        column: x => x.wishlistId,
                        principalTable: "Wishlist",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Payment",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    userId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    bookingId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    amount = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    paymentType = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: false, defaultValue: "AllNow"),
                    transactionId = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    paymentMethodId = table.Column<int>(type: "int", nullable: false),
                    IsSecurityDepositRefunded = table.Column<bool>(type: "bit", nullable: false),
                    paymentDate = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())"),
                    ProccessedAt = table.Column<DateTime>(type: "datetime", nullable: true),
                    receiptUrl = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    failureReason = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    currencyId = table.Column<int>(type: "int", nullable: true, defaultValue: 1),
                    status = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: false, defaultValue: "Pending")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Payment__3214EC074C3E3A00", x => x.Id);
                    table.ForeignKey(
                        name: "FK__Payment__booking__1F98B2C1",
                        column: x => x.bookingId,
                        principalTable: "Bookings",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Payment__currenc__22751F6C",
                        column: x => x.currencyId,
                        principalTable: "Currencies",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Payment__payment__2180FB33",
                        column: x => x.paymentMethodId,
                        principalTable: "PaymentMethods",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Payment__userId__208CD6FA",
                        column: x => x.userId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Reviews",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "(newid())"),
                    bookingId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    reviewerId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    hostId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    listingId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    rating = table.Column<decimal>(type: "decimal(3,1)", nullable: false),
                    comment = table.Column<string>(type: "varchar(max)", unicode: false, nullable: true),
                    hostReply = table.Column<string>(type: "varchar(max)", unicode: false, nullable: true),
                    hostReplyDate = table.Column<DateTime>(type: "datetime", nullable: true),
                    createdAt = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())"),
                    updatedAt = table.Column<DateTime>(type: "datetime", nullable: true),
                    cleanlinessRating = table.Column<decimal>(type: "decimal(3,1)", nullable: false),
                    accuracyRating = table.Column<decimal>(type: "decimal(3,1)", nullable: false),
                    communicationRating = table.Column<decimal>(type: "decimal(3,1)", nullable: false),
                    locationRating = table.Column<decimal>(type: "decimal(3,1)", nullable: false),
                    checkInRating = table.Column<decimal>(type: "decimal(3,1)", nullable: false),
                    valueRating = table.Column<decimal>(type: "decimal(3,1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Reviews__3214EC07F0A1500F", x => x.Id);
                    table.CheckConstraint("CK_Review_AccuracyRating", "[accuracyRating] BETWEEN 0 AND 5");
                    table.CheckConstraint("CK_Review_CheckInRating", "[checkInRating] BETWEEN 0 AND 5");
                    table.CheckConstraint("CK_Review_CleanlinessRating", "[cleanlinessRating] BETWEEN 0 AND 5");
                    table.CheckConstraint("CK_Review_CommunicationRating", "[communicationRating] BETWEEN 0 AND 5");
                    table.CheckConstraint("CK_Review_LocationRating", "[locationRating] BETWEEN 0 AND 5");
                    table.CheckConstraint("CK_Review_Rating", "[rating] BETWEEN 0 AND 5");
                    table.CheckConstraint("CK_Review_ValueRating", "[valueRating] BETWEEN 0 AND 5");
                    table.ForeignKey(
                        name: "FK__Reviews__booking__2FCF1A8A",
                        column: x => x.bookingId,
                        principalTable: "Bookings",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Reviews__hostId__31B762FC",
                        column: x => x.hostId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK__Reviews__listing__32AB8735",
                        column: x => x.listingId,
                        principalTable: "Listings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK__Reviews__reviewe__30C33EC3",
                        column: x => x.reviewerId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_AdditionalInformation_listingId",
                table: "AdditionalInformation",
                column: "listingId");

            migrationBuilder.CreateIndex(
                name: "IX_Amenities_categoryId",
                table: "Amenities",
                column: "categoryId");

            migrationBuilder.CreateIndex(
                name: "UQ__Amenitie__72E12F1B86B281BB",
                table: "Amenities",
                column: "name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_currencyId",
                table: "AspNetUsers",
                column: "currencyId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_verificationStatusId",
                table: "AspNetUsers",
                column: "verificationStatusId");

            migrationBuilder.CreateIndex(
                name: "UQ__Users__4849DA01544ADDB8",
                table: "AspNetUsers",
                column: "phoneNumber",
                unique: true,
                filter: "[phoneNumber] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "UQ__Users__AB6E6164CADE8B40",
                table: "AspNetUsers",
                column: "email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "UX_Calendar",
                table: "AvailabilityCalendar",
                columns: new[] { "listingId", "date" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Bookings_DateRange",
                table: "Bookings",
                columns: new[] { "listingId", "checkInDate", "checkOutDate" });

            migrationBuilder.CreateIndex(
                name: "IX_Bookings_GuestId",
                table: "Bookings",
                column: "guestId");

            migrationBuilder.CreateIndex(
                name: "IX_Bookings_Status",
                table: "Bookings",
                column: "status");

            migrationBuilder.CreateIndex(
                name: "IX_ChatMessages_ConversationId",
                table: "ChatMessages",
                column: "ConversationId");

            migrationBuilder.CreateIndex(
                name: "IX_Conversations_ApplicationUserId",
                table: "Conversations",
                column: "ApplicationUserId");

            migrationBuilder.CreateIndex(
                name: "UQ__Currenci__357D4CF90BB6C97F",
                table: "Currencies",
                column: "code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ListingAmenities_amenityId",
                table: "ListingAmenities",
                column: "amenityId");

            migrationBuilder.CreateIndex(
                name: "IX_ListingAmenities_ListingId",
                table: "ListingAmenities",
                column: "ListingId");

            migrationBuilder.CreateIndex(
                name: "UX_Listing_Photos_Primary",
                table: "ListingPhotos",
                column: "listingId",
                unique: true,
                filter: "([isPrimary]=(1))");

            migrationBuilder.CreateIndex(
                name: "IX_Listings_cancellationPolicyId",
                table: "Listings",
                column: "cancellationPolicyId");

            migrationBuilder.CreateIndex(
                name: "IX_Listings_Capacity",
                table: "Listings",
                column: "capacity");

            migrationBuilder.CreateIndex(
                name: "IX_Listings_currencyId",
                table: "Listings",
                column: "currencyId");

            migrationBuilder.CreateIndex(
                name: "IX_Listings_HostId",
                table: "Listings",
                column: "hostId");

            migrationBuilder.CreateIndex(
                name: "IX_Listings_Location",
                table: "Listings",
                columns: new[] { "city", "state", "country" });

            migrationBuilder.CreateIndex(
                name: "IX_Listings_Price",
                table: "Listings",
                column: "pricePerNight");

            migrationBuilder.CreateIndex(
                name: "IX_Listings_propertyTypeId",
                table: "Listings",
                column: "propertyTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Listings_roomTypeId",
                table: "Listings",
                column: "roomTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Listings_verificationStatusId",
                table: "Listings",
                column: "verificationStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_Messages_listingId",
                table: "Messages",
                column: "listingId");

            migrationBuilder.CreateIndex(
                name: "IX_Messages_recipientId",
                table: "Messages",
                column: "recipientId");

            migrationBuilder.CreateIndex(
                name: "IX_Messages_SenderRecipient",
                table: "Messages",
                columns: new[] { "senderId", "recipientId" });

            migrationBuilder.CreateIndex(
                name: "IX_Payment_bookingId",
                table: "Payment",
                column: "bookingId");

            migrationBuilder.CreateIndex(
                name: "IX_Payment_currencyId",
                table: "Payment",
                column: "currencyId");

            migrationBuilder.CreateIndex(
                name: "IX_Payment_paymentMethodId",
                table: "Payment",
                column: "paymentMethodId");

            migrationBuilder.CreateIndex(
                name: "IX_Payment_userId",
                table: "Payment",
                column: "userId");

            migrationBuilder.CreateIndex(
                name: "IX_Reviews_hostId",
                table: "Reviews",
                column: "hostId");

            migrationBuilder.CreateIndex(
                name: "IX_Reviews_ListingId",
                table: "Reviews",
                column: "listingId");

            migrationBuilder.CreateIndex(
                name: "IX_Reviews_reviewerId",
                table: "Reviews",
                column: "reviewerId");

            migrationBuilder.CreateIndex(
                name: "UQ_ReviewBooking",
                table: "Reviews",
                columns: new[] { "bookingId", "reviewerId" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "UX_ReviewBooking",
                table: "Reviews",
                columns: new[] { "bookingId", "reviewerId" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Wishlist_userId",
                table: "Wishlist",
                column: "userId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_WishlistItems_listingId",
                table: "WishlistItems",
                column: "listingId");

            migrationBuilder.CreateIndex(
                name: "IX_WishlistItems_Lookup",
                table: "WishlistItems",
                columns: new[] { "wishlistId", "listingId" });

            migrationBuilder.CreateIndex(
                name: "UQ_WishlistItem",
                table: "WishlistItems",
                columns: new[] { "wishlistId", "listingId" },
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AdditionalInformation");

            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "AvailabilityCalendar");

            migrationBuilder.DropTable(
                name: "ChatMessages");

            migrationBuilder.DropTable(
                name: "ListingAmenities");

            migrationBuilder.DropTable(
                name: "ListingPhotos");

            migrationBuilder.DropTable(
                name: "Messages");

            migrationBuilder.DropTable(
                name: "Payment");

            migrationBuilder.DropTable(
                name: "Reviews");

            migrationBuilder.DropTable(
                name: "WishlistItems");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "Conversations");

            migrationBuilder.DropTable(
                name: "Amenities");

            migrationBuilder.DropTable(
                name: "PaymentMethods");

            migrationBuilder.DropTable(
                name: "Bookings");

            migrationBuilder.DropTable(
                name: "Wishlist");

            migrationBuilder.DropTable(
                name: "AmenityCategory");

            migrationBuilder.DropTable(
                name: "Listings");

            migrationBuilder.DropTable(
                name: "CancellationPolicies");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "PropertyTypes");

            migrationBuilder.DropTable(
                name: "RoomTypes");

            migrationBuilder.DropTable(
                name: "Currencies");

            migrationBuilder.DropTable(
                name: "VerificationStatus");
        }
    }
}
