USE [AirbnbDB]
GO
SET IDENTITY_INSERT [dbo].[Currencies] ON 
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (1, N'USD', N'$', N'US Dollar')
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (2, N'EUR', N'€', N'Euro')
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (3, N'GBP', N'£', N'British Pound')
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (4, N'JPY', N'¥', N'Japanese Yen')
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (5, N'AUD', N'$', N'Australian Dollar')
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (6, N'CAD', N'$', N'Canadian Dollar')
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (7, N'CHF', N'Fr', N'Swiss Franc')
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (8, N'CNY', N'¥', N'Chinese Yuan')
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (9, N'INR', N'?', N'Indian Rupee')
GO
INSERT [dbo].[Currencies] ([Id], [code], [symbol], [name]) VALUES (10, N'BRL', N'R$', N'Brazilian Real')
GO
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationStatus] ON 
GO
INSERT [dbo].[VerificationStatus] ([Id], [value]) VALUES (1, N'In progress')
GO
INSERT [dbo].[VerificationStatus] ([Id], [value]) VALUES (2, N'Action required')
GO
INSERT [dbo].[VerificationStatus] ([Id], [value]) VALUES (3, N'Verified')
GO
INSERT [dbo].[VerificationStatus] ([Id], [value]) VALUES (4, N'Rejected')
GO
SET IDENTITY_INSERT [dbo].[VerificationStatus] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'00000000-0000-0000-0000-000000000001', N'Admin1', N'User', CAST(N'1980-01-01T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.420' AS DateTime), CAST(N'2025-05-02T16:09:12.677' AS DateTime), N'Platform administrator', 0, 1, 3, 1, CAST(N'2025-04-13T17:14:48.420' AS DateTime), N'en', 1, N'admin', N'ADMIN', N'admin@email.com', N'ADMIN@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEBcW6IQjtvqNwdMpuUdjSFkmbjjIYzpR76AuYE3Ue+nLHrN2uiRCfV4Jr3Fnc3GNYA==', N'B23C89CD-51D6-4DA8-9329-1CD02DB0A8AB', N'ae3b5487-c198-4840-8c45-5da3eb791030', N'+11234567890', 1, 1, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fc54806f-24a2-439b-bbc8-00055fa9f96b', N'mohamed', N'aboseif', CAST(N'2025-04-14T10:41:31.863' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.437' AS DateTime), CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'Stunning experiences in Japan', 0, 1, 1, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'en', 3, N'aboseif@email.com', N'ABOSEIF@EMAIL.COM', N'aboseif@email.com', N'ABOSEIF@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'VL6PK5BJD2RGAWZ4KYO5XX74S5UYW3OP', N'5da2c3db-b306-4b31-b9b2-36bd47bf8c74', N'+01115705310', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'94a27342-1c66-4441-8c3c-1198a3bfb1a0', N'ahmed', N'reda', CAST(N'1982-09-18T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.437' AS DateTime), CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'Amazing places in USA', 0, 1, 3, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'en', 3, N'ahmed@gmail.com', N'AHMED@GMAIL.COM', N'ahmed@gmail.com', N'AHMED@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEANVZhOLLqNyxQjLP8ZOMY/oCpIpwzKYaN3mpaz1+hqITtQiGb02DlCUlyWA7jWvbQ==', N'4ANFLMNTKI5GH3F5OBMNUJYRONE7KAVY', N'2c225e5b-9e17-4be4-a876-5b28db9bd56c', N'+01115703978', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Sarah', N'Chen', CAST(N'1988-05-15T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.437' AS DateTime), CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'Luxury apartment host in Shanghai', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'zh', 4, N'sarah.chen', N'SARAH.CHEN', N'sarah@email.com', N'SARAH@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'2459B67E-1FEA-4FFA-AD5A-BE17D8088844', N'e5f82a33-b664-4d80-93c1-2133b89d275a', N'+862112345678', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1dfd1fb7-86e4-4e15-b70e-1abeec67216e', N'Mohammed', N'Al-Farsi', CAST(N'1975-11-22T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.450' AS DateTime), CAST(N'2025-04-13T17:14:48.450' AS DateTime), N'Traditional riad owner in Marrakech', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.450' AS DateTime), N'ar', 5, N'mohammed', N'MOHAMMED', N'mohammed@email.com', N'MOHAMMED@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'187BE8F6-0FCF-4EDB-A0A9-0A0E7D91B2A2', N'C14E5325-D0F1-48A2-86FE-5A6EB61EF7FD', N'+212612345678', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Maria', N'Garcia', CAST(N'1975-11-22T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.467' AS DateTime), CAST(N'2025-04-13T17:14:48.467' AS DateTime), N'Beach house host in Barcelona', 1, 0, 2, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'es', 2, N'maria.g', N'MARIA.G', N'maria@email.com', N'MARIA@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'045DF0AE-64AF-4B41-8843-37B0AA06B559', N'68e98243-a913-4591-946b-e5950506b10e', N'+34612345678', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3f9a04ff-a8e4-4a9d-9009-2e4095ba8adf', N'James', N'Wilson', CAST(N'1995-03-10T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.480' AS DateTime), CAST(N'2025-04-13T17:14:48.480' AS DateTime), N'Digital nomad exploring Asia', 0, 1, 3, 0, CAST(N'2025-04-13T17:14:48.480' AS DateTime), N'en', 4, N'james.w', N'JAMES.W', N'james@email.com', N'JAMES@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'FDB5D363-F293-4649-AC2C-C5ECBFD37CF5', N'9f0b1a51-9e6d-4e04-b555-a868bad9083f', N'+85212345678', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e3ba2774-bd8b-41fc-aabb-4d4a7f75d82e', N'Alaa', N'galal', CAST(N'2025-04-14T10:41:31.863' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.437' AS DateTime), CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'Onf of a kind Apartment Costarica', 0, 1, 1, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'en', 3, N'ahmedrrredaa@email.com', N'AHMEDRRREDAA@EMAIL.COM', N'ahmedrrredaa@email.com', N'AHMEDRRREDAA@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'3O5CUQVE246ABESGJYYJ45YEKXX7V5ZV', N'43529ff6-4594-4259-a35e-a81c698d4da5', N'+01115706437', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'27d03123-780a-46c5-887d-5060b8084ffe', N'Takeshi', N'Yamamoto', CAST(N'1982-09-18T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.497' AS DateTime), CAST(N'2025-04-13T17:14:48.497' AS DateTime), N'Business apartments near Tokyo Station', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.497' AS DateTime), N'jp', 3, N'takeshi.y', N'TAKESHI.Y', N'takeshi@email.com', N'TAKESHI@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'4BE2A816-2677-4BCB-B165-5B7F9A607319', N'C68B4DFD-BB84-4A22-8618-D40B021920ED', N'+81312345678', 1, 1, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'687d3d4c-d68e-4ce2-a19a-61a40e216f06', N'Claire', N'Dupont', CAST(N'1955-12-05T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.500' AS DateTime), CAST(N'2025-04-13T17:14:48.500' AS DateTime), N'Retired teacher enjoying slow travel', 0, 1, 3, 0, CAST(N'2025-04-13T17:14:48.500' AS DateTime), N'fr', 2, N'claire.dupont', N'CLAIRE.DUPONT', N'claire@email.com', N'CLAIRE@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'A17B6B7A-A9F0-4CEA-98CE-FFAF58190A55', N'1622984D-2BCF-4664-A78F-E32E03DE4218', N'+33612345678', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'15690543-6927-4375-9f41-628b80520190', N'Jack', N'Taylor', CAST(N'1978-03-22T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.513' AS DateTime), CAST(N'2025-04-13T17:14:48.513' AS DateTime), N'Glamping sites across NZ South Island', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'en', 1, N'jack.adventure', N'JACK.ADVENTURE', N'jack@email.com', N'JACK@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'AHXCPHCYAJIQJNXNDO24OTHVFP4LFLXA', N'aaa3ebc4-4e90-46d1-b417-c7772f670486', N'+64211234567', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'500f264e-02ad-4d50-b5bf-6d3113140e13', N'Priya', N'Patel', CAST(N'2000-08-14T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.530' AS DateTime), CAST(N'2025-04-13T17:14:48.530' AS DateTime), N'Exchange student traveling Europe', 0, 1, 1, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'en', 2, N'priya.p', N'PRIYA.P', N'priya@email.com', N'PRIYA@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'194F79D8-A80B-4993-91F0-635F4A8FEDD6', N'84C9B354-8276-4037-99F8-C20736A55772', N'+919876543210', 1, 0, NULL, 1, 3)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6cb6cbd8-4f1a-4b45-ba9e-7990a9de3ccc', N'Fatima', N'Al-Maktoum', CAST(N'1985-11-30T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.550' AS DateTime), CAST(N'2025-04-13T17:14:48.550' AS DateTime), N'Luxury penthouse collections in Dubai', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.550' AS DateTime), N'ar', 6, N'fatima.luxury', N'FATIMA.LUXURY', N'fatima@email.com', N'FATIMA@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'1FB798EE-3B57-4B42-A7B2-DF9A1846886F', N'3E85964E-9381-41DD-8DEE-92D64D276A7E', N'+971501234567', 1, 1, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9a352c04-0608-4aa1-b5fa-80292f8a3271', N'Oliver', N'Kowalski', CAST(N'1991-04-27T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.550' AS DateTime), CAST(N'2025-04-13T17:14:48.550' AS DateTime), N'Co-working spaces in Bangkok and Chiang Mai', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.550' AS DateTime), N'en', 7, N'oliver.nomad', N'OLIVER.NOMAD', N'oliver@email.com', N'OLIVER@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'1501A9EC-EA10-4B79-94F4-F5DF676CC484', N'9ED353AA-1302-4505-BB94-176D851738E4', N'+66812345678', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c9e2c5a8-5460-4496-8f45-810b91abd2ba', N'Sophie', N'Tremblay', CAST(N'1988-07-15T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.553' AS DateTime), CAST(N'2025-04-13T17:14:48.553' AS DateTime), N'Traveling with 2 kids, looking for family-friendly stays', 0, 1, 3, 0, CAST(N'2025-04-13T17:14:48.553' AS DateTime), N'fr', 6, N'sophie.t', N'SOPHIE.T', N'sophie@email.com', N'SOPHIE@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'CF028E17-1AF4-4B20-B9E1-57896DEB044B', N'b6d9b560-677a-42b4-ba60-4006866f4f7d', N'+15871234567', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'339574b6-c010-4cca-a489-8d74f390bb1b', N'Giovanni', N'Rossi', CAST(N'1973-11-03T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.557' AS DateTime), CAST(N'2025-04-13T17:14:48.557' AS DateTime), N'Historic boutique hotel in Florence', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.557' AS DateTime), N'it', 2, N'giovanni.r', N'GIOVANNI.R', N'giovanni@email.com', N'GIOVANNI@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'784EDAA1-0BC6-4979-9A71-5AFC8CDB8788', N'c3f4942e-7eab-4943-87f9-91c45064965d', N'+393331234567', 1, 1, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'19085d5d-96af-4d58-bc31-8dc0762cd8b2', N'Liam', N'Murphy', CAST(N'1999-02-18T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.557' AS DateTime), CAST(N'2025-04-13T17:14:48.557' AS DateTime), N'Gap year traveler on a budget', 0, 0, 1, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'en', 5, N'liam.m', N'LIAM.M', N'liam@email.com', N'LIAM@EMAIL.COM', 0, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'682BEF5C-4D28-4265-A663-90EE9BD1E2A3', N'a697d70d-4f62-46ae-b7ff-0141766d7a68', N'+61412345678', 0, 0, NULL, 1, 2)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'921e688b-a0f1-47f7-b38a-8fe00f621e2e', N'Valentina', N'Lopez', CAST(N'1980-09-25T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.560' AS DateTime), CAST(N'2025-04-13T17:14:48.560' AS DateTime), N'Vineyard stays in Mendoza wine country', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.560' AS DateTime), N'es', 10, N'valentina.vino', N'VALENTINA.VINO', N'valentina@email.com', N'VALENTINA@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'D79EC87C-1257-4044-8D51-2D607ED2F9E2', N'6B522525-7365-4C27-ACF7-7FA49943C3A4', N'+5492612345678', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1189aeb6-8e31-4cc0-a1f3-993efe9515d9', N'Carlos', N'Montero', CAST(N'1976-08-12T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.560' AS DateTime), CAST(N'2025-04-13T17:14:48.560' AS DateTime), N'Sustainable jungle retreats in Manuel Antonio', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.560' AS DateTime), N'es', 1, N'carlos.eco', N'CARLOS.ECO', N'carlos@email.com', N'CARLOS@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'1F2D655A-9657-4064-A4A3-F1FE53B30BE9', N'E7FDEA12-8358-4C70-84FD-96C1D95550B7', N'+50671234567', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd9a827c9-b745-44a9-8c88-9d6a55976dd2', N'Anna', N'Schmidt', CAST(N'1985-03-29T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.563' AS DateTime), CAST(N'2025-04-13T17:14:48.563' AS DateTime), N'Frequent business traveler across Europe', 0, 1, 3, 0, CAST(N'2025-04-13T17:14:48.563' AS DateTime), N'de', 2, N'anna.business', N'ANNA.BUSINESS', N'anna@email.com', N'ANNA@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'0DBCD355-CDF1-4840-8C0D-02081911C4FA', N'352ca57e-f070-4fd5-934d-99729e121d69', N'+4915123456789', 1, 1, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'031676db-1fd0-4893-a458-baa2703dde5c', N'john', N'Hany', CAST(N'2025-04-17T22:39:23.513' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.437' AS DateTime), CAST(N'2025-04-25T16:16:08.743' AS DateTime), N'Historic jungle hotel in Amazon', 0, 1, 3, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'en', 5, N'mo@email.com', N'MO@EMAIL.COM', N'mo@email.com', N'MO@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'YQXNXHLZHATMLOOK7CUOIVTXUYUMB66S', N'b73b2d5e-ddb7-4159-b266-ae5f8604e60c', N'+01115706137', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'804c621f-6be6-48ba-bbc1-c4a90705bd94', N'Fatma', N'Ghonimy', CAST(N'2025-04-14T11:23:29.673' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.437' AS DateTime), CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'Pharonic Places in Egypt', 0, 1, 1, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'en', 7, N'ahmedreda@email.com', N'AHMEDREDA@EMAIL.COM', N'ahmedreda@email.com', N'AHMEDREDA@EMAIL.COM', 0, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'MXZIL6SVVYGLWA7YGBX25DR77L4GIT47', N'02a6ecbe-2db6-46af-8d22-3df49e5e628e', N'+01115709764', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ef094a65-78c8-4c85-a264-c7bc1f70f34b', N'Miguel', N'Santos', CAST(N'1989-06-17T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.567' AS DateTime), CAST(N'2025-04-13T17:14:48.567' AS DateTime), N'Artist loft with creative workshops in Lisbon', 1, 1, 2, 0, CAST(N'2025-04-13T17:14:48.437' AS DateTime), N'pt', 2, N'miguel.art', N'MIGUEL.ART', N'miguel@email.com', N'MIGUEL@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'13DBABC4-D0EF-4D73-9E39-3900BB60D7DD', N'8C13BCBE-5DC7-4D96-AC49-796E273553D9', N'+351912345678', 0, 0, NULL, 1, 1)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1d7be279-7be9-4861-b9fe-de6fbaff3d5b', N'Robert', N'Johnson', CAST(N'1952-11-08T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.567' AS DateTime), CAST(N'2025-04-13T17:14:48.567' AS DateTime), N'Retired couple enjoying our RV adventures', 0, 1, 3, 0, CAST(N'2025-04-13T17:14:48.567' AS DateTime), N'en', 1, N'robert.rv', N'ROBERT.RV', N'robert@email.com', N'ROBERT@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'9EE0D47D-D00D-432C-BA59-22DCDA2735B5', N'900BB628-00F5-45AB-8B00-9CF93D04B76F', N'+12025551234', 1, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [firstName], [lastName], [dateOfBirth], [profilePictureURL], [createdAt], [updatedAt], [bio], [isHost], [isVerified], [verificationStatusId], [isAdmin], [lastLogin], [preferredLanguage], [currencyId], [UserName], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [passwordHash], [SecurityStamp], [ConcurrencyStamp], [phoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'23d411dc-dc91-4c82-948a-f0f7c7f4b903', N'Elise', N'Bernard', CAST(N'1983-01-25T00:00:00.000' AS DateTime), N'/uploads/profiles/profile Picture.jpg', CAST(N'2025-04-13T17:14:48.570' AS DateTime), CAST(N'2025-04-13T17:14:48.570' AS DateTime), N'Alpine chalets in Verbier ski resort', 1, 1, 3, 0, CAST(N'2025-04-13T17:14:48.570' AS DateTime), N'fr', 7, N'elise.ski', N'ELISE.SKI', N'elise@email.com', N'ELISE@EMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB2PWethrX0QnKG07VrOMs0BrJFPdDhmVZCUfJGGHQhsN+t+xDl6q5HucABeZ/hcuA==', N'4A98ECE0-A6E9-4D06-B372-BC9D394814F7', N'0C98F791-44ED-4594-BE15-2830F254A3B8', N'+41791234567', 1, 1, NULL, 1, 0)
GO
INSERT [dbo].[Wishlist] ([Id], [userId], [name], [isPublic], [createdAt]) VALUES (N'9452e679-b760-41d4-81af-201f4a3128ef', N'c9e2c5a8-5460-4496-8f45-810b91abd2ba', N'Wishlist', 1, CAST(N'2025-04-28T14:22:58.927' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([Id], [userId], [name], [isPublic], [createdAt]) VALUES (N'4b6d0a97-7cbf-4f87-b5c3-55dbcf22b7fb', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Wishlist', 1, CAST(N'2025-05-03T03:02:42.273' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([Id], [userId], [name], [isPublic], [createdAt]) VALUES (N'bef402fd-b0eb-4bc5-b9d4-7d7af5257ffd', N'00000000-0000-0000-0000-000000000001', N'Wishlist', 1, CAST(N'2025-05-03T03:37:32.293' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([Id], [userId], [name], [isPublic], [createdAt]) VALUES (N'05b049aa-fc59-4da1-9d4e-f45152df6579', N'15690543-6927-4375-9f41-628b80520190', N'Wishlist', 1, CAST(N'2025-04-28T12:59:57.863' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([Id], [userId], [name], [isPublic], [createdAt]) VALUES (N'206bf037-acd6-4feb-a2f2-f8684f46c09b', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Wishlist', 1, CAST(N'2025-05-03T04:06:01.827' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CancellationPolicies] ON 
GO
INSERT [dbo].[CancellationPolicies] ([Id], [name], [description], [fullRefundDays], [partialRefundDays], [partialRefundPercentage]) VALUES (1, N'Flexible', N'Full refund 1 day before check-in. No refund after Check-in', 1, NULL, NULL)
GO
INSERT [dbo].[CancellationPolicies] ([Id], [name], [description], [fullRefundDays], [partialRefundDays], [partialRefundPercentage]) VALUES (2, N'Moderate', N'Full refund 5 days before check-in. 50% refund if canceled at least 1 day before check-in. No refund for same-day cancellations.', 5, 1, CAST(50.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[CancellationPolicies] ([Id], [name], [description], [fullRefundDays], [partialRefundDays], [partialRefundPercentage]) VALUES (3, N'Strict', N'Full refund 14 days before check-in. No refund if canceled within 14 days of check-in', 14, NULL, NULL)
GO
INSERT [dbo].[CancellationPolicies] ([Id], [name], [description], [fullRefundDays], [partialRefundDays], [partialRefundPercentage]) VALUES (4, N'Super Strict 30 Days', N'Full refund 30 days before check-in. No refund if canceled within 30 days of check-in.', 30, NULL, NULL)
GO
INSERT [dbo].[CancellationPolicies] ([Id], [name], [description], [fullRefundDays], [partialRefundDays], [partialRefundPercentage]) VALUES (5, N'Super Strict 60 Days', N'Full refund 60 days before check-in. No refund if canceled within 60 days of check-in', 60, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[CancellationPolicies] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyTypes] ON 
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (1, N'Apartment', N'uploads/apartment.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (2, N'House', N'uploads/house.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (3, N'Villa', N'uploads/villa.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (4, N'Cottage', N'uploads/cottage.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (5, N'Cabin', N'uploads/cabin.jpg')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (6, N'Bungalow', N'uploads/bungalow.jpg')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (7, N'Chalet', N'uploads/Chalet.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (8, N'Farmhouse', N'uploads/farmhouse.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (9, N'Loft', N'uploads/loft.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (10, N'Penthouse', N'uploads/penthouse.jpg')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (11, N'Studio', N'uploads/studio.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (12, N'Townhouse', N'uploads/townhouse.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (13, N'Condominium', N'uploads/condominium.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (14, N'Castle', N'uploads/castle.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (15, N'Mansion', N'uploads/mansion.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (16, N'Treehouse', N'uploads/treehouse.jpg')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (17, N'Boat', N'uploads/boat.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (18, N'Camper/RV', N'uploads/camper.png')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (19, N'Igloo', N'uploads/igolo.jpg')
GO
INSERT [dbo].[PropertyTypes] ([Id], [propertyTypeName], [icon]) VALUES (20, N'Cave House', N'uploads/caveHouse.jpg')
GO
SET IDENTITY_INSERT [dbo].[PropertyTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (1, N'Standard Room')
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (2, N'Deluxe Room')
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (3, N'Suite')
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (4, N'Executive Room')
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (5, N'Family Room')
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (6, N'Superior Room')
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (7, N'Presidential Suite')
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (8, N'Connecting Rooms')
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (9, N'Accessible Room')
GO
INSERT [dbo].[RoomTypes] ([Id], [roomTypeName]) VALUES (10, N'Penthouse Suite')
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'b00d015a-57ce-46bb-83de-08b5e76f96e7', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Beppu Hot Spring Villa', N'Private villa with multiple onsens (hot springs) in Japan''s most famous hot spring resort. Includes open-air baths with mountain views.', 4, 3, 5, 2, 2, CAST(950.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(75.00 AS Decimal(10, 2)), N'3-4-5 Kannawa', N'', N'Beppu', N'available', N'Japan', N'874-0045', CAST(33.27950000 AS Decimal(10, 8)), CAST(131.49750000 AS Decimal(11, 8)), 1, CAST(N'2024-12-25T08:45:33.000' AS DateTime), CAST(N'2025-05-03T03:53:32.880' AS DateTime), 2, 30, 1, CAST(4.98 AS Decimal(10, 2)), 29, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'9c13901f-c314-4c39-8c78-10eec76758b9', N'15690543-6927-4375-9f41-628b80520190', N'Roppongi Luxury Penthouse', N'This is a new apartment located in the Roppongi/Azabudai area. ?The apartment offers ample security, bathrooms, and free internet, making it suitable for families or friends to stay together for a long time. The apartment is located at Roppongi Station in Tokyo Minato District. It is the intersection of Tokyo Metro Hibiya Line (H-04) and Toei Subway Oedo Line (E-23). ??The apartment is a 6-8 minute walk to the station.', 10, 3, 4, 2, 2, CAST(650.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), N'1-2-3 Roppongi', N'', N'Tokyo', N'available', N'Japan', N'106-0032', CAST(35.66180000 AS Decimal(10, 8)), CAST(139.73170000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.587' AS DateTime), CAST(N'2025-05-03T03:55:08.037' AS DateTime), 3, 14, 1, CAST(4.99 AS Decimal(10, 2)), 47, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'8a23b45c-d314-4e39-9c78-20ffc76758b0', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Shinjuku Modern Loft', N'Stylish loft in the heart of Shinjuku with panoramic city views. Perfect for couples or solo travelers looking to experience Tokyo nightlife. Just 5 mins from Shinjuku Station.', 4, 2, 2, 1, 1, CAST(450.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(35.00 AS Decimal(10, 2)), N'3-27-10 Shinjuku', N'', N'Tokyo', N'available', N'Japan', N'160-0022', CAST(35.69380000 AS Decimal(10, 8)), CAST(139.70350000 AS Decimal(11, 8)), 1, CAST(N'2025-03-15T10:24:18.000' AS DateTime), CAST(N'2025-05-03T03:53:39.127' AS DateTime), 2, 30, 1, CAST(4.85 AS Decimal(10, 2)), 32, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'48cd094f-abda-445c-9f14-2ab47316a4a6', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Kamakura Zen House', N'Peaceful traditional house near Great Buddha and Hase Temple. Features meditation garden and short walk to Yuigahama Beach.', 4, 6, 4, 2, 1, CAST(620.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(10, 2)), N'3-5-22 Hase', N'', N'Kamakura', N'available', N'Japan', N'248-0016', CAST(35.31920000 AS Decimal(10, 8)), CAST(139.54670000 AS Decimal(11, 8)), 1, CAST(N'2025-01-30T09:15:42.000' AS DateTime), CAST(N'2025-05-03T03:53:43.927' AS DateTime), 3, 21, 2, CAST(4.91 AS Decimal(10, 2)), 17, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'7b34c56d-e425-5f40-ad89-31eed87869c1', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Traditional Kyoto Machiya', N'Authentic Kyoto townhouse with modern amenities. Experience traditional Japanese living with tatami rooms and a peaceful garden, located in historic Gion district.', 3, 7, 5, 3, 2, CAST(780.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), N'570-123 Gionmachi', N'', N'Kyoto', N'available', N'Japan', N'605-0074', CAST(35.01160000 AS Decimal(10, 8)), CAST(135.76810000 AS Decimal(11, 8)), 1, CAST(N'2025-02-10T14:35:22.000' AS DateTime), CAST(N'2025-05-03T03:53:49.410' AS DateTime), 4, 60, 1, CAST(4.92 AS Decimal(10, 2)), 28, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'21e8997f-c651-4427-94a5-4f441d1c1678', N'15690543-6927-4375-9f41-628b80520190', N'Authentic Moroccan Riad', N'16th century riad with courtyard pool. Get the celebrity treatment with world-class service at Savoy Le Grand Hotel Marrakech
Offering an outdoor pool, Savoy Le Grand Hotel is set in Marrakech, 500 metres from Menara Gardens. The hotel has a barbecue and a free WiFi is provided throughout the property.', 3, 3, 8, 4, 3, CAST(280.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), N'23 Derb Sidi Bouloukat', N'', N'Marrakech', N'available', N'Morocco', N'40000', CAST(31.62950000 AS Decimal(10, 8)), CAST(7.98110000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.590' AS DateTime), CAST(N'2025-05-03T03:55:26.793' AS DateTime), 2, 30, 2, CAST(5.00 AS Decimal(10, 2)), 63, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Takayama Countryside Farmhouse', N'Charming 150-year-old gassho-zukuri farmhouse in Shirakawa-go style. Experience rural Japan with modern comforts in UNESCO heritage area.', 4, 8, 6, 3, 1, CAST(680.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(10, 2)), N'1234 Ogimachi', N'', N'Takayama', N'available', N'Japan', N'501-5627', CAST(36.14610000 AS Decimal(10, 8)), CAST(137.25220000 AS Decimal(11, 8)), 1, CAST(N'2025-04-05T13:15:27.000' AS DateTime), CAST(N'2025-05-03T03:53:54.337' AS DateTime), 3, 21, 2, CAST(4.93 AS Decimal(10, 2)), 16, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'3826a636-f756-4251-9149-528ed1962cbf', N'15690543-6927-4375-9f41-628b80520190', N'Digital Nomad Hub', N'Modern loft with dedicated workspace. Spacious Accommodation: Casa Lagar de Arume in Parada, Xinzo offers a spacious holiday home with three bedrooms and a private bathroom. The property features a sun terrace and a beautiful garden, ideal for relaxation.

Modern Amenities: Guests enjoy free WiFi, a fully equipped kitchenette, and a private bathroom. Additional facilities include a picnic area, family rooms, bicycle parking, and a tour desk. Free on-site private parking is available.relaxation.', 20, 10, 2, 1, 1, CAST(45.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), N'45 Sukhumvit Soi 11', N'', N'Bangkok', N'available', N'Thailand', N'10110', CAST(8.34050000 AS Decimal(10, 8)), CAST(115.09200000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.597' AS DateTime), CAST(N'2025-05-03T03:55:44.067' AS DateTime), 7, 90, 1, CAST(4.82 AS Decimal(10, 2)), 112, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'75de6533-f54c-4f52-823e-5295bf3ff29b', N'15690543-6927-4375-9f41-628b80520190', N'15th Century Palazzo', N'Renovated historic rooms with frescoes. A 15th-century palazzo stands as a majestic symbol of Renaissance wealth and architectural innovation. Built for a powerful merchant family or noble dynasty, its imposing stone façade reflects both military solidity and refined elegance.', 13, 3, 2, 1, 1, CAST(320.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), N'Via dei Tornabuoni 1', N'', N'Florence', N'available', N'Italy', N'50123', CAST(43.76960000 AS Decimal(10, 8)), CAST(11.25580000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.600' AS DateTime), CAST(N'2025-05-03T03:55:50.767' AS DateTime), 1, 14, 4, CAST(4.95 AS Decimal(10, 2)), 89, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'29a42d61-b4ef-40b9-b19c-52b145c61aab', N'15690543-6927-4375-9f41-628b80520190', N'Burj Khalifa Sky Suite', N'Private elevator to 3-bedroom sky palace. Attractively set in the centre of Dubai, Sky luxe retreat- Luxury Hotel Suite W-Burj khalifa view offers a balcony, air conditioning, free WiFi and flat-screen TV. Boasting a 24-hour front desk, this property also welcomes guests with a restaurant, a water park and a sun terrace.', 10, 7, 6, 3, 4, CAST(2500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), N'1 Sheikh Mohammed bin Rashid Blvd', N'', N'Dubai', N'available', N'UAE', N'00000', CAST(25.19720000 AS Decimal(10, 8)), CAST(55.27440000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.607' AS DateTime), CAST(N'2025-05-03T03:56:08.417' AS DateTime), 2, 7, 5, CAST(4.99 AS Decimal(10, 2)), 24, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Kanazawa Samurai House', N'Authentic restored samurai residence in Nagamachi district. Features original artifacts, tea ceremony room, and private garden.', 4, 8, 4, 2, 1, CAST(720.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), N'1-2-3 Nagamachi', N'', N'Kanazawa', N'available', N'Japan', N'920-0865', CAST(36.56130000 AS Decimal(10, 8)), CAST(136.65620000 AS Decimal(11, 8)), 1, CAST(N'2025-01-08T14:22:18.000' AS DateTime), CAST(N'2025-05-03T03:53:59.167' AS DateTime), 3, 14, 2, CAST(4.96 AS Decimal(10, 2)), 23, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'0aadcb2f-6e36-4dda-a91f-55c53485b637', N'15690543-6927-4375-9f41-628b80520190', N'Bali Ricefield Retreat', N'Private villa with infinity pool overlooking rice terraces. Immerse yourself in the lush tranquility of Bali Ricefield Retreat, where nature and comfort blend seamlessly. Nestled in the vibrant heart of Ubud, this enchanting retreat offers the perfect balance of relaxation and adventure.', 8, 1, 3, 2, 2, CAST(220.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), N'Jalan Raya Campuhan', N'', N'Ubud', N'available', N'Indonesia', N'80573', CAST(8.50690000 AS Decimal(10, 8)), CAST(115.26250000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.610' AS DateTime), CAST(N'2025-05-03T03:56:40.280' AS DateTime), 5, 12, 2, CAST(4.97 AS Decimal(10, 2)), 58, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'd19a26b7-2706-446b-aa77-56b3f47407e6', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Sapporo Ski Chalet', N'Cozy chalet just minutes from Niseko ski slopes. Features heated floors, ski storage, and stunning mountain views. Ideal for winter sports enthusiasts.', 2, 1, 6, 3, 2, CAST(950.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(75.00 AS Decimal(10, 2)), N'2-5-1 Hirafu', N'', N'Sapporo', N'available', N'Japan', N'044-0081', CAST(42.98760000 AS Decimal(10, 8)), CAST(141.19660000 AS Decimal(11, 8)), 1, CAST(N'2024-12-20T08:45:12.000' AS DateTime), CAST(N'2025-05-03T03:54:04.450' AS DateTime), 7, 30, 2, CAST(4.88 AS Decimal(10, 2)), 15, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'16fc94a4-e533-4059-b3cb-69462157698e', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Shinjuku Modern Loft', N'Stylish loft in the heart of Shinjuku with panoramic city views. Perfect for couples or solo travelers looking to experience Tokyo nightlife. Just 5 mins from Shinjuku Station.', 8, 2, 2, 1, 1, CAST(450.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(35.00 AS Decimal(10, 2)), N'3-27-10 Shinjuku', N'', N'Tokyo', N'available', N'Japan', N'160-0022', CAST(8.51930000 AS Decimal(10, 8)), CAST(141.19660000 AS Decimal(11, 8)), 1, CAST(N'2025-03-15T10:24:18.000' AS DateTime), CAST(N'2025-05-03T04:08:21.007' AS DateTime), 2, 30, 2, CAST(4.85 AS Decimal(10, 2)), 32, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', N'15690543-6927-4375-9f41-628b80520190', N'Ubud Jungle Escape', N'Private villa with infinity pool overlooking rice terraces', 3, 1, 4, 2, 2, CAST(220.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), N'Jalan Raya Sanggingan', N'', N'Ubud', N'available', N'Indonesia', N'80571', CAST(8.51930000 AS Decimal(10, 8)), CAST(115.26360000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.610' AS DateTime), CAST(N'2025-05-03T03:56:58.183' AS DateTime), 3, 30, 2, CAST(4.97 AS Decimal(10, 2)), 58, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', N'15690543-6927-4375-9f41-628b80520190', N'Montmartre Artist Loft', N'Historic studio with original easels and north light. Sonder Yvette combines elegance and convenience near Paris Expo and Nature Urbaine, the largest rooftop urban farm. With earthy interiors, hardwood floors, communal spaces, and Eiffel Tower views, it’s ideal for two travelers to relax or stay productive. In the 15th - Tour Eiffel district, enjoy iconic landmarks, cafes, and parks, combining Parisian buzz with tranquility.', 9, 6, 2, 1, 1, CAST(180.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), N'12 Rue Norvins', N'', N'Paris', N'available', N'France', N'75018', CAST(48.88660000 AS Decimal(10, 8)), CAST(2.34310000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.617' AS DateTime), CAST(N'2025-05-03T03:57:32.893' AS DateTime), 2, 21, 1, CAST(4.88 AS Decimal(10, 2)), 76, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'e93f2721-e761-4063-9f83-715fdb1b70db', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Fukuoka Canal City Apartment', N'Modern apartment next to Hakata River and Canal City shopping complex. Perfect for business travelers or couples exploring Kyushu.', 1, 2, 2, 1, 1, CAST(480.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), N'1-2-55 Sumiyoshi', N'', N'Fukuoka', N'available', N'Japan', N'812-0018', CAST(33.59020000 AS Decimal(10, 8)), CAST(130.40170000 AS Decimal(11, 8)), 1, CAST(N'2025-02-18T13:45:33.000' AS DateTime), CAST(N'2025-05-03T03:54:10.833' AS DateTime), 2, 30, 3, CAST(4.83 AS Decimal(10, 2)), 22, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', N'15690543-6927-4375-9f41-628b80520190', N'Table Mountain View', N'360° views with sunset deck and private chef available. Get your trip off to a great start with a stay at this property, which offers free Wi-Fi in all rooms. Strategically situated in V & A Waterfront, allowing you access and proximity to local attractions and sights. Don''t leave before paying a visit to the famous Table Mountain. Rated with 5 stars, this high-quality property provides guests with access to massage, restaurant and fitness center on-site.', 8, 3, 4, 2, 2, CAST(420.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(35.00 AS Decimal(10, 2)), N'1 Silo Square', N'', N'Cape Town', N'available', N'South Africa', N'8001', CAST(33.92490000 AS Decimal(10, 8)), CAST(18.42410000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.623' AS DateTime), CAST(N'2025-05-03T03:58:05.997' AS DateTime), 4, 14, 3, CAST(4.91 AS Decimal(10, 2)), 33, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'8fd9cf49-5134-4b40-89df-83ca18b274a2', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Nagoya Castle View Loft', N'Industrial-chic loft with direct views of Nagoya Castle. Located in vibrant Sakae district with excellent dining and nightlife options.', 10, 2, 3, 1, 1, CAST(550.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), N'4-5-6 Nishiki', N'', N'Nagoya', N'available', N'Japan', N'460-0003', CAST(35.18560000 AS Decimal(10, 8)), CAST(136.89960000 AS Decimal(11, 8)), 1, CAST(N'2025-03-05T14:30:18.000' AS DateTime), CAST(N'2025-05-03T03:54:16.137' AS DateTime), 2, 28, 1, CAST(4.79 AS Decimal(10, 2)), 14, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'6b26b80a-d3b3-4139-bbe4-848f9474f039', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Yokohama Bayview Condo', N'Stylish high-rise condo with panoramic views of Yokohama Bay. Walking distance to Minato Mirai attractions and Chinatown.', 3, 2, 3, 1, 1, CAST(580.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), N'2-3-4 Minatomirai', N'', N'Yokohama', N'available', N'Japan', N'220-0012', CAST(35.44370000 AS Decimal(10, 8)), CAST(139.63800000 AS Decimal(11, 8)), 1, CAST(N'2025-03-12T09:15:22.000' AS DateTime), CAST(N'2025-05-03T03:54:21.400' AS DateTime), 2, 21, 1, CAST(4.89 AS Decimal(10, 2)), 26, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'86134d93-2c95-451c-88e1-9bd850086f4a', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Traditional Machiya', N'200-year-old wooden townhouse near Gion district, Kyoto', 4, 1, 5, 3, 1, CAST(310.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(28.00 AS Decimal(10, 2)), N'Shimogyo Ward', N'', N'Kyoto', N'available', N'Japan', N'600-8001', CAST(36.39320000 AS Decimal(10, 8)), CAST(25.46150000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.623' AS DateTime), CAST(N'2025-05-03T04:07:51.780' AS DateTime), 2, 14, 4, CAST(4.93 AS Decimal(10, 2)), 41, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Caldera Cave Suite', N'Whitewashed cave dwelling with private hot tub and multiple luxerious items', 20, 1, 2, 1, 1, CAST(390.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), N'Nomikos Street', N'', N'Oia', N'available', N'Greece', N'84702', CAST(49.28270000 AS Decimal(10, 8)), CAST(123.12070000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.627' AS DateTime), CAST(N'2025-05-03T04:09:04.830' AS DateTime), 2, 7, 2, CAST(4.96 AS Decimal(10, 2)), 112, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Seawall Condo', N'Floor-to-ceiling windows with harbor views and magnificent places', 4, 1, 4, 2, 2, CAST(275.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), N'1055 Canada Place', N'', N'Vancouver', N'available', N'Canada', N'V6C 0C3', CAST(19.07600000 AS Decimal(10, 8)), CAST(72.87770000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.630' AS DateTime), CAST(N'2025-05-03T04:10:03.427' AS DateTime), 3, 30, 1, CAST(4.79 AS Decimal(10, 2)), 28, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'2a991029-4265-4713-bbc5-aff01ed72820', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Bollywood-Themed Apartment', N'Vibrant decor with film memorabilia collection and beautiful scenaries
', 1, 1, 3, 1, 1, CAST(65.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), N'44 Perry Cross Rd', N'', N'Mumbai', N'available', N'India', N'400026', CAST(8.50240000 AS Decimal(10, 8)), CAST(115.26090000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.633' AS DateTime), CAST(N'2025-05-03T04:10:36.190' AS DateTime), 1, 60, 1, CAST(4.65 AS Decimal(10, 2)), 19, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'0d802abe-e4b1-443a-8900-b914a268de03', N'15690543-6927-4375-9f41-628b80520190', N'Ubud Serene Villa', N'Private villa with infinity pool overlooking rice terraces. Immerse yourself in the lush tranquility of Ubud Serene Villa, where nature and comfort blend seamlessly. Nestled in the vibrant heart of Ubud, this enchanting retreat offers the perfect balance of relaxation and adventure.', 16, 1, 2, 2, 2, CAST(220.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), N'Jalan Monkey Forest', N'', N'Ubud', N'available', N'Indonesia', N'80572', CAST(34.69370000 AS Decimal(10, 8)), CAST(135.50230000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.610' AS DateTime), CAST(N'2025-05-03T03:58:13.450' AS DateTime), 2, 10, 2, CAST(4.97 AS Decimal(10, 2)), 58, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'b4edd050-3574-4a10-b584-becd6238498e', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Traditional Kyoto Machiya', N'Authentic Kyoto townhouse with modern amenities. Experience traditional Japanese living with tatami rooms and a peaceful garden, located in historic Gion district.', 12, 1, 5, 3, 2, CAST(780.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), N'570-123 Gionmachi', N'', N'Kyoto', N'available', N'Japan', N'605-0074', CAST(22.98380000 AS Decimal(10, 8)), CAST(43.19910000 AS Decimal(11, 8)), 1, CAST(N'2025-02-10T14:35:22.000' AS DateTime), CAST(N'2025-05-03T04:11:02.437' AS DateTime), 4, 60, 1, CAST(4.92 AS Decimal(10, 2)), 28, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Osaka Downtown Apartment', N'Modern high-rise apartment in central Osaka with amazing city views. Walking distance to Dotonbori nightlife and shopping districts.', 8, 2, 3, 2, 1, CAST(520.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(45.00 AS Decimal(10, 2)), N'1-5-20 Namba', N'', N'Osaka', N'available', N'Japan', N'542-0076', CAST(33.85680000 AS Decimal(10, 8)), CAST(151.21530000 AS Decimal(11, 8)), 1, CAST(N'2025-04-01T12:30:45.000' AS DateTime), CAST(N'2025-05-03T03:54:25.763' AS DateTime), 2, 21, 1, CAST(4.90 AS Decimal(10, 2)), 24, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'ec17e6ba-96ab-4bea-bdda-c642d170467a', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Ipanema Beach House', N'50m from famous beach with rooftop deck and multiple bathrooms
', 20, 1, 6, 3, 2, CAST(290.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), N'Rua Vinicius de Moraes 125', N'', N'Rio de Janeiro', N'available', N'Brazil', N'22411-010', CAST(34.38530000 AS Decimal(10, 8)), CAST(132.45530000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.637' AS DateTime), CAST(N'2025-05-03T04:11:41.737' AS DateTime), 4, 21, 3, CAST(4.84 AS Decimal(10, 2)), 47, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'4a49ba84-fa09-422a-adc9-cfb44d07287c', N'15690543-6927-4375-9f41-628b80520190', N'Ubud Nature Haven', N'Private villa with infinity pool overlooking rice terraces. Immerse yourself in the lush tranquility of Ubud Nature Haven, where nature and comfort blend seamlessly. Nestled in the vibrant heart of Ubud, this enchanting retreat offers the perfect balance of relaxation and adventure.', 8, 7, 4, 2, 2, CAST(220.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), N'Jalan Hanoman', N'', N'Ubud', N'available', N'Indonesia', N'80574', CAST(35.23240000 AS Decimal(10, 8)), CAST(139.10430000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.610' AS DateTime), CAST(N'2025-05-03T03:58:21.670' AS DateTime), 7, 15, 2, CAST(4.97 AS Decimal(10, 2)), 58, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'aed5fdf5-4728-4122-977d-d6cea65927b4', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Opera House View Apartment', N'Uninterrupted views of Sydney Harbour Bridge and beautiful scenaries
', 16, 1, 4, 2, 1, CAST(380.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), N'12 Circular Quay West', N'', N'Sydney', N'available', N'Australia', N'2000', CAST(46.10090000 AS Decimal(10, 8)), CAST(7.22670000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.640' AS DateTime), CAST(N'2025-05-03T04:12:29.327' AS DateTime), 2, 28, 2, CAST(4.89 AS Decimal(10, 2)), 53, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Hiroshima Peaceful Apartment', N'Bright and spacious apartment near Peace Memorial Park. Easy access to Miyajima Island ferries with thoughtful local guides provided.', 10, 2, 4, 2, 1, CAST(490.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(45.00 AS Decimal(10, 2)), N'1-1-15 Otemachi', N'', N'Hiroshima', N'available', N'Japan', N'730-0051', CAST(34.69010000 AS Decimal(10, 8)), CAST(135.19550000 AS Decimal(11, 8)), 1, CAST(N'2025-04-08T10:22:37.000' AS DateTime), CAST(N'2025-05-03T03:54:30.947' AS DateTime), 2, 14, 1, CAST(4.87 AS Decimal(10, 2)), 21, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'5f894d80-ae8e-4451-948d-eccbc88d9a34', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Hakone Ryokan Retreat', N'Authentic Japanese ryokan with private onsen (hot spring) overlooking Mount Fuji. Includes kaiseki meals and tatami sleeping arrangements.', 11, 3, 2, 1, 1, CAST(850.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(10, 2)), N'1320-34 Gora', N'', N'Hakone', N'available', N'Japan', N'250-0408', CAST(36.14610000 AS Decimal(10, 8)), CAST(137.25220000 AS Decimal(11, 8)), 1, CAST(N'2025-03-22T11:20:15.000' AS DateTime), CAST(N'2025-05-03T03:54:37.100' AS DateTime), 1, 14, 1, CAST(4.97 AS Decimal(10, 2)), 38, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'38af6568-fa63-4f89-afaa-fd5c5008433b', N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Verbier Alpine Chalet', N'Ski-in/ski-out with private sauna and hot tub and fun times', 7, 1, 10, 5, 4, CAST(1200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), N'Chemin de la Tinte 15', N'', N'Verbier', N'available', N'Switzerland', N'1936', CAST(35.01160000 AS Decimal(10, 8)), CAST(135.76810000 AS Decimal(11, 8)), 1, CAST(N'2025-04-13T17:14:48.643' AS DateTime), CAST(N'2025-05-03T04:12:55.547' AS DateTime), 7, 21, 5, CAST(4.97 AS Decimal(10, 2)), 31, 1, 1, 3)
GO
INSERT [dbo].[Listings] ([Id], [hostId], [title], [description], [propertyTypeId], [roomTypeId], [capacity], [bedrooms], [bathrooms], [pricePerNight], [securityDeposit], [serviceFee], [addressLine1], [addressLine2], [city], [state], [country], [postalCode], [latitude], [longitude], [instantBooking], [createdAt], [updatedAt], [minNights], [maxNights], [cancellationPolicyId], [averageRating], [reviewCount], [isActive], [currencyId], [verificationStatusId]) VALUES (N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'Kobe Harbor Mansion', N'Elegant European-style mansion near Kobe Harbor with blend of Japanese and Western architecture. Includes private garden and chef''s kitchen.', 15, 5, 6, 3, 2, CAST(1100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(85.00 AS Decimal(10, 2)), N'5-6-7 Kitanocho', N'', N'Kobe', N'available', N'Japan', N'650-0002', CAST(35.31920000 AS Decimal(10, 8)), CAST(139.54670000 AS Decimal(11, 8)), 1, CAST(N'2025-02-14T11:30:45.000' AS DateTime), CAST(N'2025-05-03T03:54:42.180' AS DateTime), 4, 30, 1, CAST(4.94 AS Decimal(10, 2)), 18, 1, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 
GO
INSERT [dbo].[PaymentMethods] ([Id], [name], [stripeId], [stripeCode]) VALUES (1, N'CardDebit Card', N'card', N'card')
GO
INSERT [dbo].[PaymentMethods] ([Id], [name], [stripeId], [stripeCode]) VALUES (3, N'Apple Pay', N'apple_pay', N'card')
GO
INSERT [dbo].[PaymentMethods] ([Id], [name], [stripeId], [stripeCode]) VALUES (4, N'Google Pay', N'google_pay', N'card')
GO
INSERT [dbo].[PaymentMethods] ([Id], [name], [stripeId], [stripeCode]) VALUES (5, N'PayPal', N'paypal', N'paypal')
GO
INSERT [dbo].[PaymentMethods] ([Id], [name], [stripeId], [stripeCode]) VALUES (6, N'Klama', N'klama', N'klama')
GO
INSERT [dbo].[PaymentMethods] ([Id], [name], [stripeId], [stripeCode]) VALUES (7, N'iDEAL', N'ideal', N'ideal')
GO
INSERT [dbo].[PaymentMethods] ([Id], [name], [stripeId], [stripeCode]) VALUES (8, N'AliPay', N'alipay', N'alipay')
GO
INSERT [dbo].[PaymentMethods] ([Id], [name], [stripeId], [stripeCode]) VALUES (9, N'Link', N'link', N'link')
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
INSERT [dbo].[AmenityCategory] ([Id], [name]) VALUES (N'4e85e241-c4c7-4dcd-93b1-301a026419d7', N'Leisure')
GO
INSERT [dbo].[AmenityCategory] ([Id], [name]) VALUES (N'5a4eca16-8865-42fe-9019-7a0167ed0858', N'Laundry')
GO
INSERT [dbo].[AmenityCategory] ([Id], [name]) VALUES (N'4cb94e4b-3722-43c9-88af-a43da186174a', N'Comfort')
GO
INSERT [dbo].[AmenityCategory] ([Id], [name]) VALUES (N'2108206a-5b14-4cc4-a092-d1c22e094694', N'Essentials')
GO
INSERT [dbo].[AmenityCategory] ([Id], [name]) VALUES (N'fd243602-d687-4afc-a42a-f58172e0a7d1', N'Facilities')
GO
INSERT [dbo].[AmenityCategory] ([Id], [name]) VALUES (N'c5e06fd3-3c9b-4db6-9cab-ffaec3b1d3ff', N'Entertainment')
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'd2325211-da28-4791-94fa-015d98442d83', N'High-Speed Wi-Fi', N'fd243602-d687-4afc-a42a-f58172e0a7d1', N'uploads/1200px-Wifi.png', CAST(N'2025-04-13T17:15:03.150' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'TV with Streaming Services', N'4cb94e4b-3722-43c9-88af-a43da186174a', N'uploads/tv.png', CAST(N'2025-04-13T17:15:03.180' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'5ae85664-0433-4c54-abf0-056b94139527', N'Garden/Backyard', N'4cb94e4b-3722-43c9-88af-a43da186174a', N'uploads/garden.png', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'4076685c-52c7-4953-9831-096d4a1dc27f', N'Microwave', N'fd243602-d687-4afc-a42a-f58172e0a7d1', N'uploads/microwave-icon-20.png', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'Air Conditioning', N'5a4eca16-8865-42fe-9019-7a0167ed0858', N'uploads/ac.jpeg', CAST(N'2025-04-13T17:15:03.167' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'Swimming Pool', N'4cb94e4b-3722-43c9-88af-a43da186174a', N'uploads/pool.png', CAST(N'2025-04-13T17:15:03.177' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'e408cf70-9b97-40c5-a882-4e0a900cc8fd', N'Closet/Drawers', N'5a4eca16-8865-42fe-9019-7a0167ed0858', N'uploads/closet.png', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'e5a6df6f-2508-4571-995a-511708157a1a', N'Dryer', N'2108206a-5b14-4cc4-a092-d1c22e094694', N'uploads/dryer.jpg', CAST(N'2025-04-13T17:15:03.173' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'e5c6a09a-a186-4f42-b448-5ad35b017c85', N'Bath Towels', N'2108206a-5b14-4cc4-a092-d1c22e094694', N'uploads/towel.png', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'73293d31-2541-431c-8c92-62f2624dc022', N'Essential Toiletries', N'2108206a-5b14-4cc4-a092-d1c22e094694', N'uploads/toiletries.png', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'Patio/Balcony', N'4cb94e4b-3722-43c9-88af-a43da186174a', N'uploads/patio.jpg', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'Extra Pillows/Blankets', N'5a4eca16-8865-42fe-9019-7a0167ed0858', N'uploads/bedding.png', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'3150a936-af5a-4b8c-9a96-939bad13f938', N'Heating', N'5a4eca16-8865-42fe-9019-7a0167ed0858', N'uploads/heating.png', CAST(N'2025-04-13T17:15:03.170' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'Washer', N'5a4eca16-8865-42fe-9019-7a0167ed0858', N'uploads/washer.jpg', CAST(N'2025-04-13T17:15:03.170' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'Hot Tub', N'4cb94e4b-3722-43c9-88af-a43da186174a', N'uploads/hot tub.png', CAST(N'2025-04-13T17:15:03.180' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'78e5a50f-e806-488d-8b26-cf2053b17241', N'Free Parking on Premises', N'2108206a-5b14-4cc4-a092-d1c22e094694', N'uploads/parkng.png', CAST(N'2025-04-13T17:15:03.167' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'05140263-ca4e-448c-ae64-d3ae99d63f9b', N'Fire Extinguisher', N'2108206a-5b14-4cc4-a092-d1c22e094694', N'uploads/fire extinguisher.png', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'0348305b-28e1-402b-9d9d-f220c13321d2', N'Blender', N'fd243602-d687-4afc-a42a-f58172e0a7d1', N'uploads/blender.png', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'8e9482e1-4791-400a-8cb3-f561b2af3500', N'Toaster', N'fd243602-d687-4afc-a42a-f58172e0a7d1', N'uploads/toaster.jpeg', CAST(N'2025-04-29T17:19:30.043' AS DateTime))
GO
INSERT [dbo].[Amenities] ([Id], [name], [categoryId], [icon], [createdAt]) VALUES (N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'Fully Equipped Kitchen', N'fd243602-d687-4afc-a42a-f58172e0a7d1', N'uploads/kitcher.jpg', CAST(N'2025-04-13T17:15:03.153' AS DateTime))
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'00000000-0000-0000-0000-000000000001', N'Admin', N'ADMIN', N'1dfd1fb7-86e4-4e15-b70e-1abeec67216e')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'00000000-0000-0000-0000-000000000002', N'Host', N'HOST', N'2dfd1fb7-86e4-4e15-b70e-1abeec67216e')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'00000000-0000-0000-0000-000000000003', N'Guest', N'GUEST', N'3dfd1fb7-86e4-4e15-b70e-1abeec67216e')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] ON 
GO
INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (1, N'00000000-0000-0000-0000-000000000001', N'permission', N'full_access')
GO
INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2, N'00000000-0000-0000-0000-000000000001', N'permission', N'manage_users')
GO
INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3, N'00000000-0000-0000-0000-000000000002', N'permission', N'manage_listings')
GO
INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (4, N'00000000-0000-0000-0000-000000000002', N'permission', N'view_reports')
GO
INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (5, N'00000000-0000-0000-0000-000000000003', N'permission', N'book_properties')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000001')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'94a27342-1c66-4441-8c3c-1198a3bfb1a0', N'00000000-0000-0000-0000-000000000002')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'00000000-0000-0000-0000-000000000002')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1dfd1fb7-86e4-4e15-b70e-1abeec67216e', N'00000000-0000-0000-0000-000000000002')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'00000000-0000-0000-0000-000000000002')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'15690543-6927-4375-9f41-628b80520190', N'00000000-0000-0000-0000-000000000002')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'031676db-1fd0-4893-a458-baa2703dde5c', N'00000000-0000-0000-0000-000000000002')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fc54806f-24a2-439b-bbc8-00055fa9f96b', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'94a27342-1c66-4441-8c3c-1198a3bfb1a0', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1dfd1fb7-86e4-4e15-b70e-1abeec67216e', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3f9a04ff-a8e4-4a9d-9009-2e4095ba8adf', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e3ba2774-bd8b-41fc-aabb-4d4a7f75d82e', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'27d03123-780a-46c5-887d-5060b8084ffe', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'687d3d4c-d68e-4ce2-a19a-61a40e216f06', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'15690543-6927-4375-9f41-628b80520190', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'500f264e-02ad-4d50-b5bf-6d3113140e13', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6cb6cbd8-4f1a-4b45-ba9e-7990a9de3ccc', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9a352c04-0608-4aa1-b5fa-80292f8a3271', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9e2c5a8-5460-4496-8f45-810b91abd2ba', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'339574b6-c010-4cca-a489-8d74f390bb1b', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'19085d5d-96af-4d58-bc31-8dc0762cd8b2', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'921e688b-a0f1-47f7-b38a-8fe00f621e2e', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1189aeb6-8e31-4cc0-a1f3-993efe9515d9', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd9a827c9-b745-44a9-8c88-9d6a55976dd2', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'031676db-1fd0-4893-a458-baa2703dde5c', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'804c621f-6be6-48ba-bbc1-c4a90705bd94', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ef094a65-78c8-4c85-a264-c7bc1f70f34b', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1d7be279-7be9-4861-b9fe-de6fbaff3d5b', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'23d411dc-dc91-4c82-948a-f0f7c7f4b903', N'00000000-0000-0000-0000-000000000003')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f800f426-5852-4811-a042-0128635748fe', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'3826a636-f756-4251-9149-528ed1962cbf')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'd25402f8-2041-4054-95bc-017d5181c922', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'b00d015a-57ce-46bb-83de-08b5e76f96e7')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'd9cc5712-d2d7-4b4d-bb2f-03d49bfa2ee4', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'aed5fdf5-4728-4122-977d-d6cea65927b4')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a9b3c194-cd9d-45e8-b9f6-05d6d5548de7', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'16fc94a4-e533-4059-b3cb-69462157698e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fac63330-ccf4-4f51-a129-06bb3c0e199b', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'af0ed339-64f5-49dc-9d02-06f77c68ad5c', N'e408cf70-9b97-40c5-a882-4e0a900cc8fd', N'0aadcb2f-6e36-4dda-a91f-55c53485b637')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'617d63cc-2ac8-49c8-be90-083f3c9c25bb', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'eb425301-a285-4612-ab1f-085104c5ebbf', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6a4795a0-36a9-400c-b132-09658564a1fa', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'b5effc1a-d777-480f-bbe8-0b8bf9a683e8', N'e5a6df6f-2508-4571-995a-511708157a1a', N'8a23b45c-d314-4e39-9c78-20ffc76758b0')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2b5ccd45-fbdf-496d-b81c-0b957248c948', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'86134d93-2c95-451c-88e1-9bd850086f4a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3314494c-7f40-4e3a-8dbb-0c3c118ac484', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'5f894d80-ae8e-4451-948d-eccbc88d9a34')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'ea85f995-32b3-4420-8890-0c5627e2bc45', N'd2325211-da28-4791-94fa-015d98442d83', N'9c13901f-c314-4c39-8c78-10eec76758b9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f9e623a5-ef82-4053-ad79-0c67084f21f8', N'e5a6df6f-2508-4571-995a-511708157a1a', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'984b62da-3338-4d60-8209-0dc3d3ce9a8c', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'5f894d80-ae8e-4451-948d-eccbc88d9a34')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3245e87c-2a73-497b-9b99-0ec6d4cac03a', N'd2325211-da28-4791-94fa-015d98442d83', N'29a42d61-b4ef-40b9-b19c-52b145c61aab')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'8d0ba550-1f0e-4d10-8d9f-0fbe67245b9a', N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'5f894d80-ae8e-4451-948d-eccbc88d9a34')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0bd6b987-7182-4e8c-bc3b-1046f4b342ef', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'9c13901f-c314-4c39-8c78-10eec76758b9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'10588d99-7316-4104-ab9a-1308df3553e4', N'73293d31-2541-431c-8c92-62f2624dc022', N'48cd094f-abda-445c-9f14-2ab47316a4a6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f7e9073c-4163-4d20-b9f4-14011d353b83', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'5f894d80-ae8e-4451-948d-eccbc88d9a34')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'dc2a4e7d-6360-4c6b-9bea-14fb325ee53a', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'8fd9cf49-5134-4b40-89df-83ca18b274a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'9994a2a4-5a28-4fff-87d4-1547ac48f86f', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2937800a-1aaa-4cd6-8af1-1715ede7dc82', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fe2ac445-bc6b-43ff-a262-18c1d1b22a12', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'8a23b45c-d314-4e39-9c78-20ffc76758b0')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'1412f20e-3c4a-4d74-a519-19cfc7eeabfb', N'73293d31-2541-431c-8c92-62f2624dc022', N'8fd9cf49-5134-4b40-89df-83ca18b274a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c47c152d-0053-4a3b-87ac-1aacc663d197', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'29a42d61-b4ef-40b9-b19c-52b145c61aab')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0099c480-8654-4ec5-ba79-1bf0a0b81a29', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'29a42d61-b4ef-40b9-b19c-52b145c61aab')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'554e950a-0c41-4c62-b27f-1c4d16d25e85', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'8fd9cf49-5134-4b40-89df-83ca18b274a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'065d1a36-3241-40d1-980b-1c594fea6ba1', N'e5c6a09a-a186-4f42-b448-5ad35b017c85', N'e93f2721-e761-4063-9f83-715fdb1b70db')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'353c2aee-88ca-46aa-8d5a-1d1fd6e30bd8', N'5ae85664-0433-4c54-abf0-056b94139527', N'6b26b80a-d3b3-4139-bbe4-848f9474f039')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c8848d9b-bfcc-46c0-b627-1e1347aa8461', N'8e9482e1-4791-400a-8cb3-f561b2af3500', N'4a49ba84-fa09-422a-adc9-cfb44d07287c')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'09b71b8a-dff9-44ad-abcc-1f1caf9336b1', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a06018d7-5e85-43ef-98f8-207991507ea4', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'86134d93-2c95-451c-88e1-9bd850086f4a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'eb48f26f-f7e4-4f2a-b2ad-20e0ce77f848', N'73293d31-2541-431c-8c92-62f2624dc022', N'7b34c56d-e425-5f40-ad89-31eed87869c1')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'08be268a-398e-4e2f-a963-212061aa4ba6', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'df065c16-0427-4957-b689-2376af90ac7a', N'd2325211-da28-4791-94fa-015d98442d83', N'e93f2721-e761-4063-9f83-715fdb1b70db')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'278f0ca7-be08-4964-bfb9-24c38f9cf51a', N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'7b34c56d-e425-5f40-ad89-31eed87869c1')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'eea5eff1-6337-4695-9b1a-24f30c3a1647', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'75de6533-f54c-4f52-823e-5295bf3ff29b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c90f1cfd-8981-4ad3-a2fb-2504d1888943', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'75de6533-f54c-4f52-823e-5295bf3ff29b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0a521bf0-e524-4c3d-acfe-253e0dadec68', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'3826a636-f756-4251-9149-528ed1962cbf')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'38ac15e9-d283-4d68-b268-279b9809fdd1', N'd2325211-da28-4791-94fa-015d98442d83', N'21e8997f-c651-4427-94a5-4f441d1c1678')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c19d4191-b5c5-44cd-bc9b-2810152b8ef2', N'e408cf70-9b97-40c5-a882-4e0a900cc8fd', N'd19a26b7-2706-446b-aa77-56b3f47407e6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2ad2c9df-1f85-43a4-a5aa-28bead237a48', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'0d802abe-e4b1-443a-8900-b914a268de03')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7754ac91-d2d5-4d60-a6cf-28d4a1b7cb43', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'21e8997f-c651-4427-94a5-4f441d1c1678')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f87d1658-93b7-4256-ace8-2a70b4ad05e4', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'4a49ba84-fa09-422a-adc9-cfb44d07287c')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6af55aee-460e-420b-9507-3168996be834', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'75de6533-f54c-4f52-823e-5295bf3ff29b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'518ab3e8-1722-4743-ab79-32fa69a4c71f', N'e5a6df6f-2508-4571-995a-511708157a1a', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2b6115f6-2cfa-444e-adea-34c2cc0f41c8', N'73293d31-2541-431c-8c92-62f2624dc022', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'b45f7248-3d1e-400d-a3b9-35049ac47ada', N'd2325211-da28-4791-94fa-015d98442d83', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2bc7f8a3-7b02-4f2f-8d3a-3674bee38a2a', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'29a42d61-b4ef-40b9-b19c-52b145c61aab')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0d2cc6c1-d2f5-4a32-852f-36b44c1e78d2', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'b00d015a-57ce-46bb-83de-08b5e76f96e7')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'4c6de9fe-24b7-42a9-bfa1-373a2c70eae5', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'75de6533-f54c-4f52-823e-5295bf3ff29b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'4a2126a8-d303-4b42-a8cd-37c7b1d29c55', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'e93f2721-e761-4063-9f83-715fdb1b70db')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'df8477dc-024c-4e4d-997d-37deaef36014', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a4f79223-ec36-455d-8b3f-392c8a9d0b2c', N'5ae85664-0433-4c54-abf0-056b94139527', N'4a49ba84-fa09-422a-adc9-cfb44d07287c')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'352546d9-fb6e-4710-95e5-3a85dfe019e6', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'b4edd050-3574-4a10-b584-becd6238498e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3693ba17-5c10-4e9e-9a52-3ab4aa3e7fc5', N'd2325211-da28-4791-94fa-015d98442d83', N'3826a636-f756-4251-9149-528ed1962cbf')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'eed0bb63-f19b-4671-8e56-3b1f0db7c062', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'af4d3c66-2e00-460f-a541-3bf9a4139e15', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'aed5fdf5-4728-4122-977d-d6cea65927b4')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fe717ecf-a89a-4b3a-b993-3d00687f249f', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2b1897d7-4471-43b3-b7fd-3f39f53bf586', N'73293d31-2541-431c-8c92-62f2624dc022', N'b00d015a-57ce-46bb-83de-08b5e76f96e7')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'1a8fe842-e25e-4a79-945e-3f6e0a8eb374', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0ae1935d-2873-4a27-bb6a-417c886a57ff', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'4a49ba84-fa09-422a-adc9-cfb44d07287c')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'd6111ff1-1760-4825-889d-42519b41761d', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7caf9adf-7269-4588-a0af-427e6a1afdcd', N'e408cf70-9b97-40c5-a882-4e0a900cc8fd', N'4a49ba84-fa09-422a-adc9-cfb44d07287c')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7952926c-ac4b-462d-9587-429c1848487f', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'd0fbebef-9ae2-4f4f-a82e-4610e39d76c4', N'5ae85664-0433-4c54-abf0-056b94139527', N'0aadcb2f-6e36-4dda-a91f-55c53485b637')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7114e23e-aac9-486b-9ca7-47a8f79f98de', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'2a991029-4265-4713-bbc5-aff01ed72820')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6a6881d5-29b3-48b1-a268-48f38acd6604', N'd2325211-da28-4791-94fa-015d98442d83', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6d3ee624-b5f2-420d-b33b-4953b41618d9', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'0aadcb2f-6e36-4dda-a91f-55c53485b637')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'28e87929-fae1-4733-bcdb-49a11d1f7246', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'8a23b45c-d314-4e39-9c78-20ffc76758b0')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fd93aa21-b573-446e-bade-4b68e99de47b', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6b55fc42-c45e-4c37-92fb-4be973fadf4f', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'ebac2683-93c0-4a40-8e4e-4bf14a1ad371', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'21e8997f-c651-4427-94a5-4f441d1c1678')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'89225d32-4568-40eb-8b36-4d97d89b94df', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2474dc28-cd40-41c9-afc0-4da7d8cb126f', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'7b34c56d-e425-5f40-ad89-31eed87869c1')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c435bc49-04f0-4a5a-b92a-4e1acd5eaf0e', N'73293d31-2541-431c-8c92-62f2624dc022', N'b4edd050-3574-4a10-b584-becd6238498e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'16e2256e-dcf9-4d2c-a17f-4e4f4532f985', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'5f894d80-ae8e-4451-948d-eccbc88d9a34')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fd5b5a68-c780-4b2a-9198-4f1cc6a3d2d5', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'48cd094f-abda-445c-9f14-2ab47316a4a6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'bd6e2454-15d4-45f2-a840-4f96984ba4ee', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'd6d50fce-f23d-469e-9fe2-51a20ae30e9b', N'73293d31-2541-431c-8c92-62f2624dc022', N'0d802abe-e4b1-443a-8900-b914a268de03')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'018c61c9-3b15-4109-8bdc-53656177e3bf', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0cf84f71-c1d2-4f9b-872c-53b8d3f2c6fb', N'73293d31-2541-431c-8c92-62f2624dc022', N'd19a26b7-2706-446b-aa77-56b3f47407e6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'82adaa1f-902a-48d9-829a-5432aa3c4e5a', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'16302ded-5cf5-4ac0-9c78-54d8e738ce5c', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'16fc94a4-e533-4059-b3cb-69462157698e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'79344467-7de4-4d95-92e2-56948891c30f', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'd26c5f78-391b-4f36-9633-57235e7bbabf', N'5ae85664-0433-4c54-abf0-056b94139527', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'9cbcba03-bb6b-40d7-b5da-581c523d22d8', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'0aadcb2f-6e36-4dda-a91f-55c53485b637')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3a0ccef0-5940-4c84-8b3c-5839982c0936', N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'0aadcb2f-6e36-4dda-a91f-55c53485b637')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7c5468d3-f17b-40f2-99df-5908993fe4fe', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'29a42d61-b4ef-40b9-b19c-52b145c61aab')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c2d90158-37f0-49c8-a65d-5c59f10c24aa', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'2a991029-4265-4713-bbc5-aff01ed72820')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3487c4dc-0833-42db-99c1-5d82d0bfd8d4', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'82c8d9d6-5100-4b9d-aa5a-5f4f6a690dad', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'8c7f96b3-82cd-406e-bcad-60c198dbd1c2', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'86134d93-2c95-451c-88e1-9bd850086f4a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'aae5407e-c180-4211-afc9-6207ae5dd6c8', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'db3da9b6-a47f-4e0a-9a6d-6309c7efe4a4', N'e5c6a09a-a186-4f42-b448-5ad35b017c85', N'5f894d80-ae8e-4451-948d-eccbc88d9a34')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f68ca083-39b8-4c4f-8d72-645760f9c9fb', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'd19a26b7-2706-446b-aa77-56b3f47407e6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'4d699fb1-c4e5-4887-8265-64c1093830b0', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'38af6568-fa63-4f89-afaa-fd5c5008433b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'9d1bbe9d-9469-420f-8cd4-66eb3d6fbd03', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'48cd094f-abda-445c-9f14-2ab47316a4a6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6a4991f4-b44e-4678-a3b4-6714eacea75a', N'5ae85664-0433-4c54-abf0-056b94139527', N'48cd094f-abda-445c-9f14-2ab47316a4a6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'dce841eb-05bb-468c-a556-671a20a9ae38', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'21e8997f-c651-4427-94a5-4f441d1c1678')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'b58d9ebb-cfbf-4049-93ad-6786a9ebf373', N'e5a6df6f-2508-4571-995a-511708157a1a', N'16fc94a4-e533-4059-b3cb-69462157698e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'af32da3d-1471-4ef6-86d8-678edc06c07e', N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'da01db34-577a-4ae5-8e3f-6dd7a952d7b2', N'e408cf70-9b97-40c5-a882-4e0a900cc8fd', N'b00d015a-57ce-46bb-83de-08b5e76f96e7')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c0c16004-dd51-4fae-bbaa-6e1e07da476a', N'8e9482e1-4791-400a-8cb3-f561b2af3500', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a9303e1d-6de4-4097-8aa1-6e330cbd7a50', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0324bf1b-d0bc-4a0f-aa30-70e08f59675d', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'3826a636-f756-4251-9149-528ed1962cbf')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c05a97e3-6e88-47d1-a03e-72fe97c88aa3', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'176bf99d-8d45-4988-978b-74a2349f1ddb', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'e585d40a-4fc0-466b-9c5f-75133358b77d', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'e93f2721-e761-4063-9f83-715fdb1b70db')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0e989eac-75a4-4ff8-991a-758aef53f483', N'8e9482e1-4791-400a-8cb3-f561b2af3500', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'810036af-5dba-4f70-9811-759265c81504', N'8e9482e1-4791-400a-8cb3-f561b2af3500', N'6b26b80a-d3b3-4139-bbe4-848f9474f039')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'b04eb803-ae1f-4572-9c4c-7611a70f93a3', N'e5a6df6f-2508-4571-995a-511708157a1a', N'86134d93-2c95-451c-88e1-9bd850086f4a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'cded0205-5f9d-4f04-b0cf-76f198a4fa46', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f6bd20af-dded-4c8a-9d12-77a3fbd3c5c6', N'e5a6df6f-2508-4571-995a-511708157a1a', N'0d802abe-e4b1-443a-8900-b914a268de03')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'dbb68622-5f50-499d-8cf5-782d9edd4ddb', N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'16fc94a4-e533-4059-b3cb-69462157698e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a6fb12ac-98a3-4658-b57c-786b308a99fb', N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'd513e624-e183-465a-bbb9-7918b43aa9fb', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'0d802abe-e4b1-443a-8900-b914a268de03')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'bc9559bc-c1e1-40d1-8e95-792f7640ba33', N'd2325211-da28-4791-94fa-015d98442d83', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'1d662f4c-cca1-4bbb-a306-7a05487a555b', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2df68c5b-cc4b-43d7-8ddb-7aca49d00094', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fe094a68-cc38-48e1-8c02-7af200b44635', N'd2325211-da28-4791-94fa-015d98442d83', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'8923d53a-bc83-490c-9d60-7cfe66c448b4', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'2a991029-4265-4713-bbc5-aff01ed72820')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'af1bf9b0-c90c-4646-9297-7d9166c4abef', N'0348305b-28e1-402b-9d9d-f220c13321d2', N'48cd094f-abda-445c-9f14-2ab47316a4a6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'849faf26-94ce-4c94-925a-7e6bf7835f73', N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'b4edd050-3574-4a10-b584-becd6238498e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'd7ddb3b5-ec71-4af4-b4ae-7fec1ae24046', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'8fd9cf49-5134-4b40-89df-83ca18b274a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'bcea2f26-c936-41b4-a240-828fff9116b4', N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'd19a26b7-2706-446b-aa77-56b3f47407e6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6cd83170-1f9f-43de-9ff5-8371a26c2247', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'25736340-638a-44de-ab60-8662e98fa582', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'38af6568-fa63-4f89-afaa-fd5c5008433b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'edd11e2b-39b5-4cab-aeda-866ef5484aae', N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'4248b3b9-01ca-43a5-bacc-87f51e8696fb', N'e5a6df6f-2508-4571-995a-511708157a1a', N'b00d015a-57ce-46bb-83de-08b5e76f96e7')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7cd7d5dc-64dc-497b-ae4a-89052ddd5ba1', N'e5a6df6f-2508-4571-995a-511708157a1a', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'b1012c11-58c4-4e2b-870b-8956f87964ff', N'73293d31-2541-431c-8c92-62f2624dc022', N'6b26b80a-d3b3-4139-bbe4-848f9474f039')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'1f5bdf5f-f38f-4b60-b0bd-8b270afb3c70', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'57e85f82-a199-463d-808f-8c0cf0285025', N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'031aba65-7436-4dcd-8165-8c2a16177b24', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'e93f2721-e761-4063-9f83-715fdb1b70db')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'b4c938a7-791e-45e1-8299-8d2e1ce4648e', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'29a42d61-b4ef-40b9-b19c-52b145c61aab')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f58d1e33-c687-4254-bb46-8d6a057a0e94', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3a3744ec-a88a-4232-9181-8da272291110', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7c68c23c-e55c-46a5-8374-8f22313bc058', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'd19a26b7-2706-446b-aa77-56b3f47407e6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'8897e38c-6405-4645-861d-9070a2b27fb0', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'75de6533-f54c-4f52-823e-5295bf3ff29b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'9ab7ee84-3168-403a-b843-91117d3708f0', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'7b34c56d-e425-5f40-ad89-31eed87869c1')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'11704981-e2b4-41b0-a798-91dba42bea4f', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'aed5fdf5-4728-4122-977d-d6cea65927b4')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'e76033a4-c987-4fa1-afc5-92af23d8c835', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'86134d93-2c95-451c-88e1-9bd850086f4a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'eb9a8465-c8a2-497f-812d-94b3ad9de9b3', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'04eeb578-0a67-4431-8806-95016cd71222', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'48cd094f-abda-445c-9f14-2ab47316a4a6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'56ff9b84-4256-4160-9b4e-95516d950cd7', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'e93f2721-e761-4063-9f83-715fdb1b70db')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a7941afb-2e2c-413a-9acb-959e1cb4dbb3', N'73293d31-2541-431c-8c92-62f2624dc022', N'8a23b45c-d314-4e39-9c78-20ffc76758b0')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a982d1ad-db88-4932-8f44-97a91cd8e48f', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'0d802abe-e4b1-443a-8900-b914a268de03')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a5f57737-55f9-424b-abd2-9854db486b9b', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'21e8997f-c651-4427-94a5-4f441d1c1678')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'5bc7b37c-af48-44d5-b883-98b6f962f659', N'e5a6df6f-2508-4571-995a-511708157a1a', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'9c33d0fb-9679-415b-a220-9945a5c39700', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'38af6568-fa63-4f89-afaa-fd5c5008433b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0f24206a-97da-4acb-8126-996cc0f638b0', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'aed5fdf5-4728-4122-977d-d6cea65927b4')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7d81a3be-409c-41ab-af91-9a61e823f724', N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7f7519a3-1892-4042-a672-9ae37d13f241', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'16fc94a4-e533-4059-b3cb-69462157698e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'37d36611-ef74-4979-b5c4-9b9281558bf8', N'e5a6df6f-2508-4571-995a-511708157a1a', N'4a49ba84-fa09-422a-adc9-cfb44d07287c')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'66f8fc43-dc7e-43e4-84c1-9bc5e402aa3d', N'e5a6df6f-2508-4571-995a-511708157a1a', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'af912b32-dfd1-41bc-8186-9ca1985a5554', N'5ae85664-0433-4c54-abf0-056b94139527', N'7b34c56d-e425-5f40-ad89-31eed87869c1')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'd56a383b-724f-46e4-ad4d-9dfa59416212', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'aed5fdf5-4728-4122-977d-d6cea65927b4')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'b0c02f43-7e3e-466c-8d71-9dfdd4f609de', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'aed5fdf5-4728-4122-977d-d6cea65927b4')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'5202aa28-22f4-466c-bb94-9ee6dae8cbfc', N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'b4edd050-3574-4a10-b584-becd6238498e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'048aed39-54d8-4932-ba3d-9f3441b78b3c', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'24dc41ea-f6f2-4bec-9565-a0235b285ff5', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'21e8997f-c651-4427-94a5-4f441d1c1678')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'451cfad3-d9f4-41e4-a729-a2448928b23d', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'77ec65fa-68ed-42f0-b10c-a2d754231da6', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'8fd9cf49-5134-4b40-89df-83ca18b274a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f49159e8-7fd2-4125-a13a-a30bcb213af2', N'e5a6df6f-2508-4571-995a-511708157a1a', N'5f894d80-ae8e-4451-948d-eccbc88d9a34')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'195e0c97-925a-45e4-bffe-a41d2dc75bb0', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'2a991029-4265-4713-bbc5-aff01ed72820')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'79d45360-5ec8-4f88-8466-a4241c2a7de7', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'4a49ba84-fa09-422a-adc9-cfb44d07287c')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6edfff35-ed96-4804-be02-a4b888efbd09', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'8f0a528a-bdb1-447d-8768-a658c736a5e2', N'8e9482e1-4791-400a-8cb3-f561b2af3500', N'8a23b45c-d314-4e39-9c78-20ffc76758b0')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'589e2445-4529-4cf7-98a5-a9717f7ca7f0', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'd19a26b7-2706-446b-aa77-56b3f47407e6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'4437128c-4052-47f7-a0f6-aa67c599d2fd', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'9c13901f-c314-4c39-8c78-10eec76758b9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3345f0a6-1105-41d7-bac3-aaaa354fd368', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'de2c356a-f9d2-4179-b029-aaaba9ba150d', N'73293d31-2541-431c-8c92-62f2624dc022', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'17d3bfa8-91b4-4ead-8215-ab71de074f54', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'16fc94a4-e533-4059-b3cb-69462157698e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'93a1bb21-f3de-4834-8065-ac64157c4d99', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'3826a636-f756-4251-9149-528ed1962cbf')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3dce22dc-7a02-4e83-af74-acac25ea1485', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fb2a3c6a-9ed8-44a0-88d6-adb9c2ece88d', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'4339ad52-e409-48ae-b667-afc5dd65faba', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'b00d015a-57ce-46bb-83de-08b5e76f96e7')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'73713baf-e94c-457a-b2c0-afeb5714c54a', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'6b26b80a-d3b3-4139-bbe4-848f9474f039')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'e496e694-6f64-4e9e-9e46-b0c85dc42abc', N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'714f4ef8-835f-4351-94a3-b1560e35bd37', N'e5a6df6f-2508-4571-995a-511708157a1a', N'7b34c56d-e425-5f40-ad89-31eed87869c1')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'68e96b76-691e-459d-8667-b1f2aac01972', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c6fe023c-2680-4658-8611-b3a68a0f7f4e', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'4a49ba84-fa09-422a-adc9-cfb44d07287c')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0c984a5c-5bd0-4f48-a53b-b3c9663c281e', N'd2325211-da28-4791-94fa-015d98442d83', N'aed5fdf5-4728-4122-977d-d6cea65927b4')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'83d38dad-e766-41f0-ab9d-b47e2bb12eba', N'5ae85664-0433-4c54-abf0-056b94139527', N'16fc94a4-e533-4059-b3cb-69462157698e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0553cc14-30ae-4fe2-ad69-b4843340abdd', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'b00d015a-57ce-46bb-83de-08b5e76f96e7')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'85a15435-e9f2-48fb-95ae-b653bd408b95', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'21e8997f-c651-4427-94a5-4f441d1c1678')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'bee1837d-2821-4dcf-97ec-b6c8c5a8f813', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'7b34c56d-e425-5f40-ad89-31eed87869c1')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'783011b7-ebb5-4057-bd09-b7313753e1b1', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fe88099e-3a44-4503-bc30-b77eadae875d', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'38af6568-fa63-4f89-afaa-fd5c5008433b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'10d13909-d11a-4468-9b17-b8037f47c815', N'5ae85664-0433-4c54-abf0-056b94139527', N'8a23b45c-d314-4e39-9c78-20ffc76758b0')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'e7d97f72-a3e5-441c-9f33-b926f28ede90', N'e5a6df6f-2508-4571-995a-511708157a1a', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'505e9bc9-3df3-4157-8874-ba6ef45e4b0b', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'48cd094f-abda-445c-9f14-2ab47316a4a6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'835b0331-51cd-477a-8d5e-baa5e51c1c1e', N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'8fd9cf49-5134-4b40-89df-83ca18b274a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'1b424ac1-5dcc-4dd9-b2ac-be4721accc0c', N'73293d31-2541-431c-8c92-62f2624dc022', N'5f894d80-ae8e-4451-948d-eccbc88d9a34')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'da8f7b44-4739-45f2-8083-bf6ad531e395', N'2abce0ab-18f9-470d-8a0b-8ce606fe0814', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'98a9933c-0879-4975-a781-c195a88f7744', N'd2325211-da28-4791-94fa-015d98442d83', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6152412d-0887-4dc3-82c2-c3a275984b2a', N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'6a1e2a35-7745-4536-ad31-c516908d34db', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'443ce66c-a6b2-4747-9f61-c5277911619b', N'73293d31-2541-431c-8c92-62f2624dc022', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f7ad24c1-8c8f-44ad-81ab-c54e972b31eb', N'd2325211-da28-4791-94fa-015d98442d83', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'26481605-311d-45b9-b78e-cb6357114341', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'd19a26b7-2706-446b-aa77-56b3f47407e6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'9b6ad735-18dc-4ed2-b86c-cd911a05aed2', N'e5c6a09a-a186-4f42-b448-5ad35b017c85', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c373b023-7715-4421-8b9a-cd9d6841fe2f', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'38af6568-fa63-4f89-afaa-fd5c5008433b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'00ab195e-f886-4c18-ba4c-ce3809cf203b', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'4a49ba84-fa09-422a-adc9-cfb44d07287c')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3419934d-fd56-434a-85db-ce61076a8ab1', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7287ff6e-ac2a-41c7-8395-cfe3a7744260', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'8f91ed59-06c0-44fe-a756-d15b9f4dee65', N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'cb59f626-b30e-4594-8c1b-d22746ced8ef', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'5f894d80-ae8e-4451-948d-eccbc88d9a34')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7fda0267-8c1c-438a-85a7-d2384cdd74bd', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'ba603ed9-25d5-463d-b072-d2b5d24b7223', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'd19a26b7-2706-446b-aa77-56b3f47407e6')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c2502133-c025-486a-af78-d2eded25100e', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'9c13901f-c314-4c39-8c78-10eec76758b9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'937ca69e-e504-48d4-871d-d33ba8bc6c48', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'11782bc7-9ea9-44c5-a368-d5dfdf28ec83', N'd2325211-da28-4791-94fa-015d98442d83', N'75de6533-f54c-4f52-823e-5295bf3ff29b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a117dce7-14f0-4b7f-aa89-d6dc121e92bc', N'5ae85664-0433-4c54-abf0-056b94139527', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2477dd22-19c8-412b-8a39-d6f4beeeec73', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'6b26b80a-d3b3-4139-bbe4-848f9474f039')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'536b1739-f805-4cb7-afb1-d7d6554189bb', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'0d802abe-e4b1-443a-8900-b914a268de03')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'40376b94-2e73-4d92-9427-d8001589d506', N'e408cf70-9b97-40c5-a882-4e0a900cc8fd', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'467f2736-8ac7-4471-80c1-d8d728e53dd6', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'b8491428-553d-4ea0-b956-d926ce7e99fa', N'e5a6df6f-2508-4571-995a-511708157a1a', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'ab803b30-0326-4fdf-9571-dc20fc1bb92f', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'8fd9cf49-5134-4b40-89df-83ca18b274a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'892198c2-e6ad-4276-9e98-dcaeafcaac0f', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'b4edd050-3574-4a10-b584-becd6238498e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'c32ebca1-f232-413b-abcf-dcbe51a96096', N'98bf6ab4-1991-4a07-bfab-14dac0360664', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'02fc14e6-78b5-4cc4-83d9-de8b8bf501df', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'75de6533-f54c-4f52-823e-5295bf3ff29b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'732e585c-5e44-4151-994a-dfcd6aab14b7', N'73293d31-2541-431c-8c92-62f2624dc022', N'16fc94a4-e533-4059-b3cb-69462157698e')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'286d7edb-86ee-4c38-9651-e0024e8282c6', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'3826a636-f756-4251-9149-528ed1962cbf')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f6dcf947-dc23-4d6c-931e-e2752432a69e', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'6b26b80a-d3b3-4139-bbe4-848f9474f039')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'ac46b202-abb4-4699-bc8a-e36050fb8c53', N'5445da5d-509a-4918-a27f-bdfbf9c9ab8c', N'6b26b80a-d3b3-4139-bbe4-848f9474f039')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'e7cc183f-89b7-4818-a6b3-e45523d10da7', N'e5a6df6f-2508-4571-995a-511708157a1a', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'61bcb86f-1339-4eff-8875-e4cf2b161064', N'73293d31-2541-431c-8c92-62f2624dc022', N'0aadcb2f-6e36-4dda-a91f-55c53485b637')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'8398e5b9-b70f-4676-8f7f-e794e494b682', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'0aadcb2f-6e36-4dda-a91f-55c53485b637')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'ab426b7a-542e-42c7-8cd2-eafec399b8fb', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'9c13901f-c314-4c39-8c78-10eec76758b9')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'23682440-1dcc-4d98-80e2-eb5ab91c130b', N'd2325211-da28-4791-94fa-015d98442d83', N'86134d93-2c95-451c-88e1-9bd850086f4a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'74680e82-ece6-46a2-8e84-ec3a598e4f3b', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'29a42d61-b4ef-40b9-b19c-52b145c61aab')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'268fd2ff-664d-4263-b5f1-ec76963c66df', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7d7e4668-d850-4177-893f-ee2abb91cdca', N'e408cf70-9b97-40c5-a882-4e0a900cc8fd', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'f197ad23-979a-4258-baea-eecd47518ea6', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'7e91df17-73dc-4780-a89a-f118df9af50e', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'08e36d7e-3ad8-4761-bc7e-f1adeb662619', N'e408cf70-9b97-40c5-a882-4e0a900cc8fd', N'0d802abe-e4b1-443a-8900-b914a268de03')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'be496548-7b9d-4871-8ec1-f2809353d7df', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'ec17e6ba-96ab-4bea-bdda-c642d170467a')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'b9cd8f2f-c343-4825-bf0f-f2ff51b8a3e3', N'd2325211-da28-4791-94fa-015d98442d83', N'2a991029-4265-4713-bbc5-aff01ed72820')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'ec0a7f5b-ab8b-45d7-a290-f4b6bc84dcf8', N'bd53297e-6512-4e4d-a3fd-8857b63cb8ee', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fc923c7a-ce72-4700-9ffb-f5b50c1fed6a', N'1ffa56a3-4530-49a6-8881-03f5b0ca9360', N'3826a636-f756-4251-9149-528ed1962cbf')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'94d0b901-b59c-44a4-870b-f63e3ba0822f', N'd2325211-da28-4791-94fa-015d98442d83', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'943dcc19-442c-41c6-a53d-f6d23bb3a591', N'3150a936-af5a-4b8c-9a96-939bad13f938', N'2a991029-4265-4713-bbc5-aff01ed72820')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'a93f7693-190c-4822-aaa5-f72eb9554eee', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'0aadcb2f-6e36-4dda-a91f-55c53485b637')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'2ed59319-6d92-4671-b544-f76c9e68d54b', N'fab64f01-9205-438f-87bb-b8b412e77ec3', N'38af6568-fa63-4f89-afaa-fd5c5008433b')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'3c8bd2e1-2833-4a60-b205-f8149240b5ec', N'e5a6df6f-2508-4571-995a-511708157a1a', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'bfb2d466-6b57-41c8-af1c-fadf4610d8f7', N'4076685c-52c7-4953-9831-096d4a1dc27f', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fe6553ad-c28e-4076-a1b3-fbef72ddbd14', N'73293d31-2541-431c-8c92-62f2624dc022', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'fd0a6408-d274-4468-849c-fc4a38475788', N'78e5a50f-e806-488d-8b26-cf2053b17241', N'7b34c56d-e425-5f40-ad89-31eed87869c1')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'1e40ffca-e8dc-4e65-8ec8-fcd0288fdb9d', N'6dfdfd29-0a43-4c98-9e33-f9b464ce1043', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5')
GO
INSERT [dbo].[ListingAmenities] ([Id], [amenityId], [ListingId]) VALUES (N'0deb0261-8df9-41c4-9e85-ff3cfd77d785', N'f4006cb2-41ba-4b6c-8af5-433b56138a3b', N'0d802abe-e4b1-443a-8900-b914a268de03')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'00000000-0000-0000-0000-000000000001', N'given_name', N'System')
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2, N'00000000-0000-0000-0000-000000000001', N'admin_since', N'2023-01-01')
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (3, N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'given_name', N'BackupAdmin')
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (4, N'1dfd1fb7-86e4-4e15-b70e-1abeec67216e', N'host_since', N'2022-05-15')
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (5, N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'superhost', N'true')
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (6, N'3f9a04ff-a8e4-4a9d-9009-2e4095ba8adf', N'verification', N'verified')
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (7, N'27d03123-780a-46c5-887d-5060b8084ffe', N'membership', N'premium')
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (8, N'687d3d4c-d68e-4ce2-a19a-61a40e216f06', N'membership', N'premium')
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (9, N'15690543-6927-4375-9f41-628b80520190', N'moderator_since', N'2023-06-01')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Facebook', N'facebook_host_456', N'Facebook', N'1dfd1fb7-86e4-4e15-b70e-1abeec67216e')
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'google_admin_123', N'Google', N'00000000-0000-0000-0000-000000000001')
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'google_premium_101', N'Google', N'27d03123-780a-46c5-887d-5060b8084ffe')
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Microsoft', N'microsoft_host_789', N'Microsoft', N'099d693b-6597-4855-9e8c-22bc7a575a4b')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'00000000-0000-0000-0000-000000000001', N'AirbnbClone', N'RefreshToken', N'91a59bfd-5776-482e-9547-0b341985f576')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'00000000-0000-0000-0000-000000000001', N'AirbnbClone', N'RefreshTokenExpiry', N'2025-05-03T03:37:32.1544834Z')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'00000000-0000-0000-0000-000000000001', N'Google', N'refresh_token', N'google_rt_123xyz')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'fc54806f-24a2-439b-bbc8-00055fa9f96b', N'AirbnbClone', N'RefreshToken', N'09710046-0d70-4321-9039-3653ccccc61b')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'fc54806f-24a2-439b-bbc8-00055fa9f96b', N'AirbnbClone', N'RefreshTokenExpiry', N'2025-04-15T01:56:40.9218860+02:00')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'94a27342-1c66-4441-8c3c-1198a3bfb1a0', N'AirbnbClone', N'RefreshToken', N'024299cb-5f20-440a-9cc3-e2babf01b4c0')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'94a27342-1c66-4441-8c3c-1198a3bfb1a0', N'AirbnbClone', N'RefreshTokenExpiry', N'2025-04-22T23:19:53.3406780+02:00')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'AirbnbClone', N'RefreshToken', N'0883d11c-c938-4f03-8aa5-e054d05fae99')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'6a839143-9a4c-4c9b-932e-1a8f1cbda60f', N'AirbnbClone', N'RefreshTokenExpiry', N'2025-05-03T03:59:26.6500504Z')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'1dfd1fb7-86e4-4e15-b70e-1abeec67216e', N'Facebook', N'access_token', N'fb_at_456abc')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'AirbnbClone', N'RefreshToken', N'dddbf773-2f9b-4eea-a95a-e9563dec21ca')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'AirbnbClone', N'RefreshTokenExpiry', N'2025-05-03T04:06:01.5558946Z')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'099d693b-6597-4855-9e8c-22bc7a575a4b', N'Microsoft', N'id_token', N'ms_id_789def')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'27d03123-780a-46c5-887d-5060b8084ffe', N'Google', N'refresh_token', N'google_rt_101uvw')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'15690543-6927-4375-9f41-628b80520190', N'AirbnbClone', N'RefreshToken', N'0ac9ad87-350f-45fa-a40a-ceaf278ac620')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'15690543-6927-4375-9f41-628b80520190', N'AirbnbClone', N'RefreshTokenExpiry', N'2025-05-03T03:54:50.6540358Z')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'031676db-1fd0-4893-a458-baa2703dde5c', N'AirbnbClone', N'RefreshToken', N'4ca23f8c-25b6-451b-aa42-4dd9cc6f6014')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'031676db-1fd0-4893-a458-baa2703dde5c', N'AirbnbClone', N'RefreshTokenExpiry', N'2025-05-02T12:12:40.1055148Z')
GO
INSERT [dbo].[Conversations] ([Id], [UserId], [CreatedAt], [LastMessageAt], [Title], [ApplicationUserId]) VALUES (N'441821f1-6ee2-4165-a316-dddada50378d', N'031676db-1fd0-4893-a458-baa2703dde5c', CAST(N'2025-04-26T14:21:22.6183809' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Hello Airbnb', NULL)
GO
INSERT [dbo].[Conversations] ([Id], [UserId], [CreatedAt], [LastMessageAt], [Title], [ApplicationUserId]) VALUES (N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9', N'031676db-1fd0-4893-a458-baa2703dde5c', CAST(N'2025-04-25T16:17:02.2213042' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'ما هو airbnb', NULL)
GO
INSERT [dbo].[Conversations] ([Id], [UserId], [CreatedAt], [LastMessageAt], [Title], [ApplicationUserId]) VALUES (N'6fef4f5e-53b2-41da-84e9-c749f1f901dd', N'031676db-1fd0-4893-a458-baa2703dde5c', CAST(N'2025-04-24T19:05:40.4166538' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'what are listings', NULL)
GO
INSERT [dbo].[Conversations] ([Id], [UserId], [CreatedAt], [LastMessageAt], [Title], [ApplicationUserId]) VALUES (N'8bf25df9-37a3-4bf2-a92f-7b7b8169510b', N'031676db-1fd0-4893-a458-baa2703dde5c', CAST(N'2025-04-26T13:48:00.4158400' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ChatMessages] ON 
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (706, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'Hello! I''m your Airbnb Q&A specialist. Ask me anything about vacation rentals, hosting, bookings, or Airbnb policies.', CAST(N'2025-04-24T19:05:40.4166542' AS DateTime2), N'6fef4f5e-53b2-41da-84e9-c749f1f901dd')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (707, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'Hello Airbnb', CAST(N'2025-04-24T19:05:40.4492421' AS DateTime2), N'6fef4f5e-53b2-41da-84e9-c749f1f901dd')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (708, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'Hello! How can I assist you with your Airbnb or vacation rental needs today?', CAST(N'2025-04-24T19:05:41.5987830' AS DateTime2), N'6fef4f5e-53b2-41da-84e9-c749f1f901dd')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (709, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'what are listings', CAST(N'2025-04-24T19:59:58.5975958' AS DateTime2), N'6fef4f5e-53b2-41da-84e9-c749f1f901dd')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (710, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'In the context of Airbnb and vacation rentals, listings refer to the individual properties that hosts make available for short-term rental. Each listing typically includes:

1. **Property Description**: A detailed overview of the rental, including its features, size, and unique attributes.
2. **Photos**: High-quality images showcasing the space, amenities, and surroundings to attract potential guests.
3. **Pricing**: The cost per night, along with any additional fees (cleaning fee, service fee, etc.).
4. **Availability**: A calendar indicating when the property is available for booking.
5. **Amenities**: Information about the facilities provided, such as Wi-Fi, kitchen appliances, parking, etc.
6. **Host Information**: Details about the host, including their response rate, reviews from previous guests, and any house rules.
7. **Location**: Information about the property’s location, including nearby attractions and public transport options.

An effective listing is key to attracting guests and should be optimized with relevant keywords and high-quality visuals to enhance its appeal. If you need more specific advice on creating or optimizing a listing, feel free to ask!', CAST(N'2025-04-24T20:00:04.6357430' AS DateTime2), N'6fef4f5e-53b2-41da-84e9-c749f1f901dd')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1605, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'Hello air bnb', CAST(N'2025-04-25T16:17:02.3572360' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1606, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'પોલ્લે જાયા અભી ફ્લે સ્ટેમ્યું', CAST(N'2025-04-25T16:17:38.6692145' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1607, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'Thank you for listening.', CAST(N'2025-04-25T16:17:49.8667122' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1608, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'on this listing.', CAST(N'2025-04-25T16:18:00.5630018' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1609, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'It seems like your question is incomplete. Could you please provide more details about the listing or specify what information or assistance you need regarding it?', CAST(N'2025-04-25T16:18:02.6802431' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1610, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'It seems like your message got cut off. Could you please provide more details or clarify your question regarding the Airbnb listing? I’d be happy to help!', CAST(N'2025-04-25T16:18:03.6286275' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1611, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'唔好呀 系度無八一瘤好多樣意思', CAST(N'2025-04-25T16:18:45.5521701' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1612, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'How do I add listing?', CAST(N'2025-04-25T16:18:53.4410462' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1613, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'To add a listing on Airbnb, follow these steps:

1. **Create an Account or Log In**: If you don''t already have an Airbnb account, sign up at airbnb.com. If you have an account, log in.

2. **Go to the Hosting Section**: Click on your profile picture in the top right corner and select "Switch to hosting" or "Become a host."

3. **Start a New Listing**: Click on "Create a new listing." You will be prompted to answer a few questions about your property type (e.g., entire place, private room, shared room).

4. **Enter Details About Your Space**: Fill in information about your listing, including:
   - Property type and location
   - Number of guests it can accommodate
   - Number of bedrooms and bathrooms
   - Amenities and features

5. **Write a Compelling Description**: Create a detailed and inviting description of your space, highlighting unique features and nearby attractions.

6. **Upload High-Quality Photos**: Add clear and appealing photos of your space, showcasing different angles and key amenities. Good photographs can significantly impact bookings.

7. **Set Your Pricing**: Choose your pricing strategy, including base price, cleaning', CAST(N'2025-04-25T16:18:58.2096727' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1614, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'To add a listing on Airbnb, follow these steps:

1. **Create an Account or Log In**: If you don''t have an Airbnb account, you''ll need to sign up. If you already have one, just log in.

2. **Go to Host**: Click on the "Host" menu at the top of the Airbnb homepage.

3. **Click on "Add a New Listing"**: This option will guide you through the process of creating your listing.

4. **Select Your Property Type**: Choose whether you want to list a home, apartment, shared room, or another type of accommodation.

5. **Fill in Listing Details**: You''ll need to provide information about your space, including:
   - Title and description
   - Location (address)
   - Number of guests it can accommodate
   - Number of bedrooms and bathrooms
   - Amenities (Wi-Fi, kitchen, pool, etc.)

6. **Set Your Pricing**: Determine your nightly rate and any additional fees (cleaning fee, extra guest fee, etc.).

7. **Add Photos**: Upload high-quality photos of your space. Good visuals can significantly enhance your listing''s appeal.

8. **Set House Rules**: Specify any rules for', CAST(N'2025-04-25T16:19:03.7822256' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1615, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'Thanks a lot.', CAST(N'2025-04-25T16:19:35.4821543' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1616, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'كلمني عن اير بيم بي', CAST(N'2025-04-25T16:20:03.9881464' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1617, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'يبدو أنك ترغب في معرفة المزيد عن منصة إير بي إن بي (Airbnb). إير بي إن بي هي منصة لتأجير المساكن وإيجاد أماكن للإقامة قصيرة الأجل، حيث يمكن للمسافرين استئجار غرف أو شقق أو منازل من المضيفين. 

إذا كنت تبحث عن معلومات محددة حول إير بي إن بي، مثل كيفية إعداد قائمة، استراتيجيات التسعير، أو كيفية إدارة الحجوزات، يرجى توضيح سؤالك وسأكون سعيدًا بمساعدتك!', CAST(N'2025-04-25T16:20:06.8593605' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1618, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'يبدو أنك ترغب في معرفة المزيد عن Airbnb. هل يمكنك توضيح ما الذي تود معرفته تحديدًا؟ على سبيل المثال، هل ترغب في معرفة كيفية إعداد قائمة للإيجار، أو كيفية إدارة الحجوزات، أو ربما كيفية تحسين تجربتك كضيف أو مضيف؟', CAST(N'2025-04-25T16:20:08.7979989' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1619, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'نعم أريد التوضيح عن airbnb', CAST(N'2025-04-25T16:20:29.0589396' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1620, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'بالطبع! يمكنني مساعدتك في فهم المزيد عن Airbnb. هل لديك سؤال محدد حول قوائم Airbnb، إدارة الحجز، التواصل مع الضيوف، أو أي جانب آخر يتعلق بالإيجارات القصيرة؟ يرجى توضيح استفسارك بشكل أكثر تحديدًا.', CAST(N'2025-04-25T16:20:30.2404624' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1621, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'ما هو airbnb', CAST(N'2025-04-25T16:20:42.6027610' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1622, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'Airbnb هي منصة عبر الإنترنت تتيح للأفراد تأجير ممتلكاتهم كأماكن للإقامة قصيرة الأجل. يمكن للمالكين (المضيفين) إدراج شققهم، منازلهم، أو غرفهم، بينما يمكن للضيوف البحث عن خيارات الإقامة حسب الموقع، السعر، والمرافق. توفر Airbnb تجربة فريدة من نوعها للمسافرين، حيث يمكنهم الإقامة في أماكن محلية، واكتشاف ثقافات جديدة.

إذا كان لديك أي استفسار محدد حول Airbnb أو كيفية استخدام المنصة، فلا تتردد في طرحه!', CAST(N'2025-04-25T16:20:44.7881742' AS DateTime2), N'4cd737ea-1444-46b8-ac6f-a7ebc79748c9')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (1623, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'Hello there', CAST(N'2025-04-26T13:48:00.5903924' AS DateTime2), N'8bf25df9-37a3-4bf2-a92f-7b7b8169510b')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (2623, N'031676db-1fd0-4893-a458-baa2703dde5c', 1, N'Hello Airbnb', CAST(N'2025-04-26T14:21:22.8015672' AS DateTime2), N'441821f1-6ee2-4165-a316-dddada50378d')
GO
INSERT [dbo].[ChatMessages] ([Id], [UserId], [IsFromUser], [Content], [Timestamp], [ConversationId]) VALUES (2624, N'031676db-1fd0-4893-a458-baa2703dde5c', 0, N'Hello! How can I assist you with your Airbnb or vacation rental questions today?', CAST(N'2025-04-26T14:21:40.6812472' AS DateTime2), N'441821f1-6ee2-4165-a316-dddada50378d')
GO
SET IDENTITY_INSERT [dbo].[ChatMessages] OFF
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c4b5bf9c-19d2-4cf7-b449-000f6c0e0b22', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-27' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6dfc5c7e-47aa-43f4-aa45-006d7ddff381', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-17' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9a9ef09b-bd7a-4a50-bbf9-0074849cf18e', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-23' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c7b0aa1b-eabc-4239-aba8-00973466926b', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-23' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8f61470d-8da5-4dda-845d-00ce1667e1ba', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-24' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9260bea0-5811-437b-99da-014772e4ddc2', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-21' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a52c7bba-ef1b-4306-b1f6-01629da70e0d', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-10' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'49af615b-cd8c-47ef-8f11-01cdba9466d5', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-04-28' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1ae34a86-62f3-41a0-abfd-01e3ff6bdfd7', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-13' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b550d91f-b851-4564-8a5f-02d6a6f65a84', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-08' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1f41b3ea-596b-4005-96fe-0316624022c9', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-15' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ecd09e42-9739-4066-a2ec-039234e99d40', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-25' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'130603cf-9ec8-4271-afc2-040411d938e2', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-24' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'44cabfc5-e283-401c-89ba-040b65c7937e', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-21' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f699eb01-b536-4ed6-9458-04190595ba74', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-06' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'15617407-ef59-4830-a219-04d71f52d117', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-22' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b49cb204-95bb-4fc9-93f5-04da8d68715b', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-08' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'063d6e74-eeb8-4442-aa1f-05329d906f91', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-29' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6d2e221b-6174-4ea6-b1d3-055739903a2b', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-24' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4612ae2c-9765-4aaa-9562-06cb424e6dce', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-20' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'97e87f70-e51f-47b5-a385-071275fe9e49', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-12' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5d70fae9-df4e-4977-8474-07332266dafd', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-23' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'84d74cdb-1827-42a1-8115-0735aa64942a', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-01' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1061fe95-a992-4894-8af6-07efe6de8393', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-19' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'311e95fe-385c-4ae1-a3e1-0870da3dcbc9', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-26' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'674b5fc4-83af-4083-9470-08c65ed9a4bc', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-22' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8bf3c0c4-4ab9-4dfb-b213-09074ab16cec', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-15' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4cd1a1a1-9cc2-483b-8ef1-0947bd0d3033', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-09' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6493d51c-9b15-41b5-a706-099fe3300305', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-24' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'84c9cf65-6f5c-4a63-a792-0a20aced9452', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-27' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ec51d14b-6a7e-40ad-b100-0a56b805d218', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-05' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c09404d3-d4e6-4a43-be75-0abc8855a3f9', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-16' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'50063020-cad2-4d82-a651-0ad7137d5c9f', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-20' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cb2dae89-0556-4076-b8b6-0adca88e16b7', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-17' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dbbff040-dcbf-4ca4-b5e3-0adf5dc5d47e', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-16' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'14f68188-0624-4854-8564-0b1e008561ef', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-07' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fde41549-d810-4654-98c5-0b335abf146a', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-11' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'073423a7-c6e1-4ba5-97a0-0c831672973e', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-28' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bdf9af13-988b-4a45-8381-0ceda7ca3d96', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-18' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'977fb170-0c7a-4b42-a25b-0cf649dc3c5a', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-25' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2db0e132-6f9d-41fd-9a33-0dee6827fe32', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-27' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd8dbfe63-c24d-416f-b544-0e8e61df34f2', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-06' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'509155d5-ecf6-4a53-8b65-0f1a6ff6e361', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-18' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ffc05e89-48e6-4e57-a3d6-0f5175a82a85', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-16' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5887b47f-cb5d-4121-9615-100f1e277043', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-10' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4c559c35-71d7-43a0-83d5-1051d3d67531', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-16' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cc324c61-0234-4ad6-8cb2-108fa108cd34', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-17' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a8377018-77be-4dfc-ace3-10db17545db7', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-28' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd9c1ad47-d7f0-4cc4-b47f-11295034b402', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-12' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a1b04644-3143-409c-9975-11aa6a7dd10d', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-24' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8d5dd87a-d735-481e-8b72-12176fab25f5', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-07' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6b2e6d09-2ce5-4c92-af64-123f61962323', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-12' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'deaf4f21-740d-4df2-9c1a-1255b9e79d68', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-15' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'db5bce47-05e0-48f2-9235-135b4b90e126', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-17' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1ed6d5ea-fa40-4835-916c-13c645d74a0e', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-16' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'aeee52d1-d2a0-4b93-847f-143de97e475f', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-13' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f9796e29-dd8e-415a-bc43-14e511222c3c', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-17' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9fbae6a5-9ab2-4c01-85e9-1574ed55b4f8', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-11' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'41dd28b3-f0ce-441b-8389-15eda68b5995', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-04' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1142e030-92c9-4348-ba8c-161db9074749', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-16' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7c2b1afa-c576-48b9-8cda-16696d507e6e', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-16' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'82ef0532-ecef-4cd3-92b1-16f42e4d5b5d', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-04' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'70dc34af-a168-4c76-b503-17156fb61261', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-29' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'70def2fc-c491-4494-872f-1738f058b0d6', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-05' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'833e41e5-2fe6-4090-ac26-17ae4e8563c2', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-08' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8f273a11-7a1b-426a-b64a-18256d3dd816', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-21' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'965a1ceb-67df-4bbd-b90c-18e3f741c4cc', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-15' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'78fc1446-33e4-49b3-a259-190eb2833c35', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-21' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'11643143-28f2-438b-86d8-1967a000f82b', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-27' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'04d1d858-e311-4107-a2df-19b81d9d2321', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-23' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5f31892e-cdb3-4a37-961d-1a344a8e0477', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-24' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ec82d123-85ac-41af-81e0-1ad58874a94d', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-18' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dc8f528a-df43-4078-85fa-1b292db89831', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-30' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4203121f-29c9-4321-9772-1b52be8026c4', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-20' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cb8c3ccb-71fe-454d-833c-1b63d04daa18', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-07' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1863c75e-aa11-45f8-b02f-1c969e044882', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-06' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9446c14a-06e6-44d2-9ca7-1cb0e17fc8aa', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-09' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'671e6099-5a95-482b-b41b-1d9b26b9d7d9', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-25' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'79171a10-c0b0-4f70-a496-1de279556565', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-18' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e9aeb616-e737-4368-84ac-1e4e1ee4d22c', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-07' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd7292ffa-c235-4bcf-87be-1eb87d3e92d8', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-25' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b6aec44c-7d19-41c4-8af3-1f04eabeb715', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-10' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'019d6d68-a07e-4f33-b7e4-1f423673e6f6', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-09' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2cf01630-f09f-411d-beb6-1f88eff05290', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-20' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'af1f47e0-8298-4e6a-ac34-2031608fa7c7', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-21' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3040fd31-62a3-4c44-8aec-206d74a9c069', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-11' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'baf8d6b6-b3c3-4c65-be06-20ce22c8dbd4', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-07' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dce98fe4-4617-434d-ad77-20faa997c9a9', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-30' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4480a250-d57c-4a05-9d68-2155d835e0cf', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-12' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e815020f-3645-4779-8d65-21baf4d8d510', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-19' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'315016c0-2ef3-4a9a-afa0-21c50b5351a7', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-24' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'24faa85c-f702-482f-a47f-21dbc81e3a82', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-02' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8b0efcee-0161-430b-a939-2205fbdcb006', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-25' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'71fab4f4-f36f-4503-a3aa-22199d6d2d92', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-14' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'52c12c3d-f1d5-4708-af28-221ce466bd83', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-04-29' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c8e5b4cb-1385-4c7a-a25c-222cb25cb4a6', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-27' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ac23fd8c-5ce7-426c-94fc-22625f2da3d0', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-14' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6c8df946-96a7-4e7f-95a1-22ed739f6e4b', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-18' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5e96f65e-0b48-4449-9cdf-22ee489e3a3b', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-02' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8e25137b-9e69-4c60-83a7-235a8b55150c', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-11' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e2484d07-15f3-4f6e-b23b-23c5ee12478d', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-20' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8d00c010-fa0a-4e4f-aeb4-23c628d7eecc', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-10' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4ee9d4cf-32b2-4f7a-ad6c-23d659784312', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-17' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'af6278e0-6ef4-466f-ae51-249ac307703d', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-10' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'df51bcfb-5f0e-45d4-91b1-24b50e3d9fa4', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-18' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a5a5dd83-f4fc-45f6-92f4-258b04154276', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-17' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2b096648-a13c-440c-8efb-25b16002e817', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-15' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b550056d-1034-404e-b123-25bd2d5a9c60', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-22' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'96bb0939-51ef-4724-99d4-261579df51f5', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-25' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0440268d-526a-4c52-b749-269d987a796f', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-11' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6f8e8c48-d169-477c-800c-27163d914a39', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-08' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'42884039-18b3-4788-a9b3-27ec89e7b32a', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-17' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ce77d06b-8b16-4dd2-a856-285785312935', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-25' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'eb66bd37-e4cb-4921-9a2d-28d5bf4ed57a', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-19' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ce821c33-9e04-4e15-9ae0-291c301cc69a', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-24' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'344a2a74-8990-4e78-b201-294805e9db52', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-23' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'aa6bc958-dd53-4a46-89e9-2a87bf20f7d7', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-25' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9dc563e2-0418-4ee9-a8f7-2abccaf3acb1', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-17' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f94b3c70-ec45-44da-8a36-2ba950f347e3', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-18' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8c0192a2-4234-4082-935b-2bcfa73313ed', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-18' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'18b42b7a-3bae-44e9-a8e1-2bfded611015', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-09' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'976db02c-5020-4626-b596-2c0a453cb393', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-18' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'008d907d-4d4c-4d8c-b11d-2c166c42e39c', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-18' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b3082fcc-f83d-4782-b2cb-2c1711a837e0', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-05' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'79ab1244-7295-474d-82bf-2c5202ccfe5d', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-18' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cd89edcf-6ab5-471a-a82b-2ca09ac891c1', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-08' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'64725627-011f-422a-8a08-2cb38b44f0f3', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-21' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'470257cc-2792-4ba0-a2f0-2e0103647eab', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-19' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7236d1e2-4861-48ec-8c75-2e0b8c01d1d1', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-12' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1136b916-7fb6-4b0e-bd2f-2e375197d192', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-08' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c265d1ed-7d98-4aa9-941f-300602d3b555', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-01' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2bc7fe5d-df14-4c2f-a85b-307c069d68ea', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-10' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0c9ad7de-8955-4b6b-81f5-311195ac9ee8', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-21' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bd3a18be-2957-4f37-a719-3167d153acd8', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-26' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5980661b-8cec-4481-9c76-32571f749e19', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-04' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'71ad3584-03a4-43b2-8746-32896bccc8fa', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-19' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ef09c6f7-b11c-4593-a108-328f636c0380', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-19' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b6c4682d-d0c8-47f0-ae7c-33683453920a', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-01' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1ce2ac1f-f3e7-467c-a0eb-338f1fa5a289', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-08' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8b329452-04c6-4084-bc26-33a5a56a668f', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-17' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fa56235b-9ab2-4c6d-a685-34131ec3c187', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-23' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'65a5513e-a77e-4996-bde7-34aabc6efc97', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-05' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2e0fd6e4-44a0-4d3e-ae89-353d09ccb3e5', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-31' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b704ad84-1613-49b2-8e52-354111fc4931', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-17' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4ef013bd-1974-4c2a-b9b5-358a69e44512', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-22' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ea41844c-bfe4-4109-9aed-35a1ebf3ccc7', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-15' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3be74028-a717-4203-8702-36f501f68ebd', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-18' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'222423e7-510a-4956-9c6c-37f0657dbf0a', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-25' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0d4da6ed-224c-4c90-9522-37fec9109e91', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-05' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a91d4cd2-66ca-44fe-841b-386c3dbd709c', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-06' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4bd454c8-3560-4168-80a4-38c3b8726a3b', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-07' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c61bc054-5e67-4dee-8508-38cdc2524dc4', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-04-30' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'db397a04-769e-4609-ac1a-39b8260a965e', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-26' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'73671b96-58cc-4a34-bd30-39f5a11f1dd8', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-03' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'19a1d74c-fbbd-42ad-9208-39ff3e101575', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-14' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'71ed191a-85b0-490e-8c28-3a0c5d1e107c', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-06' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a4cdb70f-d331-46cd-aeba-3a1c998fa04d', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-20' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd6298b7b-27f3-4c4a-b5fb-3a530b182f93', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-21' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f703612e-feaa-47ea-8d34-3a9b5c676719', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-08' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a1792801-e62f-474e-8c12-3afb36ba7278', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-29' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c2869276-a6a0-4fec-8ab3-3b0ffdc49c79', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-21' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fb34f375-0574-443d-9512-3b1e5d5fc127', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-12' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0d19b867-05be-4bbb-8607-3b4216871a0f', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-27' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b2e46ed9-6e8b-4440-97e3-3c22e5a03f78', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-05' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2c012bfb-7a91-4dee-bd85-3cc1130c9b3e', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-19' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a08fb092-6270-4b85-9dd7-3cce0272b125', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-09' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd88d5bc7-6d99-4711-af08-3ccfcd295527', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-09' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd5360e8f-ddd7-4288-873f-3d0a6deeaaa3', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-13' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b7d555ba-bda1-4ad2-9629-3d20f06a7500', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-08' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7cb9c875-5f22-4446-90b4-3d52d7e0c054', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-21' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ec0e1353-03f2-4c64-a979-3dc50dc4a2b5', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-29' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'eb37f233-ada4-412e-8dce-3e4747a4b222', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-11' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ee54dea7-04f5-4412-935f-3ee1e1fceb7c', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-04' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ca0f7438-0aa7-43e6-8926-3fb075100483', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-27' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6c751a91-e039-44ae-9c07-4077e4f635de', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-28' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'599abe89-82b3-4c41-9c8a-40b79ced571c', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-20' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5e42cca2-d5f7-42d0-b2b9-4149432096f9', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-23' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'791f5506-c71e-4f3e-9987-4154c56f82ae', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-14' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e933f076-81a2-4ecb-99e4-41d6a96f3c6b', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-14' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dda2e481-9c83-401d-9525-42340d3f5f80', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-07' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2400f1c9-190f-497b-b6c3-42a27cf8704b', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-31' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'59f62ab2-1c85-4a55-880d-42db5ff042da', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-26' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0016d2e7-d182-44c4-a90a-42fe2133f23b', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-04-29' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b097e6ad-2ad6-4ba2-a09b-43355868df82', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-20' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ef3c4794-29f2-4bd3-a077-43efeca964cc', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-10' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'31de65b0-3ead-4a26-880c-4431213dba7e', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-02' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6a05bc42-0c24-48bf-a3ac-44ba474b462d', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-08' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'67af0d8e-e872-4507-94b8-44e77b8fa07a', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-15' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'435bf888-29e7-4237-b2e2-44e9d43c05f3', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-21' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bf93411f-112d-4459-aa3a-457cd2806732', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-02' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0aad42f9-ee2e-4a64-a362-45bde42f65be', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-05' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a85ff801-e8b8-4407-aed1-45e67347c093', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-12' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'538dc30a-d138-4358-a807-46b33ab2d75e', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-19' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3b9501ff-f654-4b41-96f9-4798d319b15d', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-18' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c3c0b6fe-9882-4bc1-b9b5-47ac77ace718', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-21' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'69ece30c-e837-479f-abd5-47c40ff295c4', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-15' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4d17466a-cacb-4214-aacf-4802ef4abe2b', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-26' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd8c89fed-696b-48c7-ad57-48383f66ce92', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-24' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9ae9ed6a-1760-42b8-b475-483dc9dbaadc', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-26' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3f458a9e-6070-477d-942c-4898de37b127', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-26' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2ea38527-808b-4a33-ba47-495f79c2c6ac', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-19' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6c5efc54-8dbf-44b9-8e5a-49e834a25e8e', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-18' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'da8c88fd-0c84-4d24-83db-4a8bf01e735e', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-06' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'608b7608-5ef6-459b-9e73-4aac0476bea8', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-13' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e2a105cf-e604-4bbd-b0ce-4af41d0edb98', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-15' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a55077bb-a01f-4c72-bf78-4bb3f95cc6e2', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-04' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'46da3f58-e091-4f74-9d9f-4bb9afbc25b2', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-07' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'40ab873c-1361-4f6a-82b7-4c121eecafc5', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-11' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3575e58b-86b6-4f56-aae1-4c41484be7c2', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-26' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1553228d-8381-4b00-a482-4ca0163677b9', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-16' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'47af7606-694e-4fc5-8cd2-4d5e5dd66b92', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-03' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a04f05f4-9ac1-4c77-92a1-4eb218fe9c1e', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-10' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e4f9d4f1-582d-4e70-a7ea-4ebf4d0d0fc1', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-16' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'09efacfa-b23e-4962-910b-4ed1aa505a1d', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-07' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8fb1132a-75ad-45cc-8b74-4ed2c544e068', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-10' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd5299946-00f9-4ee9-9768-4eee6c391eb0', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-19' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3a6b8e3a-681a-45ee-aae1-4f50facf245e', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-10' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'40d9e241-156f-4a5e-acf0-4fbd0cbadf54', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-26' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e0823eae-98a8-48b0-b000-4fc81e9f0a66', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-09' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a57fb262-0ef9-4f9a-b96e-509355d63c20', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-05' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8c986524-bd49-4b0f-ba59-51076f5c94f2', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-06' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a80169eb-56f2-4eb9-8780-522dd492766f', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-20' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd8df6b77-bc05-474b-8ea8-525f2e6a830d', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-13' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'16966866-7920-4022-bf86-53267fe1b43f', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-05' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'37ad24ea-aaad-4107-8c26-532dfeb52698', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-18' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dd82fdf6-fa31-4101-831e-53348590bd8a', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-08' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1cbbdc2c-3ca5-408f-9da8-542ae54187cf', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-16' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'05a840a1-5ff8-4c46-8280-54678a462703', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-16' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1c6e009b-1d26-4ccd-9e7a-551da93ff1f2', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-29' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd5adb8b1-fc7c-4fac-a679-55e8a800ac19', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-02' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0751f995-3cc1-4af7-ad83-55f213b01ab4', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-03' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'02e6d2c0-ffeb-466c-bbab-56622ed6a67e', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-27' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cb4c0992-d33d-4471-bf7e-56add9c0d7a9', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-10' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a77a3058-aa8e-42bf-b62d-56b18f30e71f', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-30' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b7d3da0f-ff05-41a3-a1e0-56cb6a173f22', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-13' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3297e148-d22b-47bf-abce-5775ad608c6e', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-10' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4cb81576-cb5f-4ec4-b924-58bfbf2048f6', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-22' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9d820fa8-637d-4947-aa21-59176669e86d', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-04-29' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3f267977-2007-4e04-8ce7-59fa43ffc38e', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-07' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'788aacd6-424f-4027-b5df-5b27f6f9a280', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-18' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b428c90f-a6ae-4e6a-8d5e-5b881133cf81', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-15' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c4419e17-6be8-4d7d-80c9-5b88811178a2', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-25' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c32cf3cd-ce3e-4f94-b76b-5bdbfab756cd', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-04-30' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'73bef92f-6354-4b1d-ba83-5c36eb6d68b4', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-20' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7fcaae6d-8085-4799-8295-5c54d9e81a15', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-15' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'eb68b555-0992-4ced-9ff2-5c67750ebb5a', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-23' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4322492c-f4ee-4345-ae31-5c8254766430', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-24' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7bf1e281-83f7-407f-a7f7-5cad7ee64039', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-22' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'69196019-7164-48e5-ba77-5d69a6d86da6', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-16' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3807dbcf-bae1-4ded-9487-5d8b6e12cf26', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-26' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1f3a34f0-262c-43ed-a89b-5e980765e6b2', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-15' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'793a3442-dfc7-4acf-9e9c-5f28ec519059', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-08' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'34457cc8-760b-4d34-a521-5f5e6871b8db', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-24' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd6333a75-c632-4e91-8ade-5f7e76eea027', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-29' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2b0170de-3665-4ad7-84dd-60110eb8893c', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-21' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bb14f641-e2c3-43a9-8c61-604880f4825f', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-16' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd7fda9d4-29a6-4fd1-aa5e-611ecf0e5d41', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-19' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0602f9a7-fa55-4c97-bf54-614aeedaf6b4', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-25' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dd00f13c-ec78-459f-bd7d-61a0c282aca7', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-23' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ccb58c0a-30d3-47f7-93ff-61b57c39bdc7', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-26' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'00e940b8-b55c-424a-bbae-622ce8277947', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-23' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'159c621c-2c2e-43be-b625-62599fc6b970', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-04' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4f4f6d06-a04f-47b1-a7f6-626b3475a9ff', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-28' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b720b957-8f66-466b-918e-626b796b2934', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-13' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'41bf471a-9f7d-4953-ae32-62bcb5e8a4c0', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-20' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a80db587-6350-431b-b896-630ca1b2d25b', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-24' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'35b415b3-5a55-443c-9f9d-631c744c70ac', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-01' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a0a9fdf5-d9be-430d-9b10-634050bcef6f', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-18' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fc9f3276-f2f9-4496-bf53-635b6efe8f5e', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-22' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b5a172ab-6db5-450d-bcd2-63717f572f0e', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-17' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'934e4bb3-ba4c-4911-a937-639a467a6f00', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-20' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3169e718-63f0-4122-9b2a-63aa788fcc3f', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-26' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b1fd285f-6b90-4326-8185-63b7c6c00563', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-21' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f9a814f8-6cbc-430f-a5d2-63b8dc45475a', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-25' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'002935a3-f38f-4d3c-a28b-63e006328e1f', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-27' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e93f6f85-db97-4597-8a4e-63e86db4b475', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-14' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3bda18cd-697c-45db-993c-63ee6a609604', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-03' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b04cdef9-51b7-4e1d-a9a7-641450546888', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-20' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3a82ac09-942f-49df-be8e-64163d6e54a2', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-04' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f2ad2230-97d0-4821-9462-647c471e50b6', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-03' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9f573fa1-21fa-40bf-a673-647e6b7ba3d3', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-05' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c5625cf3-aa91-4937-98a5-64a79cc272b7', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-25' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2627f648-7153-4485-8e62-64b0d3345502', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-06' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'10f44996-8307-4d66-b6fb-64b3be14d8f8', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-07' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'acd9ebb8-909f-49f8-bf16-64d4195e54af', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-09' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e883bbfb-fbdc-4f36-bdd8-64d97ecd7be1', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-09' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ae3f6e27-e494-44cc-9a79-64e17e167376', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-09' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2306b79c-4379-4107-b921-64edbd9357d0', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-04-30' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c4c4258d-9807-4bce-a188-64ffe09d469f', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-24' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f2bad73b-b596-4fed-839a-652b7bcd86f6', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-04' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a731d756-4bba-4180-8959-6551b000ed34', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-05' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'94d0e827-0bcf-4775-bbc4-655c440c44e7', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-04' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b010d585-3ad7-4fa3-a101-6579cdd3292d', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-10' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'72186c49-94cc-40ac-822b-658593c1fbc8', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-18' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a40e3067-ec44-44cc-8cd8-65fbc3f2ecc2', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-19' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'94212538-1ead-4478-9596-66b72816cc97', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-25' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ec76a835-2f45-48e5-8f35-66e4eb062068', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-14' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'22597ce7-4073-4622-84ae-66e96386df77', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-17' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fb9cb846-4f04-4f16-8c28-6711a03fab8d', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-22' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd4c93fbc-a46c-48ad-b262-67ae66e250bf', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-17' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0457367f-f8cd-42d0-9d26-68061214c2d1', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-04-28' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ca5c7c70-edf1-43ea-b192-680aa34c0848', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-10' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'09b9e021-7066-4611-8c78-680ce1ee09cf', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-23' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd354413b-ce90-4f0d-ac6e-681973fb7ba8', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-21' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'de15c051-6abf-4b4d-9e62-681f5dd165b5', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-07' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'73ab13a2-1c62-4454-b187-6833a2b01b1c', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-22' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'848d4c79-fafa-47a6-b422-683acc2ede44', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-22' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'30788c9b-a0c8-41ed-9553-68e43c92551f', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-26' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'faaca325-3a51-4f31-82ef-6932f6aefa06', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-22' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5775e26c-e27b-4dcb-b88c-69881f896b92', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-03' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9c5fe5d6-38b3-450c-8fe0-69a55f264243', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-10' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dc7c4f3e-ef05-4371-ba74-69cdc074a277', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-01' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'48712fa7-f3a3-4816-90a0-69f66c7e3dcd', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-04-29' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'238f4ff6-3c0d-43fd-93b0-6a3fadc735df', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-24' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'76530667-025c-4cec-b64c-6a9fa07c6dbb', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-22' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd0af3adf-712a-4066-8209-6adc90007267', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-17' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a3e55b65-3b5c-4ccf-98d9-6b2b513f7a57', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-25' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0224fe98-84f7-4f2c-ae45-6b4225cd39c2', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-28' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'87a6868f-4a11-4393-9d49-6b6d7b7b81c5', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-19' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b60336e4-b6fd-42fe-9f1e-6bbe11d12e66', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-10' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'457fe6ea-cf20-4e3c-89a3-6bc1775ca3ba', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-14' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4a1139e0-dcc7-4c20-9a76-6bd82bf7f3c3', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-25' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd62b9808-f2ab-4f5d-bb90-6c0010cab500', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-14' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a7ee67ea-3904-4fd3-98bd-6c33a47892a7', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-24' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ef98208c-0168-40b6-b530-6c3a44184502', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-14' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd255f08c-a8d7-4240-b818-6c64743c50d6', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-28' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f2f9caf5-b84c-4263-8276-6c70d1655204', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-13' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2e7d7165-88fa-4afa-af3d-6cdc6fb88302', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-27' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'69385419-0d60-42c3-99a0-6d858c5f03c6', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-12' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f9e77fa2-544f-49af-bb27-6da7bcddb217', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-04' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'db6fc14d-ecad-4c89-8037-6de66fb5d40a', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-11' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b59582ae-bf03-42fb-8034-6e1070ebc1ea', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-14' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3a4062fb-50bf-46ae-a922-6e382a16e230', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-24' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'438977ff-67f5-4ef1-936c-6e548fbd6d5e', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-15' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9515fe68-d2ae-4573-a433-6e75bc32c3ca', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-15' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0fda499e-2c05-4471-b7cc-6eb6013a2d7a', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-08' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'73ac97d2-3dfa-42ff-8dae-6eede3cf382d', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-26' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b5ca410f-e912-48d8-8037-6f00eebcf69b', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-11' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'30edfb0a-2376-42f1-aff4-6f14cea77569', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-25' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'71072698-fac2-488e-83ff-6f23257fef54', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-24' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4ebb7880-37a5-471a-b395-6f30967a5620', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-09' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1465db59-8241-488a-9d4a-6f4a95b9186e', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-01' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9f648bb8-ab77-466e-abad-6f754be1cb51', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-16' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'eda3bb99-fba6-4da5-96c0-6f919d69287b', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-25' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3378598c-83be-4c81-9df2-6fbbf0e85812', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-17' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ffca396d-f200-413b-b558-6fd518faee27', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-26' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'afee90ef-521d-4277-ac9b-6fee31779dc3', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-19' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4b72cc64-588d-4508-b480-7060da2f5f90', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-29' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7885cced-f09d-4d40-8217-70b42a4b4b65', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-19' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bf2fe35c-f509-4a9c-818b-70c9bb4dbeb9', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-21' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'32816c7a-1884-4827-a6f9-71210b3cf03d', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-21' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'27d45e87-624b-4cb7-836d-7183679b4674', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-16' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e583381d-3c8c-453c-861d-719587f8f858', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-15' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6a89b080-8821-4f47-8673-71b39695aafa', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-11' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a1807a9e-0f79-4e98-9271-71ff61dc03ac', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-09' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'81067fe9-2185-4517-8b3c-7210d033dbd9', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-14' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dfc0da94-d86c-4fed-a257-722d4aa91f0f', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-25' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'82624013-941e-4907-95c0-72315b42c53b', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-01' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e1b8d90f-d85c-4d1f-98ba-72afbb496ed7', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-19' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'40252413-414f-484f-b550-72b4065aba96', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-17' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c7131c2f-6252-4c30-925d-72d499ccc1b4', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-19' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'740bfcfd-6e38-4ef6-895f-72fb05e53283', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-17' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'915c9d3e-76c5-483d-b75e-7309cca188e2', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-18' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b9e8de32-f36a-4c79-a129-730aa0b3f174', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-09' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dfddae74-965b-4d12-a6b2-735bd0720caf', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-24' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8bf3e98e-54cd-454a-9942-737018a7aac5', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-06' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'409e885d-3f32-49fb-bd0c-739194884064', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-10' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9c8ff392-902d-4679-abff-73baefa3400a', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-02' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3336908a-4d01-4b2c-8b70-73f32932696d', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-23' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e7968a9b-1367-4753-868a-740139c05c50', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-04-29' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'eb4aff41-4ece-4e4b-b7d8-7411f88dbad2', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-10' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8c54c91b-1390-4fd5-87f7-7475be70b1d1', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-04-29' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b29945de-87ca-4411-81a1-748bb0bb2a79', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-17' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'aae7ec72-42ff-4695-8de2-749feba38b55', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-18' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'99d694ce-8309-423d-9c14-74f0e0f67efb', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-13' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c6f8d6f3-ec8c-429a-9bdf-75a09dca6b24', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-17' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2945e718-16eb-4997-ab76-75a41fc621d0', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-20' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8e5e8179-5a89-4999-a671-769fb87c887f', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-14' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4ace4a07-bb6f-4625-b686-76e447511fc5', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-15' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'30f3dcea-a454-4a80-be22-76f96323fa58', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-12' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'84770824-476e-484e-af9b-770e8f45aa8a', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-17' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2776635d-0246-48e0-bce5-7737168fc07f', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-25' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9dfe1f27-2303-4a05-8095-778ed44de43d', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-26' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b879b8cf-d007-49f4-9fdb-7797c852db29', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-04' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'769057fd-97fc-47fa-93ed-77c777a799fd', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-27' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd4017b18-4c99-49df-8e49-78029d8a1ca1', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-26' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0c3aedbf-47c5-4d46-9763-78091497f447', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-23' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a7724a7c-ef60-4b24-886c-781c657a9249', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-07' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'66bb00b2-d0c9-4a94-8ae9-78f0c445d2cb', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-20' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'25aaba1d-b273-4d53-bc1f-790726cc8cee', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-13' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6573ce16-4b49-413f-9a32-796ba9a4ff70', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-14' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b45e43ed-2c6a-452d-a1f9-798f136d74db', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-03' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a9d83883-b9d1-46c0-8e5c-79a825ea7bc3', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-27' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f05cc44a-f196-43a8-8c2c-7a111753e387', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-02' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'af3d7436-833a-490c-94ea-7a1487e7486e', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-19' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'adaf4cec-a154-49f4-adc1-7a948e88873b', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-05' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fd727633-cb56-409c-af1f-7aaff363d40d', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-01' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ba70dca8-b182-49f4-b272-7ab2157f90c7', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-27' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'84b5ab27-1088-44f2-a776-7acf25480794', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-27' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c61e8a10-0a90-486c-b62b-7ad736f5bf1f', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-25' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'25ff94b3-6fd6-45df-b8ef-7af58676299c', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-04' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2636c14b-5f6d-4887-b1a2-7b661e10c5f7', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-19' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5b566396-e898-4049-99e9-7b8d470eaa77', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-21' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'95ee9f26-bd85-4752-bc0a-7bcf9d4c96fd', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-13' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'261f4346-4003-408c-9abb-7bd787f4f47f', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-02' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'59d9bd74-fa57-4e6e-a0f5-7be593b25a1e', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-11' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a7ecda7a-2440-464b-a781-7be81d11616e', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-17' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c02572ae-1b88-44f4-8600-7c173ebdd7bd', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-30' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'03fdfa9f-667d-47e1-9cec-7c19a5608eb0', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-04' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8af54344-ca62-4ca6-afab-7c3e0f038adf', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-04' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'be79c6a4-bd2c-4a42-86e3-7c7ea62fa2be', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-03' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'22df21ce-d394-490c-9456-7cbe7d48fb34', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-17' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'309393df-c8a4-4e55-b6ca-7cde85c7be0b', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-10' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4e597ee1-f310-42b9-b275-7d6232c86054', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-04' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'858011e6-aa6f-4969-b963-7da23a701899', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-24' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd32ca146-4d78-4b90-8028-7e190faa5630', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-25' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f06cebbf-91c2-43e9-9d3b-7e2dc3af6aad', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-20' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3357f746-d5e0-4a75-92ad-7e30a91315a1', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-28' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bd80cfe5-6f54-4c17-893a-7e37829d6d03', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-04-28' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8a0ab4ac-7e44-47a0-8582-7e4fbbdb27c1', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-09' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c135b080-b187-466c-8f2d-7eb6c02dd4bc', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-27' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e4a20815-7baf-441e-a2a4-7ed10e8a5da3', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-15' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'35bfa477-1a82-465e-9a87-7eec6f38c125', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-15' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c39b72b2-a5a4-47a7-889b-7fc932fc2bb2', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-20' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5a8eb9a8-177d-4705-98e7-7feb6bef0320', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-04-30' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4f2cdc8f-f3e2-4425-9b24-801be09f7b97', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-07' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a62e98e4-3403-431f-862f-8053aee54f97', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-02' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ff92df24-4f1b-4016-bae7-80c2066d4285', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-29' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2beaac48-b092-4302-9092-80d036589532', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-12' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9c2588b5-5fff-44a1-ac6e-80d31e5d0685', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-20' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'46bc94f1-6f49-4ce9-a09c-810a0ceca061', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-13' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'303d3db0-dc07-463d-8e03-82923a2097c6', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-08' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b6523dde-ace6-44f2-8e40-82a89403b400', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-05' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fac51ce5-ed28-4c56-a2ed-82db69175221', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-08' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'745f515d-bfa2-4f81-a1c4-82dffd6766eb', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-22' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'032a309c-23b8-44fd-b786-8301f06606fd', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-11' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'168c1d43-d490-4903-986f-830c0b26d0d1', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-26' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'47f43077-9de3-4b9a-bf1e-8388941e469d', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-17' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b17b9294-d961-4888-91f8-839b2a2c48e6', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-12' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'eff06ee6-1b06-4aa3-b7d0-83a9eb64f559', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-14' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0e661e89-bc02-4359-ab16-83afcc785712', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-24' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9c02519d-82ac-4704-a527-83cb70881d24', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-17' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a0a9b5bc-aae0-4eb9-a0b1-83f94aada8c4', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-19' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6916e5f0-b051-4ab4-9bd2-84099c62e623', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-01' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2f364d82-39c1-41cc-9ae1-8409dcf4597d', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-19' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'43f0925d-a745-4560-b344-840caceeef0e', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-15' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'47d02431-dea8-4825-b1a2-840dac0db183', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-08' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4f90873a-b7af-4908-9dbc-840fd583cbb2', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-04-29' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fb26420c-edd9-4f55-89b8-842d7f850910', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-04-29' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'74199b52-8892-4c14-b21d-8462481c6bcd', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-04-28' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c9590005-fee0-4a54-9de3-84704ddd0918', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-28' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dd2333c2-1fb1-4402-b17e-8477421401e0', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-23' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f813817b-6bf8-41e6-bb42-8527a25e51c7', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-07' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'59983a3e-c9e6-438a-a806-85990e01c110', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-09' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6dc6e7b7-5808-4903-af86-85ba78c2b298', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-21' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f7c5e1d4-da7a-4997-90f5-8632dad2da65', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-06' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6ae7f0b5-8149-40ff-8375-86723c9ef42d', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-09' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0202fd8f-7186-4ac6-8d95-868190d7a0b3', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-17' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fd55f04d-4ee6-4980-ad7b-869e528335cb', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-11' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b6ccda10-3fe7-4a60-8ae4-86a1c4a73db7', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-21' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7efab013-dbc4-4d6e-bec6-86cf2ca97a39', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-11' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'27ea2f74-b313-46b2-b487-87002f1fe97c', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-14' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'48e4106f-d32d-4bd2-879d-87a939f8dd78', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-23' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'76fc089a-6401-4bc7-a6fb-87bb7eff6d8c', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-27' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dd22a718-24ad-4042-856b-87e269bdedfe', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-20' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b6d1507c-32e7-4ffd-bfd9-883a22dca52e', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-22' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7cf88cac-36e9-4082-96f0-88950671fac9', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-02' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b8de8fc1-63e6-4511-83d0-88e1b13c3924', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-21' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a0de4d1e-c195-44ad-8ead-88e50e95644d', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-28' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'783ffb3c-b885-4cce-a6bb-89abafb4d1ca', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-30' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f09aafe9-eb74-4eb8-8cf3-89b5ee28ef96', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-04' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2711c42b-f2eb-4789-8eab-89c14da1be2d', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-18' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'15746363-41b3-4b25-af8a-89c371338c0f', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-11' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0cff30b2-07e7-40bf-a7d7-8a17268347b2', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-25' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'41161a0a-d74c-4a8b-ace6-8a61e0c4a099', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-22' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b4d01d4c-bc3b-42f1-bd37-8abe364aeade', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-02' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8c17c1ab-2b6d-49ad-8a81-8ad335fb04d6', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-28' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'13fbb949-d4c4-4aa2-b18f-8aea0aa4132e', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-16' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6387f256-c289-4688-9c19-8b27e35f2fea', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-21' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ee8c8aab-fd69-4c01-b975-8b32cb2bbd13', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-22' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bf612417-a951-48a4-8285-8b624e638c3d', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-27' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'070fd8fa-020e-4984-a5ad-8b7b5161724e', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-02' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'66c227bb-0ab7-4393-a1a1-8b8dfbbf97e3', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-23' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'436ced6e-d4d4-4285-a2f5-8baec5dd7950', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-27' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd25d0f3e-9452-4ad6-8119-8bb50ee00a9f', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-29' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fb5c9f8e-b822-41f4-bccc-8bdb34be36c8', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-04-29' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1f70e324-3c6a-4fe7-af8b-8ce0e9df9344', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-03' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b572b8d5-cbbb-483e-845d-8d073baa4a0e', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-29' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a5731d9b-6d49-4ecc-a8ec-8d1a0a33c768', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-15' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6ddb2a7a-bac7-4368-a2cb-8d1dfba82eeb', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-03' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'41f79165-2058-4ebe-837e-8d20522c1bd2', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-13' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'28657246-6c8b-4834-8344-8d7eae99ea7e', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-12' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1e088fc0-4d0d-4d65-a295-8d93b17efc96', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-22' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'56a9c1e4-bac4-4d0e-99c1-8dd002d610c3', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-02' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'aab77fef-4aea-4caa-adf5-8e24d34e2b63', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-29' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e08b9667-8795-4dc1-9d62-8e565ca1d640', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-12' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'514968a6-f925-41f4-b9b0-8ee1333967d3', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-25' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'19f9c331-faea-48c5-89b3-8eec7b4eb899', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-26' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'885e3e47-1031-45c3-af63-8ef5318ee350', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-26' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'046ebb26-56c3-49d1-bb0b-8f77812c0be6', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-27' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c9c52c80-8e16-491e-97e1-8f79b5b00316', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-07' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'41295441-5abe-4b6a-aa4b-8f90fc778cdb', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-06' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1988ac8d-afc2-46c2-a463-8fbc83e53818', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-21' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5f14e121-950f-40a0-8c7d-8fbe46e1c396', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-08' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'20c34c06-e94f-48a6-b740-8fc5b6bfd223', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-02' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bcc2844f-8cba-4e6c-b1e1-8fd81630947b', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-11' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3c8c989d-1fe8-4f95-a40e-8ff5918a3f43', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-12' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'02839532-94eb-4f0c-acc6-900e0a5951ff', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-21' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5633a4df-36d1-45c0-a4f1-907dba07bf19', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-11' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'087a5d4e-d772-4f3f-a2e8-908fd4eab0c2', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-11' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0d97df28-d372-4d1d-add9-90af7c314197', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-21' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0c4f74b4-cca2-4148-9a31-90b6fd7be3cf', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-16' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'34019f40-ea0c-467d-be48-90ef46f35cc0', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-08' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'085a85bf-f9c7-48cc-a657-90f70fda1cfe', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-10' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'821a094d-c2a3-46ab-8d68-9144aee80c1a', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-12' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'612019f2-5b3a-4c79-8fc3-91758044e656', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-19' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cc7b960a-3c4b-405e-9ba0-917cb8708a18', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-03' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'83b16ecd-e54e-463a-9831-91ae80a4623a', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-25' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cdd544c1-2a5a-4b0f-b89f-91d6aef7cd91', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-28' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd65c38d9-abab-4a64-9a5d-9215a399571d', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-19' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4ab1a8f4-4d32-4eb4-a22f-9250f5d6f993', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-03' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'69b86b4b-e77b-4d34-b3aa-9297423a5d85', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-31' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c7fb46bc-be4d-40a6-93ef-92b7b2b7ae9b', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-09' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6039110c-c251-4783-99f3-92ccee2b8f79', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-28' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a9ced262-62e9-4c92-8e16-9359d4347e55', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-14' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ebd10385-d957-4316-864b-93b4b603715c', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-03' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7e5070ce-5f9f-4c53-9c34-93c3c9eb04a1', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-13' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'56ee0f8f-b2a8-45bd-b518-93d96983fdf4', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-20' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1faccf90-7b76-477d-b25c-9427c9417013', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-09' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f7859c68-646c-4a69-9c18-942d3fccb835', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-12' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7f388724-4f44-49ba-911c-949cc1bdfa9a', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-10' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a077c9be-41bf-405a-a6b9-955de278d849', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-26' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'75b81c61-6fe2-4455-8af4-95aa18b0a8e5', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-12' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'350d7558-eb29-478f-87bc-960aa19a2be8', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-14' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e76fc33b-94a6-4c41-9022-96175ad058e2', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-13' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8dede7db-cb89-48c4-9df1-963cba78c95d', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-23' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7ce4ca43-43d4-4ae2-8260-964adfe174df', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-22' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a2b3703e-5f1f-42c9-b156-966072413e9d', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-28' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'250cf214-0ba5-4d25-8580-966f18a44eb1', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-24' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ef8848cd-1354-4ebd-aadf-967edd60feec', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-22' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3dcdecb4-9983-4907-bd7c-9685beb5cce1', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-09' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'82ea091e-2ea4-4311-a52b-969ef560fc26', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-03' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'26b835ef-ce92-421d-bbe3-971eebde7a64', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-25' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5a65abcf-f92b-423c-8244-972119a1f6f7', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-03' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'89e52cd4-0603-4a74-9167-97594fa5efec', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-10' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'771f18e0-a43f-4b8a-80da-978a1bf1dbf1', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-21' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'71520ec4-dd8d-4bfc-9990-978ba6dc9fb9', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-19' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'69d3e37b-5d73-439b-b730-979253799c05', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-03' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6086c32c-6772-47e7-9ca3-9797c526960e', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-21' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd31e89fc-f47f-4f0b-8d77-97caacf2ae52', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-23' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'41180e99-cc62-4089-b5af-97cf52cac570', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-13' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b2aeafd7-28ac-4b10-aaf4-97e781cae675', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-18' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'88f1ab9e-7d91-4c01-978d-989c1b80e4b8', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-23' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ebce349e-f9ed-4be0-bc97-98adc21b00cc', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-12' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ddda9e96-13d3-4543-8cd3-98d5f89c2a9a', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-25' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'886a652c-96d7-49a0-87bb-98dae9f18a17', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-13' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0a550d12-e21c-4a4f-9425-98dca1c601b2', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-20' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b58f590f-1f59-463c-86a4-98f4ee17d434', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-01' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'12cab885-4011-4c63-8204-993358a0f631', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-01' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ce56c8c5-be09-45e1-ab20-9963b50ac06b', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-24' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1202fea0-35bf-4ed0-99fc-99699f4f54c2', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-18' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'86f338ce-76d0-4c8a-8bf1-9975300dd1b9', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-27' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'193766e5-e775-418c-879c-997b39f5ae6b', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-06' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bb8819e3-29a0-4b8b-bffb-99a8e8c6ad65', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-20' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4fd169d1-df01-409d-93d0-9aca4eee351b', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-13' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8d6107da-e059-4ad7-a00c-9b090d276b76', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-10' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'20221084-3c01-458f-94cf-9ba0f3080bf3', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-23' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a75209ce-b636-4f33-81d6-9baaa6f42cf8', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-23' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7888d8c1-99c7-474e-b053-9c0c5e7f3cf5', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-29' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3e69971b-3197-4518-bdc3-9c244817552a', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-25' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'85990deb-dfb2-4871-b708-9c8f573f011f', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-04' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7f154e7e-aa48-4abd-b204-9d258df9efa3', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-15' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'84db3d89-2a7c-4769-b965-9d325a6e3a48', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-04-30' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7a1bf232-4733-48b7-ba0d-9d32fecab944', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-10' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'843e85d3-0c08-445f-9018-9d4ceebdf76d', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-28' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7822df94-e5cd-49ea-adbb-9d503984cdca', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-04-30' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fde75305-e936-4f7c-95e4-9d62603d6f43', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-16' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8162f02a-3e7d-4120-868b-9dc32a794053', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-14' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cba23032-4353-48ac-a652-9e3568d03229', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-04' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e7bd8147-64e0-4b54-9c81-9e46ae981dd0', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-04-27' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ef6f82c2-9134-4f50-a5c1-9e4dcc859301', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-30' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'60509df9-1486-49c5-9a32-9e84b27a8f40', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-13' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'218963d5-2d50-4b51-8b1c-9ee32c7018e6', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-03' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0426d866-6003-4038-95cc-9f154a352489', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-05' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3efb2c19-40ac-4910-b962-9f19bc9be5a3', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-26' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'caa5201d-fe3f-4808-9ee3-9f1a5b53bf53', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-07' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'81a774c8-a6ab-4137-ab97-9f5ddbf71442', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-23' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'812dd410-1f79-4b91-9fe8-9f7cafbc092a', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-18' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'700e2431-3dec-44a7-9d1c-a02de1389bf0', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-10' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'158fba5d-b5e5-4bfd-8d04-a0a42b8bd4b7', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-19' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'694897b9-0792-48e7-8990-a0aac6bb5ebb', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-12' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ea76e85c-2614-4c0e-b31e-a12815b9dbe7', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-16' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'40002001-710c-4562-b861-a155cba23ba3', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-19' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2c5ab759-8b1d-450c-9264-a18ec551a2b8', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-05' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b2987772-103e-4cc9-b9ca-a1b2eb732b5f', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-24' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7a6685b3-e3f0-4f53-a12c-a1b32e9f03c0', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-14' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3e84f5ab-d56b-49b0-bb92-a1b8c1395684', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-22' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6dab8bd1-ada5-44b7-b05a-a2097d57043e', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-07' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c4c3657f-2183-4061-91e2-a222f5681b84', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-20' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c45bcdd2-2b53-44dd-b219-a25150e8bdf9', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-09' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5ccb92c3-bdd6-43c2-ad44-a29b1edc5fc7', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-29' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'feff1512-8925-4d61-ae4d-a2b7263b4b4a', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-19' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'52ff6236-3064-47df-b2ec-a2bf8d8a7377', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-30' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fbeced46-38f3-4776-9d90-a31e872a1b81', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-26' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'77b3976c-9360-4538-bd70-a3404eea07c9', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-11' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'84eb9942-64d3-4b5b-b2ea-a4229b1901e8', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-13' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'412e470c-674e-4560-ac8e-a42afa20ab13', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-13' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'559d932e-7148-4c17-b495-a484a26c83f3', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-28' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'638bdc42-71e0-4aaa-822f-a4c70fa7b2c2', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-14' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'71087857-3a88-402e-bc4c-a527bb1f5ad1', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-29' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'68f17070-e693-4bfc-813e-a55a02cee87f', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-29' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd07e7e83-0c69-4a0a-bfe9-a57bc6ef4a94', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-03' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4e5fb3b7-854f-40c5-bf64-a585c4e9a15f', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-26' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'004b2128-cbed-4f58-9d6a-a59f67877081', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-12' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4f453ea7-1850-466d-9ff1-a5cd2ef05980', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-06' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a24f7da4-521b-43b8-a32f-a5d2fd18265e', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-24' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a14aa95d-1a01-42cd-865a-a5e662064988', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-13' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ff0dc258-93cb-46cc-b5bf-a5efd13a9fb4', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-15' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bee6c8f0-1d3b-468b-988c-a63b8129f906', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-07' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ba903d4f-3b93-4acf-aaff-a64ed354f4fd', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-09' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8b09e898-0adc-4336-ab12-a6c7b5bf5007', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-06' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c9e81d7f-a942-4e5f-9adf-a6e34e34f604', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-17' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e267088a-fef7-4eae-aa04-a76f84c5a4d0', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-15' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5e07ae1c-7e15-4c68-9ce7-a7c264eb8048', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-14' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ddbd4c83-4458-4dbe-b4a1-a7cff04b77dc', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-26' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'112da92f-4a37-4147-8667-a805c3fd9c70', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-13' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2eb26c3f-6436-4ff8-892d-a82c7cdf328b', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-16' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'db6068fa-a5c4-4ea6-9389-a8307bb1c353', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-24' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'963514e0-cb66-4fde-860a-a83425ae97fe', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-04' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'01ac039a-1c41-4ec4-9774-a8954c03ebe2', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-22' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'02892172-6a85-4dd3-9554-a95010687eeb', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-26' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1a990a48-640d-477d-ae36-a98184fd5a31', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-14' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8365a608-6b01-4b98-b95a-a9b8cdb6baac', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-04' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'19f8ae26-fe24-4158-92c3-a9e6f7951f36', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-16' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9cd0b508-0fb5-4f0b-b4ed-aa20a3c4d765', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-15' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7b9bac0c-b79c-4c92-a5e7-aa3a0161e8c9', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-20' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'04a31727-355f-4f19-92aa-aa3bd87636c8', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-10' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1a3caaea-2c2f-4b77-995a-aa7d541e182d', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-04' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e8b7f1f0-e610-4732-9ce5-aaa01f1ee66a', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-19' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'706dcadc-baaf-4806-82d0-aae2b235603b', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-16' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cc7549a4-4ccf-4a4d-b692-ab1dbb8ea022', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-04-29' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'612729a7-983c-4b1e-86d5-ab209d20b643', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-15' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fca180b5-46ab-4734-b85e-ab86b19d0ff9', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-11' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a7c31655-a98b-4ba2-9053-abcd875e95e1', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-17' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9cc68d50-1bb7-429a-90b1-abdc361db918', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-15' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'36f8bc5a-0e6b-4475-badc-ac0fb3a79100', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-11' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c50c06d8-63e2-4a39-9e92-ac1651b949c1', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-28' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'898cd4e5-d4a3-4fda-b49f-ac18b62ecbe9', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-21' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd46907d6-de42-4732-98e5-ac66a1ad566e', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-26' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'145127dc-6ea5-4600-9fce-ac6b1a09741c', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-26' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'79273967-3551-4c21-bad2-ac93329ceb1e', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-07' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4e74a5ef-7e81-446a-bc4d-acb03928d656', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-04-30' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'843bc8a5-62b9-4e31-9dcd-acbd5aa992e7', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-27' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'82dd61aa-1877-4591-b0a4-acc31e5f0e16', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-13' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c054bfe0-901a-4b84-bd86-acc496d0bad9', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-09' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'44b15214-ed6c-4936-8d99-acc5255be807', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-15' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ec0ea362-a869-4d5a-9341-acc666029ca9', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-09' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c55558be-90e7-4b2d-92f5-accf12c4e618', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-27' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0e22361a-66d4-439e-9007-ad1d85c69edf', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-18' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a11f128e-cae8-4c27-803d-ad64a0b95996', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-28' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'11835433-4401-4424-adf9-ad6cbb522d86', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-07' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8ad8d6e2-e2ff-4818-86fc-ad8ff0715227', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-19' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8b393d11-5466-4eb7-80c1-ad92890f8759', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-04-28' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd1ca853c-9f39-4d4a-9f9c-adc2aa1495a7', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-22' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f06fce89-7175-40c8-9f2b-add17281c22e', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-15' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4676e0fa-fc64-4cb9-a5a8-add23bd35b2e', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-25' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b3680665-f03d-4bb7-a892-adeaf1aa0c2c', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-09' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fa57b33f-89cb-415f-8bc8-ae2061af6008', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-07' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b8aae3ac-616a-4194-a5c9-aeb63723ad32', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-01' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f20a94ca-9e5a-43de-9d26-aebfe4012ef3', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-16' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'36ef5e7d-9299-4ba8-9ad0-aed805b33b60', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-22' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'de2ff9b6-7694-4014-9d92-aee688864ae0', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-01' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2931a354-05ca-453e-898b-af04680954df', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-23' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a76d8384-e2f6-4442-bebb-af0eba4d4d59', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-11' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5b978e68-d674-43ab-9f87-af70b792f975', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-27' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8a0f35a5-e24d-4e35-9061-af9462b1cc35', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-02' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a1d20488-0f75-4fa6-a150-afb3edbdf238', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-26' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a5ef11c1-5d5c-4d63-9e4f-aff64eacdb22', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-26' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cfac68c6-5136-42fd-8c25-b041ce8d56fc', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-06' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f34b3c3c-8a79-4611-b07a-b06b7e2611b2', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-09' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f6680bca-2e32-4e7c-b6af-b0908bf2e133', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-23' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3be828b3-1c7b-4c47-aa84-b0978e13d92e', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-15' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bd371da1-7d2f-41ba-8a32-b0bc87102d02', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-07' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1519d8bf-216e-4cfa-a7f4-b0c17405247e', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-05' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3cdc8bfe-315a-4788-a585-b10dbda53ec2', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-22' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fa5cc78f-dcf3-4707-b6e1-b12966173edf', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-03' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'80634abb-3269-489b-8a81-b16814790633', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-21' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e688c98c-280f-45a0-8f83-b1bcea93c956', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-05' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e34401ec-6099-4dab-9049-b2131fc35e13', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-12' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'319e3c3c-f206-46f6-a283-b27e9935b5d6', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-14' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4f1c12d6-dd57-4c18-b082-b2bcd00e743a', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-29' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e6d7a65e-753e-479a-ac4d-b2c5fda143ea', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-02' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'48fb261c-4c32-47d7-8094-b33c6676b67c', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-02' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'139b063e-b1e0-4554-ad08-b34e09952715', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-08' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'513f86d5-6ee6-47e4-9d3f-b362feb5aa97', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-05' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'03aab649-9c1e-4fba-b07a-b3677a8359a0', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-14' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3efb9e33-ca53-4e54-8bae-b3b8a26c6f93', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-04-30' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'16f6d3c4-4af1-4c11-bc2e-b45ef41fe7c1', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-27' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a681d4c5-7046-4c04-aa01-b46cdbbdd2cd', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-13' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'34773c00-f272-4e29-a5a3-b48909535f81', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-16' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ab548e7a-b078-4613-8484-b53205106d35', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-23' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cfe7582f-68d3-43de-8416-b5370505026a', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-31' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a94ae5f4-a309-412e-8ece-b537ba17facf', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-05' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'decd02f1-b161-45df-969e-b5392db96007', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-21' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5d8b4300-2908-4bc3-b2f6-b53c2d68be65', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-23' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e8276a5d-d88a-4cea-834d-b55fdf1ec0cc', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-30' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'09d24d0a-8ad1-433c-93b5-b55ff4152de1', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-28' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'eaeec22f-f047-49b7-b065-b56e8beb48ea', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-27' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'57776938-8c5a-4ccf-8a73-b5f8a66c0afc', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-12' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'122f9718-14f6-4ff5-a4d3-b608cd727fcb', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-03' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a9de0742-98aa-42d0-9934-b61d574ef1f1', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-18' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'762639b1-8ccd-4427-829f-b6370e48d373', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-18' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0b6d8f3b-7150-4e18-ab63-b69207117fa1', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-06' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2c8dfd5a-e961-44de-a501-b6a689989ab3', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-16' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'70217553-e8cc-4e04-98ea-b6b225d22174', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-14' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1b13cb6e-874a-4130-9b81-b6b8b69f22c4', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-25' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'de409db0-4b77-4969-a837-b6c106c88abc', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-22' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5b5c41d9-e7d1-4622-95f7-b6c43f55d3a3', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-17' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e027491f-ba08-4892-b62d-b70c78d3e760', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-10' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cb57b86e-a9f3-421a-aa15-b7359459c47c', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-29' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b29d51fa-64f6-4ebf-bd0e-b74767c28090', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-16' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4dabe895-826e-471d-90fb-b7f9d40bf9ee', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-12' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c7822c86-ebc5-412e-8b44-b80b2d635d79', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-12' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a43df5a7-8a03-4f52-9204-b868fc8ea2b4', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-24' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'80f3c668-e89e-4ed2-b386-b9bee94414b1', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-07' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1a425750-3fee-4e9d-8847-ba27c8e4e5dc', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-05' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e876401d-08ef-468f-b262-ba92a35fd96d', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-13' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bef56be0-84fa-4ce4-bc36-bb224e7e657b', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-10' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd0e5bde2-a717-4edd-b6ef-bb3f91278866', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-13' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1ae0d39e-a3ff-409f-8b99-bb4acf9c0203', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-27' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fbe3fd99-f81b-4d91-ad6c-bb97c0c30c0a', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-23' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'37219cd4-8373-4429-b7f8-bc0d98353aff', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-27' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7daa5fc5-8df0-4cbc-a32c-bc2d89efaf55', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-20' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b947467f-124b-4856-ab04-bce0766a5920', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-27' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'01bd158b-7538-4a85-83e2-bd005e7c778d', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-12' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f9cc6e18-542b-4d13-b958-bd0683667359', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-06' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'016a59e1-45af-46b4-a0ae-bd92d176c198', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-05' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4dae601c-4eec-4cb8-b8e7-bdb7d6e69aba', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-13' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e16527bf-4c3d-4fbd-8e9b-bddba47baeeb', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-17' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0bed1398-f881-4bf6-b0b1-be11260e5433', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-20' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'05e28fa7-806c-43a9-8f71-be28a1b049e6', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-25' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c1c74097-374b-47c7-9a78-bee6a4d620b2', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-23' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'06c05973-9e14-4872-a1e7-bf1b7b86318e', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-27' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'337f9c98-9117-4ee0-96f6-bf481fa30fad', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-04-29' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a84198bc-3e43-480f-a6a8-c018ec1717ea', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-22' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'32e24dd0-cb2c-4687-af95-c01e4bc428f9', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-06' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4c969c2e-2f48-45fd-893c-c03621462e47', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-23' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fa95cce9-8e26-4f25-a9df-c05443c255dc', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-04' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1e7ae7e0-c992-436d-8595-c07120910862', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-10' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd5121921-2189-435e-895c-c08d38c2be6b', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-20' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'64a215a5-da44-4d68-b936-c097b31d0e92', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-05' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'136141c7-711a-4d71-a1a6-c0a93a324e68', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-13' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ba30ac57-458a-4bcc-9e83-c0b64553f924', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-09' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c2b4b180-7e9c-4665-89c5-c0d3c791e693', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-10' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ce65c29d-9aec-41d2-a387-c1368ff14ea7', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-24' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'87de12a6-282d-4956-911b-c14bbf61fec4', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-22' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b2420faf-0adb-4108-95e7-c17078ba8f01', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-18' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fd33a3b8-96c6-4629-8931-c18980902062', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-04' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3d55f9d3-5aef-4aac-a224-c222eeff6bd6', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-09' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ab1230c6-17d1-4481-94f3-c29a6dddc9d8', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-27' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'105d45bc-fd1c-4b0d-b5ae-c29beed23b9e', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-15' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd6c3c9fe-2cbc-4df2-a722-c2bf74b13f5b', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-27' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b9f1ba97-abe4-45de-982c-c2e15c68d646', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-16' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'95d209c9-8d5a-4d7e-badf-c35cae7cbec2', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-26' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6a998afc-9922-4cbf-bcbb-c3a71790178a', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-23' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c3fc73cf-20ef-4663-b0ef-c3c2ed0cb502', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-16' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5a5369d4-6ee9-4036-b0d4-c3cb5dd7d046', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-09' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a909581d-96ba-4dd3-9d95-c42cc9f7e272', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-14' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f8a63bc5-09bc-4527-a365-c4795ae3841f', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-24' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2ff9e4b3-2c96-4566-b8a4-c48c9de55d0e', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-17' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd5e98337-5e1a-4b5c-a5aa-c4c6212863d1', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-18' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c55fcf29-49ad-4b90-8867-c4c7b25e652c', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-04-28' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0e7012c5-61ea-4600-8bdd-c4f41477dca1', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-15' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6814796c-c195-4938-be26-c5165c07b44c', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-23' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6d00002c-fd79-4497-8143-c54fc35754e3', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-23' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e464a42b-3001-41ff-a197-c5672208e690', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-16' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'44bf3903-f51e-4295-b2ad-c594983141d8', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-08' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9c00e02b-0358-4500-b39e-c5a437f3fd21', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-04-30' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f2a4cb9c-3981-46d2-b64b-c5e4536ee438', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-13' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'538935a4-cef1-4a2e-bfc5-c5e57f52c804', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-16' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'853259b0-2ff2-4d05-b9c1-c621f4e16553', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-19' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a26dda15-ab5d-4ff5-a32d-c628f5dd83ad', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-02' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'04f4fbe3-db13-40b0-964b-c62905256a7b', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-14' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'522cc896-951e-4aae-8b98-c65e31d7a3b1', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-09' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4229cfa9-57e5-496d-b1f6-c69fcf695182', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-17' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a8c58af1-f1e5-4a73-b768-c6a82d9a014a', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-02' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5ebd92a7-5202-4fcf-a4ed-c6bde6cd3c34', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-06' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bf6b6956-b470-47e0-ab8d-c6f18eb8238f', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-05' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'820cd975-5cd5-43db-89bd-c6f2abad5b0a', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-28' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f9686b18-ecf9-489f-b9ca-c71efce06ce4', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-01' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b0e1f8a3-2583-4333-a0c5-c732ce623e52', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-18' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9de75b04-e6a6-4385-8637-c76675d7f0de', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-20' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'65c17147-942c-419e-94ca-c7a8785b960c', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-18' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'02378467-f88d-479d-8fdd-c7a9d1dcf988', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-14' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'aeeadc5b-4279-471c-a37f-c7ab3f10a5e1', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-23' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3193cea0-39f5-4308-b048-c7caf2aa2415', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-02' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f8094ce6-f4e2-47a8-96f8-c804ef9375a7', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-20' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'47a836f7-e25c-4d4d-8efa-c875a76a55f3', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-04-30' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8c0125c2-fc84-42ba-850f-c89aed396702', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-26' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e95a41d0-0794-4d2f-8400-c8af90f3c982', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-06' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5b1eee15-edb1-4658-a9ff-c8ba105db1a9', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-12' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bc050466-a3ac-43ca-9f47-c8c7d73b0a4e', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-26' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c8b8837d-ef7d-467f-aba1-c93370cf9f57', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-24' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0e0e5873-ab36-449e-bbc6-c9b0050a4379', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-22' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e71260f2-3d30-4e8a-920e-c9d89e0b111e', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-10' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ec6c5910-fbce-4448-b583-c9fc5935778a', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-04-28' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2262b560-b7ff-4537-82e3-ca009acfb028', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-19' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fa98ccb7-22c0-46ce-866e-ca0a6c52d338', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-25' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e1e0353e-ffea-4bf0-aa74-ca1852880c13', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-04-30' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'17f80a15-95bc-4f75-b83f-ca6f12b8a193', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-14' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'de84758b-7e27-4129-b0b4-ca77482a1841', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-26' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3136b0fc-de41-4137-9e29-cae9961f4849', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-15' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4fe4324b-c66b-4b6a-8339-cb25050c9b97', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-17' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9118e1b2-e10f-437b-965f-cb288b3371c0', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-12' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'72b1ebf7-fd67-4e56-8ef6-cb46917c4b3e', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-17' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7e3dc59a-9ed0-471b-843e-cbd01cb2601a', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-12' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ab8820b0-5164-4b24-a63e-cbf57966789e', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-01' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1edc41fc-546c-4b48-9f35-cbf5f73b5e3d', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-06' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'263745d6-4dff-4bd7-b142-cbf857da2387', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-11' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0647e8a8-6edd-4e4b-af9e-cc2a7ec15df3', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-24' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8694fb4c-0463-40b2-9c04-cc694157c8ab', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-29' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'082f1291-d886-4c18-adb6-ccd713e0c8fc', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-28' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd41591c0-e0ab-4995-aec6-cd2e7b0ed194', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-22' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0b9cec72-82ff-4707-80c9-cd3dd10f0a6c', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-14' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd0b67baf-ff0d-47c1-a87b-cd3f1519f3b6', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-29' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'951b35a3-7803-4a42-bb38-cd63ab45fd44', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-10' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7ca667cd-c643-48e5-839c-cd846d7edf7b', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-12' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e06a10dd-ba52-4d3a-a987-cdb4b92ca3f7', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-16' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'21189143-fd1e-4f34-bcf9-ce152db9195b', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-28' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7faf22aa-2e47-40b1-b13e-ce36690abe2f', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-16' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e1392670-e991-4d20-b1b0-ce6d4b21da1d', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-12' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f37335b1-8e55-490a-9f6a-ced4469e6e8f', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-10' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f8a364b5-27ec-4379-9403-cef346e37752', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-09' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'da9fdafa-b52a-4975-aab7-cfc86c14a691', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-17' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ce8ae2c4-1e41-4878-8ba5-cfcdae2d1b05', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-18' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'29740880-3ba0-4c2b-8871-cfcf3d12b050', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-24' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1d736061-18cb-4f46-a092-cff2339071a5', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-26' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cf8c9371-3a13-46eb-b37c-d011680663d5', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-17' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'56513dfe-ae9b-424d-867f-d04ac9868e99', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-18' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bb7c58e9-df1f-4474-9a69-d05c27ff2381', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-04' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5fcecd6b-396d-4ccf-915c-d11e07aacb11', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-04-29' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'487225a4-3a7d-4547-acc6-d17d3cdcc06a', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-15' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bb9849fa-e2c3-4e5b-a15d-d18699ad6e32', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-06' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0b23e5ab-0df9-4c2a-b79f-d1ab114aee91', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-29' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'70844582-fd35-4a33-8192-d2eb504c6472', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-27' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'814b5623-1dff-4c66-95fe-d32d561a071e', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-30' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'09bb4774-cb92-47fb-9ee6-d3321c9cbddc', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-17' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'51d93748-b951-4389-ba5c-d3527e1db42b', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-03' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'30bdf407-dc83-4fc5-8c0b-d392fe79c31e', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-20' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'01eebfdf-7d55-4cfd-a7a7-d3b3150bbd75', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-11' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'35aa20ca-7907-47bc-98c0-d3da77bfe0ca', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-24' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b5f75fdd-4e7b-4a07-8b6a-d3f1442a0551', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-11' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'26c5beee-67fa-444d-a3d5-d3ff522bc752', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-08' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'49a6b047-3b21-453f-b5e5-d42359ec6220', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-24' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fcaa6bb9-7aec-4dd3-88de-d43261088462', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-05' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a9e2a4bd-257c-4f6b-ac6e-d4ac85210b73', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-11' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1840d28c-656a-4bb9-8c27-d4f0372f6dff', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-22' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'da3cb54e-2f9b-4a8d-9c2e-d5049b5547a8', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-08' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b9f62f5a-77ad-4dce-9f40-d506ddc45a05', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-07' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e89dddec-46c1-4f63-a173-d5205c9552b9', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-12' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f24e64a4-2ee5-40ea-a293-d531a2fc3a7d', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-05' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ca81300f-fc9b-4b89-bd96-d5514b20b5a9', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-20' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'135923ca-dac6-4d76-98a6-d56d090ef1fc', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-25' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'597ce987-e73c-4fcd-a2c6-d592f36679d1', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-20' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2b69e5c0-32f7-433e-bf80-d5a4054ce131', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-23' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'38ef54bc-275f-4d8e-9831-d5d30bf53e89', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-06' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b057f143-5e89-4a20-baf0-d6067eeb6658', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-22' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4a7d23cd-fcef-4044-b7ae-d6343474d4b7', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-10' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cf004f2a-74e1-40cb-b59f-d64b717a5a88', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-29' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ca967b4b-6148-417b-98c7-d6692a838079', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-07' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'03a4dc74-c950-4ea9-8163-d686713789d2', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-21' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f629af55-e898-4884-b31f-d6dc726aae21', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-21' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a7f1035c-87b7-4d01-83c4-d761172cdd37', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-13' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'af048cb8-a914-43c7-8226-d7662def1014', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-16' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'57eff2c0-df37-4158-9496-d77721dc2b14', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-22' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'aa1ad3a6-39c6-4da2-a444-d7b4e475a2da', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-08' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7b708176-043d-4cb4-abf0-d7c760570add', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-05' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0dac698c-765c-47e5-afd5-d7f3e8dd8c5a', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-25' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f71f7b60-5572-486a-8787-d819a62026c8', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-15' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'84d98f86-c155-457e-ae13-d8623c811277', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-15' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9e943fec-aa4b-47ca-8b4b-d8643594bccc', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-12' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'02d55c13-1106-44ff-879a-d8883f5fd42d', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-19' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4d008dbb-7d48-4213-b402-d88bc5cc4ae8', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-11' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0654ce5d-acc0-4263-b37e-d8abf50bd724', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-21' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'346dec94-6551-4804-8690-d8bc85930ed8', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-21' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'61ecb686-a272-4584-8525-d8e02cfb2d24', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-18' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'469f18d1-e859-424b-8ec3-d926aaf06792', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-20' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b37d04bd-e915-4ecc-890b-da023386604b', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-13' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'36b2e8a6-257b-4dce-ad45-da0b341afd1c', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-22' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9385a2cb-c5a6-45b5-bbbd-da259c3d7677', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-21' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7a2af2a5-480c-4a45-96f2-da3c62609847', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-05' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'59f9b943-96d3-4554-aaea-db64d580ba51', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-07' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3a3bd1e7-b4e5-4ccc-ade5-db76afd58fa1', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-05-26' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3cc869cc-e907-486a-bf5a-db977e52a30e', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-24' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'44c39896-6063-4747-b80a-dbe22c79f32a', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-07' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7e93905b-49bd-4d29-99e3-dc8f5d9759ef', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-11' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b6c8c094-b813-40c2-9ca7-dcc65068b1c5', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-15' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f8505f6f-0e9d-4f38-9836-dd2e8767156f', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-08' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'56a5d2d7-8da2-4a15-b68d-dd789a48f6bc', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-22' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cdeaf981-f1a7-493c-aaa7-dd797782a317', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-19' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7a91233d-549c-4381-b6c0-dd89cb5c47ac', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-28' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'65c0f070-bb7f-464e-9c78-ddd17020a86e', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-12' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e217d9ea-018f-4e8a-a4a0-dddeb9f06ade', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-29' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6a34c510-3324-486c-be8a-de0a22be5b19', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-18' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'18ca8cfc-fd2f-4e3f-93e5-de237aef0d5f', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-13' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f97e8d7e-ae4b-4d11-89cf-de40e64df594', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-06' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'edda37e0-28c1-422c-a548-de5b47b3f836', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', CAST(N'2025-05-01' AS Date), 1, CAST(275.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7531b55c-c247-4b18-94ed-deab67ea4521', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-28' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'be510287-98f4-49be-9fac-debae6e423a7', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-11' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cb5ece2a-530b-42d6-92ca-def8d1bcf190', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-07' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c7adb96c-fad0-4c75-a40c-df740e0194d9', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-21' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5231da73-ca44-404a-990e-df96c8e70336', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-04-30' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'14d4dec9-14e2-4161-856b-dfb8a3805241', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-16' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a54b1ddb-92fc-4273-9296-dfea0ca643f7', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-09' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'be182f48-c734-4c28-800c-e0156fc76815', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-01' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a4514b8b-e9b9-4ba0-b495-e01c28dd9e70', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-04-29' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4e2baa4f-570e-4143-855b-e145c9b90e1a', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-04-28' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'00fd1731-6f0a-4652-a6ca-e155de7af709', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-20' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b706003b-a2d2-4216-b3ab-e1ee02bd0c65', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-28' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'dc9ff5ff-d4a4-4aab-a473-e25fb7d2e767', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-16' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9193ab59-91ad-46cd-9eca-e27fbec2c390', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-08' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'34f2b1e4-6603-4612-a700-e2ff9656ed1a', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-13' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'05a5ff30-43a4-45c1-83cf-e359f7519dfa', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-12' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9d83eb50-d220-436a-b334-e37f6f7861ad', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-12' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0e6fc6f4-0881-4ad3-b506-e3c62a684b76', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-24' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e4eab184-51ba-421c-a574-e3d517cb94ee', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-22' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'11261ba6-0d84-4bf0-b3c2-e3fbd3f7466e', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-30' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd0025894-6ca2-4b4e-b51d-e40697804ba7', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-12' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'87b662e2-af7e-4129-a613-e4c456a7ab1c', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-27' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1b680073-b77b-46c5-8e0c-e4c78ba2c357', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-21' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e4609079-10dc-4b22-91e9-e4f47f4667f6', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-23' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f7e69823-a5ff-4206-a4a9-e4f52b1dfc07', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-08' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0fe7619a-7d22-49dc-a956-e50ce7d40077', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-17' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b2e8ba6b-3b17-47cb-8a1c-e54967695580', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-28' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9d23bf70-8146-4cd8-bdd2-e55ff6d45241', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-04' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'24bd9048-a38a-4c84-bafb-e57327833f9e', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-11' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0ccafb99-0dfc-4dde-8546-e588f650f7f1', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-15' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0eaecae8-911b-406f-9ec4-e5a6cb136e67', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-03' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'79cb3b13-ba09-4e2b-8d6b-e5ad333285e8', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-17' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4ae86073-0461-4a58-841e-e5cc36a54a7f', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-09' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'12452995-c4d1-4b38-9845-e5d776d04414', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-05-04' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3f46471a-6d3d-4d87-a7e3-e5efa5d452af', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-04-28' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1dfd08a3-5da6-4610-adac-e64bdbb31db7', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-25' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a057ea62-3ee9-485f-896a-e65016a373f8', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-20' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'10c430fb-5c06-4da2-91e6-e6abc828a98c', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-21' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'aeec4bf5-e336-4b40-bc9b-e6ed11afb467', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', CAST(N'2025-05-25' AS Date), 1, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5e3ab8ea-243a-43db-90dd-e73c05296fa6', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-24' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'47813dae-6435-4947-ab7c-e7599d8fc182', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-13' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'be50b9cc-03d0-4164-8799-e798a3e42add', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-08' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e3584735-4afb-4b97-bca0-e84f1b8d1b88', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-23' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b6580a89-0600-4cf5-a2a2-e86dc4fa5276', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-06' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'596f5920-54c7-49c5-a8b9-e8740b1ad19e', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-05-20' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'017cdb88-fb46-444e-9603-e91e4628038a', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-09' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd787a64b-64a6-47b4-a1c2-e94521c98946', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-08' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5d76a497-ef0b-44fc-adf2-e95b54254de3', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-06' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'380ff3ff-869a-4783-9131-e9cc514c5abe', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-11' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0d9a21ad-0da4-41d1-a826-e9cfccd64433', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-08' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8b9f9408-0ebf-4fee-b627-ea3720fe7108', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-04-28' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'610bdc52-ffcb-4567-8da5-ea48c257b823', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-14' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e05c04dc-1fd2-47d0-ba2c-ea51ec097053', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-28' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c68daab8-4efa-4107-a9c9-ea7435d8b99b', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-24' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'88864af6-8113-4bfa-ba9b-ea89d37560ae', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-17' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bb068bc6-94d2-4815-bdf8-eaa7bcf6b446', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-08' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ac86021a-6365-4709-b2f8-ead46e5a23f6', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', CAST(N'2025-05-26' AS Date), 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'91879012-4f12-422b-8173-eb6e6e4b7442', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-06' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0540d6e0-2f1d-4bfd-bbbc-eb8667e31058', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-11' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'06faad97-636d-49cb-90eb-eb8a1d1b56f3', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-04' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2b7371b7-ea55-4c82-8546-eb9b29aa4b4c', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-15' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'541b242f-9b9d-4033-b816-eba9e4fe5476', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-22' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e3e2683a-cb3d-4196-966a-ebb4ba2ed0f3', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', CAST(N'2025-05-09' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fc9e4d90-9a82-42c4-9c44-ebb63996ab82', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-19' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd81c358c-1a07-41b9-942d-ec0ca61a2849', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-09' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0ace0d6f-df92-4fcf-84ca-ec1872236b2b', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-14' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'91d66f39-f580-43d4-bbb5-ec304fe3fcc6', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-19' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cb53cf08-d98b-4030-b27c-ec59f878953c', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-08' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'110ab5f6-4b63-4cee-91b9-ec68a92f1960', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-16' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a78c9a20-a7d6-49a9-be7c-ec746ef1e296', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-07' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd0ecda6a-b373-4da6-8ae9-ecfad862ddc8', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-03' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5d7f09a6-2230-4977-aa05-ed17c1c176c5', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-30' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'562bf6fe-e468-4e6d-9b9d-ed3bf1289ebf', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-10' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1680d85a-1c5b-4560-b2b3-ed5ea9f63274', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-13' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b9fc8823-4221-4bfe-9808-ed8a84d1338e', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-01' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1eb5ec21-13b3-43f8-8255-eda49742f07c', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-05' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'52b86f4f-fa31-476d-a296-edc61b1809d2', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-08' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4a73544d-5f02-492b-a23d-edcba2777f98', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-21' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'57b8505a-4001-493e-8e59-edf224c3c486', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-04-30' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd2ce565b-14e0-49b2-b9a1-ee1137c8d890', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-07' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1e5e39e0-44df-4379-9beb-eeed7cb00c8d', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-14' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'63b6f394-7442-4625-aa32-ef4deddb77dd', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-06' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'da695605-02d8-4d30-893a-ef748d0d4bde', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-18' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e2d58d37-66cf-4e62-862c-ef8daf597f9a', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-10' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'78a6088d-ebe3-4466-ab41-efa327be77d6', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-01' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'53b3beac-e9e4-4cd5-b324-efb78913e6ee', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-28' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6e037e5b-4404-4803-af2f-efc9ecc1beee', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-03' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'cc07c39f-9fab-4f20-bca9-eff0ec8a1182', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-20' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c6707c49-cd39-4d5c-81a4-f060cdd04ad8', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-14' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'649ec75b-00b1-4406-b754-f07a95d19795', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-03' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'250fedf0-4fcb-4ccb-9c66-f0dc98442b59', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-21' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'533e2329-478d-47ee-9016-f0f26e81cd19', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-23' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a8db4abd-2481-4321-b70d-f1308f44eae3', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-04-28' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f982cd0e-0e9e-43c3-9626-f15ce9513062', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-04-29' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b012618f-8a68-4fd6-94f7-f1e7ed41b2d9', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-03' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ee1cd556-c504-4b7f-87e0-f22e753bbb3d', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-18' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e93baa84-2fec-45f3-bc16-f2419bc0a5dd', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-16' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'45c5a6a7-9eca-49e8-90be-f2621ba09d08', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-26' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8351690e-8fbd-47cb-8b42-f2a4028a9211', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-23' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'486cf6d4-b04c-4ee3-ba56-f2a45ffae106', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-14' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4773e255-5431-4a32-8522-f2b5fb4753d4', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-02' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'48d9bc3d-2d93-4bd2-b70c-f2c64a995f04', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-26' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2d6c95f0-60bf-4263-b9f5-f314f092426f', N'16fc94a4-e533-4059-b3cb-69462157698e', CAST(N'2025-05-28' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd45b5b6f-efec-414f-9b0e-f3383105438c', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-06' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2ab286d5-f488-4da1-aad8-f342ddaca907', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-29' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'53bdc481-f92d-4dda-8829-f35de4febc06', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-27' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c4703cbb-07d0-4968-9640-f36de1156c8d', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-06-03' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a24ba3c4-7ece-440d-aec9-f371947d915a', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-17' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'32108619-3f58-4868-8b25-f3832d81cc40', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-28' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ab5b22e5-c558-4c79-8d8c-f3ece8f6b1ec', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-04' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'568de219-dc38-443b-9fde-f42531845c56', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', CAST(N'2025-05-25' AS Date), 1, CAST(580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'89566b35-7215-42c2-b16b-f4379a85669b', N'0d802abe-e4b1-443a-8900-b914a268de03', CAST(N'2025-05-13' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b1b47fce-8c68-4a5d-b1c3-f43985700365', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-30' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'60abbdd1-8547-401d-bd9b-f45d35df9cad', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-28' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bb2b3260-7856-40ac-87e0-f46b721c569a', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-06-07' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0ae7d76d-15ee-474a-8621-f502a3dec714', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-22' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e4537e16-53b3-4fc5-b930-f51da0f06260', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-27' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8f0abb5a-5662-42d1-bc42-f55e23b7c167', N'2a991029-4265-4713-bbc5-aff01ed72820', CAST(N'2025-05-01' AS Date), 1, CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'8abb15dd-5993-4daf-a046-f5638214c09b', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-30' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7e91e845-517e-4031-866e-f56d93bb6aa0', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-13' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2e7ce8a6-a5ce-43ce-b3f1-f583d5dc12d5', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-24' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1949ec79-02e4-4a4a-a7fd-f59d25f7e5c3', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-20' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f2453f72-dada-42bc-b132-f5de7ca6a275', N'38af6568-fa63-4f89-afaa-fd5c5008433b', CAST(N'2025-04-28' AS Date), 1, CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'23ad365e-36fc-4591-b011-f5ea928f4164', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-07' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'adeb73d8-8597-4f14-9229-f644d47caac3', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-23' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c0c7d28c-b520-4960-ac58-f6495db39625', N'aed5fdf5-4728-4122-977d-d6cea65927b4', CAST(N'2025-05-01' AS Date), 1, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1fc09c82-8788-4974-8dad-f65775e41ecb', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-02' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4889ffca-8e96-4508-bcc7-f6a03588796d', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-27' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f410821b-209b-436c-ae8b-f6a32a035d03', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-01' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'1c6946b7-78cc-4fbb-aab4-f6a7406070ab', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', CAST(N'2025-05-14' AS Date), 1, CAST(1100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'298591f9-4a05-41e7-90f7-f700b03590f9', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-25' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9f469dff-652c-4111-84f4-f716a93fb19f', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-19' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'25d18769-6037-4779-9053-f78105569417', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-16' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'c68eed81-b2b6-4473-b1c2-f7885955a3bc', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-19' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'532df79f-7be9-4a99-b074-f80c80831497', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-17' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fe4edcd4-ba5d-4bfa-aa79-f81ec721ecba', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-31' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4f3ab1d1-98d2-4480-a0a0-f8295cedf8bf', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-20' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fc0b5955-df4a-43e0-9084-f887d65f7c6c', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', CAST(N'2025-05-25' AS Date), 1, CAST(720.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'b5291de2-96d4-40a3-a02c-f88c6283b54f', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-29' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e4f5bf5b-e74c-4e88-a138-f8931e85bed2', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-05-22' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f440c756-64a5-4fc5-a7c8-f8c770cfd36e', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', CAST(N'2025-04-28' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'bc41d845-c342-46bb-acdf-f8fa24f08835', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-16' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'36dfb642-06de-49e7-9c80-f943ed7cc70b', N'b4edd050-3574-4a10-b584-becd6238498e', CAST(N'2025-05-19' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'446c2c97-5f62-453c-b5b4-f956672607d8', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-18' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5636bd41-7ca2-4308-8187-f98cd2e45989', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-31' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'23ff68a3-75e4-486f-b6cc-f9b0720a01b0', N'3826a636-f756-4251-9149-528ed1962cbf', CAST(N'2025-05-03' AS Date), 1, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a86e8f9c-2cca-406c-a255-f9cd7710a475', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-19' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'62b3040c-47e6-46fe-b1a3-f9e7cfb4ee8c', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-11' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'289f4db3-54a4-4f38-b8a2-fa0421889a6b', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-23' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'e6dbffa1-7828-4da8-80e2-fa1bba884593', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-01' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ecc9fd7e-3b96-4a68-9f54-fa37015a4880', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-18' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'0db5139f-8414-4430-8c94-fa3a7b69a987', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-04-30' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'248838b0-786a-4b39-8529-fa3d5abaed18', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-05' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a58ceb1a-1180-4d99-b77e-fa3db0f58ab0', N'48cd094f-abda-445c-9f14-2ab47316a4a6', CAST(N'2025-05-03' AS Date), 1, CAST(620.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2463c28b-7aad-4686-bce8-fa725eb573dc', N'75de6533-f54c-4f52-823e-5295bf3ff29b', CAST(N'2025-05-02' AS Date), 1, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'5d1e1831-7f0c-4d19-a84f-fa9fd4bf2786', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-18' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7800eb4d-9d16-41a7-aeee-faa760d1d86d', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-29' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ab5596af-cd53-4701-8b87-fafd4a29f9af', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-18' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'2734c2b5-8f4e-4bfc-982d-fb06c5b0258c', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-12' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'08ed81f1-6fb5-412c-81f0-fb33096240cd', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-06-20' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3c0801de-b441-4ea9-8b45-fb504b60f95e', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-04-28' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'6fda423b-b490-478a-84be-fb610a8bb5a6', N'd19a26b7-2706-446b-aa77-56b3f47407e6', CAST(N'2025-05-05' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'695dc4b7-ed92-417f-a34e-fb6111b8b5f2', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-22' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'7bc5c20b-7de6-4979-9703-fbc5387bc355', N'7b34c56d-e425-5f40-ad89-31eed87869c1', CAST(N'2025-05-03' AS Date), 1, CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'29953e48-e18f-4c4a-98e5-fbd65f4df959', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-20' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'4b868219-157c-44b0-9e77-fbdb05ac6841', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-06' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9fffa930-ac79-4d74-819a-fc289cd16b83', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', CAST(N'2025-07-08' AS Date), 1, CAST(220.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'3cac5d61-05b5-439c-b14f-fc965185f305', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', CAST(N'2025-05-22' AS Date), 1, CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'f0bf76fd-92ea-4d5d-805d-fcd80fd54ad5', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', CAST(N'2025-05-28' AS Date), 1, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'388167f3-8c8d-4ab1-851e-fcecba050e34', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-30' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'9485c377-8ad4-40e0-83af-fcfd90704eb0', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', CAST(N'2025-05-27' AS Date), 1, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'226d5c73-2933-4775-aaa3-fcffdb10699d', N'21e8997f-c651-4427-94a5-4f441d1c1678', CAST(N'2025-05-04' AS Date), 1, CAST(280.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'd4f4b2cc-92a8-4adf-a9b9-fd052861b917', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-07-11' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'63efee6d-49fa-4567-a3ac-fd8709167731', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', CAST(N'2025-05-04' AS Date), 1, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'13ffcb57-a778-4a6c-99c8-fdae0abb66c5', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', CAST(N'2025-05-11' AS Date), 1, CAST(390.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fa956f45-1a3e-4cdc-a021-fdbfec11399a', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', CAST(N'2025-05-24' AS Date), 1, CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'fd309bfb-b983-4f29-a52f-fdd8be5f26d8', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-08-21' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'ef1cb83a-aa27-4b77-9f90-fe26c913ca4c', N'e93f2721-e761-4063-9f83-715fdb1b70db', CAST(N'2025-05-19' AS Date), 1, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a7460446-0796-4f2d-8595-fe287637baf1', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-06-16' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'409f6b5c-5478-426e-9867-feab6dc3fc1c', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', CAST(N'2025-05-19' AS Date), 1, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a3992d01-7232-4f71-b937-fef4ea978be8', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', CAST(N'2025-05-06' AS Date), 1, CAST(680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'20d47951-5843-4cd9-9d47-ff2f9acb321b', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', CAST(N'2025-05-15' AS Date), 1, CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'49af19c8-1574-45da-adde-ff897fa18483', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', CAST(N'2025-07-11' AS Date), 1, CAST(490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'09a7cc2e-50b6-48e7-ba2a-ffcde6875375', N'9c13901f-c314-4c39-8c78-10eec76758b9', CAST(N'2025-05-16' AS Date), 1, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[AvailabilityCalendar] ([Id], [listingId], [date], [isAvailable], [specialPrice]) VALUES (N'a8ab3bd4-1a3e-4643-8775-fff784d59348', N'86134d93-2c95-451c-88e1-9bd850086f4a', CAST(N'2025-05-14' AS Date), 1, CAST(310.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'01e44792-e445-4b41-8ba4-00313c9b876d', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', N'uploads/54450e6a-024a-4e53-b508-be2a4ababed6.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:35:57.130' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f5beea85-c34f-4a2e-9598-011b91e02e16', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', N'uploads/31067727-a6d0-40ca-ad41-ff9204894a97.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:32:09.993' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f23147fb-8714-4e9e-b67d-0177a16c16d3', N'9c13901f-c314-4c39-8c78-10eec76758b9', N'uploads/ed493d5c-6a70-4271-97a1-d9fe68fefd92.png', N'Image Caption', 2, 0, CAST(N'2025-04-29T12:38:31.793' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'd5feb55f-03fe-4cc7-b68e-02d95aadfb71', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', N'uploads/1932f589-6984-493f-a7a3-e29f8ac88591.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:51:58.577' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'2c608aac-b3f3-4ec2-8f09-032ba30e11a6', N'75de6533-f54c-4f52-823e-5295bf3ff29b', N'uploads/45f94850-0e00-4016-b740-761cf0e38ef6.jpg', N'Image Caption', 4, 0, CAST(N'2025-04-29T12:52:24.567' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f1767dca-f979-4190-87f2-04c7a969956e', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', N'uploads/d79a1427-2613-42e6-a0e2-6edb3ed493a8.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T04:10:03.700' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'66e51f64-d4ad-476b-8689-055f5770d0ea', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', N'uploads/c2a496ea-5a6d-4adc-8a70-e13c1806ad29.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:33:42.620' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e11ffb97-b220-46fb-86f2-05eff6ec1c41', N'b4edd050-3574-4a10-b584-becd6238498e', N'uploads/36c8fcb5-b59b-4c2a-9780-f30c2ab3dda0.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T04:11:02.553' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'fdc39cc8-87eb-4ada-918b-069647aa6162', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', N'uploads/60d46486-d3d2-4a60-b702-a5db806816ee.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:45:53.853' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'a6f0b5de-927e-46af-bb5b-076eefabc553', N'2a991029-4265-4713-bbc5-aff01ed72820', N'uploads/f758f89e-d68c-4b1f-9b49-8c629d87cbec.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T04:10:36.407' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9ddfbcc7-783e-4847-b57b-0923c6aa0b1c', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', N'uploads/c4135a16-ead4-4c95-9e06-386d82e537f8.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:44:16.737' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'ef8124ed-d515-4ad2-bf5c-0c16f25a17bd', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', N'uploads/2f856038-08ca-4005-9e4e-7016b905b5d1.jpeg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:18:29.920' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'475629d3-ec81-4a70-a327-0d9ca4af8e7a', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', N'uploads/daca7595-1e06-41bf-917a-30a90ebe8921.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:30:27.013' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'd7f0c743-4d36-4103-b9fe-0ec7142d1406', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', N'uploads/6a34f84f-55dc-484b-83a6-dd373b92207c.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:35:57.140' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4b1aaad3-50b3-410d-928f-1067d409f09b', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', N'uploads/e94d6804-7418-49bd-9228-ff4edcccb210.jpg', N'Image Caption', 7, 0, CAST(N'2025-05-03T04:11:42.007' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f10327cb-a593-4176-8a78-10b4d48f1fdc', N'16fc94a4-e533-4059-b3cb-69462157698e', N'uploads/eba5670e-4a13-47b1-bb1f-27e8d25b7526.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T04:08:21.270' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'89f62d8b-423a-4afa-a449-1294ad596be1', N'38af6568-fa63-4f89-afaa-fd5c5008433b', N'uploads/a540cde4-8cd3-4090-963a-e8161fdf2f1a.png', N'Image Caption', 4, 0, CAST(N'2025-05-03T04:12:55.757' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'15786afa-643e-41be-aec8-12c59515e52f', N'9c13901f-c314-4c39-8c78-10eec76758b9', N'https://images.unsplash.com/photo-1493809842364-78817add7ffb?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3', N'Modern kitchen', 2, 0, CAST(N'2025-04-13T17:15:03.187' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'ba542ac0-d2cb-4a65-8381-14f94fbfbd3a', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', N'uploads/9aea850a-5a34-4817-947e-dc665e3767bb.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:44:16.733' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'82a2235d-3141-4bc2-8c55-16197965a536', N'2a991029-4265-4713-bbc5-aff01ed72820', N'uploads/3cbaa824-af09-4f2d-b05d-bdaf3d9c94d8.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T04:10:36.410' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'ed0b4bb6-a223-4917-94c7-16d573871a29', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', N'uploads/60918647-2ad1-4712-8e05-e4da13fbb3a5.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:45:53.853' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'efdf177a-b084-43cb-956b-18f75ef2e2b5', N'21e8997f-c651-4427-94a5-4f441d1c1678', N'uploads/eb817ed8-5842-4714-aabb-a928aa7c6e30.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:50:49.083' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'27dfa30c-b12a-4aa9-ac9d-1add2068765d', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', N'uploads/abdf81f3-f2bf-41e9-b185-c5749966bb15.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:24:30.140' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c185461a-3cf1-4efa-a0d4-1c7f82890a70', N'9c13901f-c314-4c39-8c78-10eec76758b9', N'uploads/ba6c508b-3177-4677-a491-ae9196aa6107.png', N'Image Caption', 4, 0, CAST(N'2025-04-29T12:38:31.803' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9f38f407-a3b3-429d-985e-1dba81b9ade6', N'3826a636-f756-4251-9149-528ed1962cbf', N'uploads/52310e7c-4b2e-4eed-8e51-9ff10257cc9f.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:55:44.160' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'5ed1ef24-89c0-4d36-b69a-21b041311918', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', N'uploads/02953501-876a-4a94-8845-40fb305435a5.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:30:27.017' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'adccde00-9fea-46cd-82f4-21e43a296329', N'9c13901f-c314-4c39-8c78-10eec76758b9', N'https://images.unsplash.com/photo-1501183638710-841dd1904471?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3', N'Rooftop terrace at night', 3, 0, CAST(N'2025-04-13T17:15:03.193' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'031154fb-991b-45db-8cce-2200ed4241f3', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', N'uploads/c71df666-d9e8-43cd-a71a-3dfee7759a3f.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:57:33.137' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e32d30b5-b1c4-49ed-9463-232198eb9d79', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', N'uploads/1e5faab6-6764-4017-b27f-84f34354a462.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:24:30.130' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4dbc587b-749a-4314-bb85-232d2f9f3643', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', N'uploads/a86c90e4-6c0a-4b92-8f9e-a0339f920504.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:57:33.130' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'5c9e55e7-0ebb-4576-be39-2564227e91f8', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', N'uploads/e54efc67-414f-4fff-8601-03e649f53b5e.png', N'Image Caption', 4, 0, CAST(N'2025-04-29T12:53:41.663' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'04138382-1f9e-4708-a42a-25ab98c489d9', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', N'uploads/f332fe96-9c75-40e1-b15e-4f210698dee1.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:08:03.113' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'b29da80e-f13e-4755-82c5-25d2f5b6f7bc', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', N'uploads/801bada8-cd18-409a-98b4-7ce4d0065008.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:30:27.017' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'cf6e5542-dd08-4d14-b360-264ab18414f8', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', N'uploads/5226f595-910d-4636-9160-60b336dcea43.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:51:58.577' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'0896a250-fe54-460d-9e36-28b963680ed6', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', N'uploads/1746bcb1-f79c-430d-8dd3-a562015dbe88.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:18:29.917' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'96e043bc-e4d8-49fb-b933-2a0b72d41267', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', N'uploads/6a68fae7-4844-4a94-a224-79d4d79dd8f2.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T04:11:42.003' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'01b3b64a-b9ec-4feb-87a5-2a3c3220ea41', N'38af6568-fa63-4f89-afaa-fd5c5008433b', N'uploads/95839dc8-063f-4f86-bf00-e42674922544.png', N'Image Caption', 3, 0, CAST(N'2025-05-03T04:12:55.753' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'8f83058e-5306-4312-8485-2a4c89be5205', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', N'uploads/64973285-3d7f-4608-8c3c-b72849376e42.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:58:06.147' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'13d981c1-a296-4aed-bb88-2b685f38df1b', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', N'uploads/c1d818ba-de3c-4ea2-b2aa-14af49e56415.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:18:29.923' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9100877a-2e14-48b5-bcbb-2be18874dcd5', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', N'uploads/9090836d-2e38-451a-b659-f7333e432a97.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:30:27.020' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'5b24c59d-1504-4e0e-88c7-2c305c3f45e7', N'2a991029-4265-4713-bbc5-aff01ed72820', N'uploads/4b360d6a-5a17-49db-b79a-9718529c4bae.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T04:10:36.407' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'a8d8c7d0-6fda-4e7c-aa94-2f2d06ca7e83', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', N'uploads/64638f5d-66de-4898-b74a-06554eec7a67.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:33:42.613' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'24473ccc-9a18-41f7-82bf-2f46cf6f404e', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', N'uploads/8c667554-e126-471b-902b-617dd9fd1d40.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T04:09:05.060' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'2038eb31-9be8-4efd-81e7-30f5b70ecb8a', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', N'uploads/186c8199-f120-423d-b5d7-0c85949060d4.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:35:57.127' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'51cc4e1d-4f44-410c-9745-31544ff426a4', N'b4edd050-3574-4a10-b584-becd6238498e', N'uploads/963e5cef-ec8e-4845-9bf8-47d704949d3c.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T04:11:02.553' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'77c2532a-da8b-4fb9-93b7-32d5fa5418ee', N'75de6533-f54c-4f52-823e-5295bf3ff29b', N'https://images.unsplash.com/photo-1510070009289-b5bc34383727?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3', N'Duomo view from window', 3, 0, CAST(N'2025-04-13T17:15:03.217' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f8a8eac7-8e96-47a8-b80e-33e14a9c5ab8', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', N'uploads/5913b444-7fe8-4680-8166-4576b879a084.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T04:11:42.003' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'5fc41107-4e43-4c1e-97d3-3486b5da1e82', N'75de6533-f54c-4f52-823e-5295bf3ff29b', N'uploads/588c50c5-07b8-4911-96c8-b9cbe18fda38.jpg', N'Image Caption', 2, 0, CAST(N'2025-04-29T12:52:24.567' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'fd86dbcc-be19-461f-bc8f-35166b7976a1', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', N'uploads/ca1d3b8e-3691-43bb-b55b-fb26c4bf8f7d.png', N'Image Caption', 5, 0, CAST(N'2025-04-29T12:53:41.673' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e1438224-2d05-4528-806e-36e93e33be6a', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', N'uploads/beab160c-a965-4706-801f-ee6b61239248.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:30:27.013' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'7edb8be4-dd32-4de8-a4e6-37fdaded50eb', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', N'uploads/46aa756a-8490-40c6-844b-7968117f5a08.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:58:06.140' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c29f91fe-1bcc-4a62-b997-383cfe83f40d', N'0d802abe-e4b1-443a-8900-b914a268de03', N'uploads/9a472045-7bf3-4dbb-81bf-f5571a797138.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:44:58.693' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'54bc7ac8-4e27-4fb0-9774-3b9110ece9eb', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', N'uploads/bac0a832-654e-43e5-bebe-1432c99b57bd.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:16:34.283' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'3337607e-ef58-4edb-80ed-3cc390dd0ff0', N'aed5fdf5-4728-4122-977d-d6cea65927b4', N'uploads/87581253-286d-4676-8b95-92cd169c47d5.png', N'Image Caption', 3, 0, CAST(N'2025-05-03T04:12:29.613' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'2024b83b-d46e-413c-a47a-3e4c68692f68', N'48cd094f-abda-445c-9f14-2ab47316a4a6', N'uploads/228e56f3-dfa2-44c1-af26-e19cccda4a6d.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:12:35.147' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'37167105-0fc0-412b-830d-3f0c2617376c', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', N'uploads/05cecac2-b149-4e67-8843-2ed45a94eb5c.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:43:45.830' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e6b5fe6c-15ff-41a3-ba00-415b42869b07', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', N'uploads/fd3e4644-ac75-4d71-b8a3-0920fc6b271c.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:08:03.117' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'631d01c6-2ed6-47bf-b741-41a05928014f', N'3826a636-f756-4251-9149-528ed1962cbf', N'uploads/9b111779-edb3-4a3b-8d9f-ec2665b33b17.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:55:44.167' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'6664966a-ec3e-41f7-88af-43df4c261719', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', N'uploads/00c1bd0c-429d-4f69-a7ae-23542a33eb2f.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:32:09.997' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'00970715-cd8c-452f-b82f-447834d06c46', N'21e8997f-c651-4427-94a5-4f441d1c1678', N'uploads/a373ec3a-7454-4c5c-a69a-ee4530f2c572.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:50:49.077' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'ab019df4-3412-4409-a165-44a8cbb8070d', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', N'uploads/51ac1386-7f2a-4a94-86f8-7d53952477fd.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:43:45.843' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'284f75e4-10d7-4a6a-9bc3-453ff9b319c6', N'b4edd050-3574-4a10-b584-becd6238498e', N'uploads/8f367f89-7fd3-4d15-8c21-d8b1bd7cf42a.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T04:11:02.557' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'3fc5a1fe-007f-403d-88b9-461a89c23051', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', N'uploads/87bc211c-f74b-4795-b7c1-e62481168c1f.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T04:10:03.703' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'271b2a31-8de2-43cd-93d6-461afc25100a', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', N'uploads/6813659b-79a1-4b11-978f-ac430d2a9411.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:43:45.830' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'92f1b97e-a71b-43d8-96cd-46f9dced1900', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', N'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3', N'Private elevator lobby', 3, 0, CAST(N'2025-04-13T17:15:03.227' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'6190b922-c5dc-4d90-9d5b-477bdf284511', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', N'uploads/78439be1-8f94-45e2-88ce-f1976a075763.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:26:57.783' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9d9f1786-2edc-41cd-8b16-4aaec7dcde6f', N'86134d93-2c95-451c-88e1-9bd850086f4a', N'uploads/526d1b9f-7694-425e-92f9-f2b54700753d.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T04:07:44.270' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e2170a51-609d-415d-a117-4aea5d4c1725', N'd19a26b7-2706-446b-aa77-56b3f47407e6', N'uploads/bd7dd461-bf60-4cb0-8870-a1dba0facaed.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:20:27.330' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'2dde8dda-46e7-451a-93d4-4c8e43167816', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', N'uploads/b0f3ea2c-9e1a-4e12-9415-5ed90199026e.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:32:09.993' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e5cb52cd-f1cc-491f-a642-4cef3cca1aff', N'16fc94a4-e533-4059-b3cb-69462157698e', N'uploads/a80d69c1-7b14-4e52-b56e-a4a0acb61d13.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T04:08:21.270' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c43e34f4-9a69-4e45-8927-4dc562e45262', N'd19a26b7-2706-446b-aa77-56b3f47407e6', N'uploads/db27804f-fca3-43a2-ae38-f1b9fbe7320c.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:20:27.323' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4898f8b2-0fa4-4660-99b9-4df7d1d112b6', N'3826a636-f756-4251-9149-528ed1962cbf', N'uploads/30e059ba-dadf-4c05-b349-58ddca9d8b23.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:55:44.163' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'6e8335d1-4ce5-4e2d-885e-4ed586dcae5b', N'd19a26b7-2706-446b-aa77-56b3f47407e6', N'uploads/9aa12844-56a3-4016-b493-349acc56eeb4.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:20:27.323' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9e4e0cc2-c5ca-40f7-8099-506e320ad7ed', N'b4edd050-3574-4a10-b584-becd6238498e', N'uploads/a9802245-5484-49a1-a3ac-3d3480e6b074.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T04:11:02.557' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'26fa9efc-3a38-4228-a319-51044e9d128a', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', N'uploads/c899595a-68e4-45dc-9c6c-6af54f48edb8.jpg', N'Image Caption', 8, 0, CAST(N'2025-05-03T03:08:03.120' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9e4acba4-0092-4a89-bdd9-51156d3d2e32', N'86134d93-2c95-451c-88e1-9bd850086f4a', N'uploads/04f58d19-f768-4c9c-ad3b-afe9694bc1c3.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T04:07:44.263' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'59b55496-415b-4861-8a3a-51c38592a2c2', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', N'uploads/34cffdb5-16fa-46eb-9e86-da11369e42a3.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:26:57.783' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'44c4ac1d-d1c4-4e65-8114-5277e97edac7', N'16fc94a4-e533-4059-b3cb-69462157698e', N'uploads/cbbeef90-cfef-49e8-b64b-e3d17ab77c9f.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T04:08:21.267' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'911df3ee-661c-466a-bb5c-546ea5f596ef', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', N'uploads/954139ef-1067-4124-8a75-74e82fdeb406.jpeg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:58:06.150' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'42a32d76-0f51-4dac-b0ff-5596d574dcf2', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', N'uploads/616492ae-0a56-42af-9a5d-fb529d9bbbf5.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:58:06.140' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'1b5a0a04-b87b-4c46-8682-5611ef018f79', N'21e8997f-c651-4427-94a5-4f441d1c1678', N'uploads/f147b05c-d9d8-4274-9b25-1fa8a0135991.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:50:49.077' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'910a461d-d752-47cd-8b77-564b99383d34', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', N'uploads/7cd0b0ce-e5cf-45ec-8895-81eb105d9f3e.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:26:57.790' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'fd26e177-7d1c-42ab-bb4e-589525ef39b2', N'75de6533-f54c-4f52-823e-5295bf3ff29b', N'uploads/ff017831-9bab-43b4-8c43-05d03a2e8b8a.jpg', N'Image Caption', 5, 0, CAST(N'2025-04-29T12:52:24.577' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'93ccfc94-0be5-4513-9c40-58e825a7c4e0', N'b4edd050-3574-4a10-b584-becd6238498e', N'uploads/fec922de-671a-4070-ac3f-15cf43d712b0.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T04:11:02.557' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'ce5e8667-62e6-4159-a2dd-59eb412a11a1', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', N'uploads/32456c34-9a40-4d0d-b16e-1507ec9bd3a6.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:58:06.143' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'958e7ef8-61bf-48e3-a111-5b9e28477ae6', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', N'uploads/49ab3a68-8b93-44a7-82f2-e491d1d8533e.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T04:11:42.000' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'2f6317dd-6914-4dfc-a7cb-5bb3dbcffd6a', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', N'uploads/e5ad7408-f34c-4037-a49a-face98bb9530.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:32:09.990' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'638fba89-aa32-46ac-b6a9-5cf299dfdbbc', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', N'uploads/207327d3-a301-4e51-8917-7913a53d1784.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:08:03.110' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'41a0b539-23d5-4828-bb94-5d67e9167f0d', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', N'uploads/64aff990-df0f-4304-9163-8691412d3ef6.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:16:34.293' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'06f5946d-48a2-41be-a686-5f26d53026e1', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', N'uploads/cce4fbc5-ba5b-4ccd-8f9f-023a4f75c02f.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T04:10:03.717' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'3fa660b8-d58f-430a-b048-602ade24dda0', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', N'uploads/b03ff17f-66ab-45e5-af3f-4f18357c15e0.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:18:29.920' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'cf6ace89-adf1-4528-97ac-60c7a5c04b3f', N'9c13901f-c314-4c39-8c78-10eec76758b9', N'uploads/33f193f2-7d43-4fe5-96ae-7e581be34690.png', N'Image Caption', 3, 0, CAST(N'2025-04-29T12:38:31.797' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'207fad1d-ade6-4dfc-922e-60cff91b5737', N'86134d93-2c95-451c-88e1-9bd850086f4a', N'uploads/f7bd711e-9107-4e11-9a29-5951aca74d43.jpeg', N'Image Caption', 5, 0, CAST(N'2025-05-03T04:07:44.270' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'2db15c68-f4b6-4cfd-abc2-6156708649f5', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', N'uploads/3c1bcf36-9276-48eb-8494-410581b7b3df.png', N'Image Caption', 3, 0, CAST(N'2025-04-29T12:53:41.660' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'd8e345a2-0261-493e-bd5a-6217618ac807', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', N'uploads/e766944d-5a83-4e35-ab19-1c8ce04f3337.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:44:16.733' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'6e2a3ccd-b789-41bd-b918-621981ae33eb', N'0d802abe-e4b1-443a-8900-b914a268de03', N'uploads/613cf8d8-6068-4ce2-a3f2-35b408fabab9.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:44:58.703' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c21e18e0-b2c4-4932-a127-62d11d6e0c06', N'b4edd050-3574-4a10-b584-becd6238498e', N'uploads/65f47181-0c17-40c6-ab28-7289001ba1cf.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T04:11:02.560' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'daa27170-098e-4307-a4f7-652e8cff9015', N'aed5fdf5-4728-4122-977d-d6cea65927b4', N'uploads/38a2936e-e563-4860-862d-2731c6bcd81e.png', N'Image Caption', 2, 0, CAST(N'2025-05-03T04:12:29.603' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c3d9df7d-b667-46f3-9c30-658a0e20bbd1', N'aed5fdf5-4728-4122-977d-d6cea65927b4', N'uploads/f530d5c7-5dfb-4e09-b6c5-7ac6b78686c4.png', N'Image Caption', 4, 0, CAST(N'2025-05-03T04:12:29.617' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'8bdcf419-e464-486f-bfc6-68e9d09913e9', N'7b34c56d-e425-5f40-ad89-31eed87869c1', N'uploads/000adb42-2bd2-4fc8-b146-e5d783efe513.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:14:32.967' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'537b77d8-0e1d-49e2-817b-695767ea5d75', N'86134d93-2c95-451c-88e1-9bd850086f4a', N'uploads/6a41e294-b8ef-4396-874a-e5c818d5026d.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T04:07:44.263' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4c889177-0da7-46cc-b266-6a8c860e05af', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', N'uploads/075be768-0c61-4de2-affc-afa437c308aa.png', N'Image Caption', 1, 1, CAST(N'2025-04-29T12:53:41.657' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c0b755f0-c30d-4e5f-ab2a-6bd17e45d2de', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', N'uploads/967a7bd6-277a-4223-99ab-d020cffcb83f.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:44:16.740' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'ebb85db0-7075-4453-9b2d-6bf6b219812e', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', N'uploads/cb040140-a2e6-40fe-98f9-bafc49a0762b.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T04:10:03.720' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f913fd60-df3c-49b1-b942-6c746ea77d39', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', N'uploads/f6f2f01a-b6c0-422a-bcec-11b86660869c.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:51:58.573' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'0e577bda-4482-4302-819e-739c35c77e19', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', N'uploads/a6ad0db6-444c-45be-a113-4c4012a58b01.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:57:33.140' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'b83a275b-8450-420f-9170-757030f9aec1', N'e93f2721-e761-4063-9f83-715fdb1b70db', N'uploads/e9ae0826-0e87-4e84-a5ec-885d0bfa9904.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:22:23.760' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'3ac51c16-d2e9-43f0-b3c9-77555c7b559a', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', N'uploads/f51574a0-61c6-4d81-9b47-177a461efc92.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:24:30.130' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'85a2ea0f-3746-4379-aaa6-77a90389c597', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', N'uploads/9f89c308-bac3-4a83-abf9-352a955772fc.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T04:10:03.707' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'acffe57b-4d37-48e0-9d63-7c588fef1037', N'3826a636-f756-4251-9149-528ed1962cbf', N'uploads/f14cd9b7-4786-449a-9956-98b7bde26279.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:55:44.163' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'55cb69e8-9d25-43e7-9fd6-7dafdba92ca9', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', N'uploads/d5668c50-bafb-46d1-bfe8-d99d233d2a46.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:35:57.127' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c06149a7-1783-4ea0-a1be-7eac0f270184', N'7b34c56d-e425-5f40-ad89-31eed87869c1', N'uploads/3253c3df-c966-4752-87c5-e66027dd4fe0.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:14:32.947' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'5e3dc0d6-f4cd-4238-b280-7ee1c524d29b', N'38af6568-fa63-4f89-afaa-fd5c5008433b', N'uploads/0e6d1979-50fa-4d30-813b-7688a60a98ab.png', N'Image Caption', 2, 0, CAST(N'2025-05-03T04:12:55.753' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c1ac621d-8a29-4bc0-816f-7f27587309b8', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', N'uploads/f15a234d-5680-472b-b4e0-ebf7409efea5.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T04:09:05.063' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'df5dd707-ad88-47b3-b200-7f87864a1ea9', N'75de6533-f54c-4f52-823e-5295bf3ff29b', N'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3', N'Four-poster bed', 2, 0, CAST(N'2025-04-13T17:15:03.213' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'da3b2ce3-c640-454e-85e2-7f89dc3b5eae', N'e93f2721-e761-4063-9f83-715fdb1b70db', N'uploads/24d30efc-de1d-4fa1-b1d2-401d41d00f72.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:22:23.760' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'ce440d39-7efc-4da1-adb3-7fceb06d36fb', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', N'uploads/5bca0708-68c3-4aa2-8b89-7ee309cb85b5.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T04:09:05.063' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'3af95dce-d969-4140-840b-820bf762b245', N'21e8997f-c651-4427-94a5-4f441d1c1678', N'uploads/dfa3122f-15b5-407c-aaec-46167ceecc34.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:50:49.080' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'63580630-a6fa-4f3d-952b-8390319a67b7', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', N'uploads/17f0fbfc-eee4-4ab4-9526-85f94b38a243.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:16:34.283' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'3e58c7eb-610b-4cff-bc0c-85028ae723cc', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', N'uploads/7e46b349-2db1-480b-81bd-c7a1719002ee.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:57:33.133' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'35ccd706-cc1d-472e-b04d-88123ec77e4b', N'75de6533-f54c-4f52-823e-5295bf3ff29b', N'uploads/aa851a1a-e722-4078-aee7-6326dd17ce5a.jpg', N'Image Caption', 3, 0, CAST(N'2025-04-29T12:52:24.567' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f8014fd9-0624-4659-9393-8865bd9a04ab', N'48cd094f-abda-445c-9f14-2ab47316a4a6', N'uploads/8f2bd690-cdbb-450b-8eaf-f63f631b2b9a.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:12:35.150' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'40c5e45a-7768-48b9-a83f-889abe938ecc', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', N'uploads/11a25bc2-0437-410f-85ea-fbf873ac8968.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:57:33.127' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9f3f6f64-269b-4729-8963-896c9bb523e5', N'86134d93-2c95-451c-88e1-9bd850086f4a', N'uploads/a627669e-1ef2-407a-b1da-e8d2d3083723.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T04:07:44.273' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'1f01cfe1-bfd1-4bb5-ba03-89832184525b', N'd19a26b7-2706-446b-aa77-56b3f47407e6', N'uploads/508064b8-f634-434c-8722-199e9defcaf8.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:20:27.327' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4f102e46-db43-44e9-9f52-8d024e55448e', N'9c13901f-c314-4c39-8c78-10eec76758b9', N'uploads/9997cf80-d430-41ec-ae9b-f3290a74f2b9.png', N'Image Caption', 5, 0, CAST(N'2025-04-29T12:38:31.810' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e1e57dfe-a4c7-4bf5-a27b-8e90a925d0f2', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', N'uploads/fd8167fa-78ab-44a1-8f19-6788cf9910e6.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:35:57.133' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'd5b5580f-394a-4a78-b5f7-8fb162ddba2b', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', N'uploads/28d2f167-8172-4ffa-ad4c-cffd1fb735b1.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:18:29.913' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'83707d08-b9a9-41bf-bf2b-8ff16cb0286b', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', N'uploads/8962a4a3-539d-4b43-a611-74ea70f37356.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:44:16.730' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4037fd99-f668-4c62-84b3-92ea401dece5', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', N'uploads/8b2eb8cc-86ef-41b4-9997-558acbd0496f.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:51:58.577' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f8b96168-e7f3-4b0f-8e4c-9398edaa671c', N'3826a636-f756-4251-9149-528ed1962cbf', N'uploads/74228fdb-48f4-4901-be0b-0cf29349dc39.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:55:44.170' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'5a2e5623-44c3-4ae6-8b3d-94f9342472e6', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', N'uploads/8f511d33-7f77-43dd-bb5e-cbd7593c601c.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:33:42.613' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'6bf46838-e119-46f7-8183-95d549a3d24a', N'4b6d9220-90d5-4b61-abe5-c0d14fdcba6b', N'uploads/24bc54ce-a069-44ef-b61c-13a71628f7bd.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:30:27.017' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'aaf72ad2-69f6-4c28-8953-972e4e9fb26c', N'7e9d4294-cb3d-4afa-bcf0-55a3fe8c109f', N'uploads/c247a8db-2b2e-4770-aa1e-b5815c929727.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:18:29.907' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'6f9e8eb4-61e0-4ace-b108-98f74d467e1f', N'aed5fdf5-4728-4122-977d-d6cea65927b4', N'uploads/d6b7b14e-01de-4843-93b2-e518083ab9a6.png', N'Image Caption', 1, 1, CAST(N'2025-05-03T04:12:29.600' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'67838b48-f9ef-40f9-9030-98feb49dbfb4', N'16fc94a4-e533-4059-b3cb-69462157698e', N'uploads/c18791a4-a5e7-4dd9-9ffa-94d8bfb939d2.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T04:08:21.273' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'53785c83-cbb5-4fa8-ae5a-9ccf4c85d77b', N'e93f2721-e761-4063-9f83-715fdb1b70db', N'uploads/1bbbbd20-5cb1-4d4a-8195-3cb5795c1398.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:22:23.767' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'526ff6c9-d855-4ae5-9cc0-9fb6f74c4b93', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', N'uploads/40109b73-c97d-408d-905d-42a99ddb2f74.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:08:03.113' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'bb95a0fb-9c4c-47b5-99d5-a3ab610cd390', N'7b34c56d-e425-5f40-ad89-31eed87869c1', N'uploads/df8c07ee-d2ec-4902-ad35-ba6aea5bff04.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:14:32.947' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'b392c05f-b9df-4b9a-98a4-a42a5a79f532', N'aed5fdf5-4728-4122-977d-d6cea65927b4', N'uploads/cb39f06f-e80f-4470-9505-e7e3ebd7eae8.png', N'Image Caption', 5, 0, CAST(N'2025-05-03T04:12:29.617' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'fb2efba1-a7e6-4f15-b3f7-a5326032c0fb', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', N'uploads/0e10b5c1-fd89-4ecc-9a4c-a5cb8bc842b6.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T04:09:05.060' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'd11d7a01-e053-47cc-b0c8-a55d24087954', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', N'uploads/8ed7da87-bc99-4686-852e-2c5c860db2b3.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T04:09:05.060' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'a4001b1f-ecc0-48ac-b1bf-a77fa374b1d3', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', N'uploads/a0aed1de-b5b1-494f-bfa0-e452bf1d7326.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:24:30.140' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4ac76ea0-3005-4fa4-84c9-a81211ca2567', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', N'uploads/0913e874-0f37-4ee1-a752-7b1313c7cae9.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:45:53.853' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'63328360-7c0f-4d6d-909c-a9e964898df8', N'2a991029-4265-4713-bbc5-aff01ed72820', N'uploads/482238a9-f846-4563-aa6b-3ff5e89a8f87.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T04:10:36.407' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'1bb3c838-669d-4929-a57e-a9f00a14cf03', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', N'uploads/e881505b-da4a-4a88-99f8-d9cd7092821e.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:08:03.117' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'dfdb8f80-2741-4d52-8403-aa0adc0eefb3', N'13290854-ca1b-48c2-b5fb-7fe388ea1a45', N'uploads/7d7c2fed-f5c0-497b-992f-e5eec424496d.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:58:06.153' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'3204d5b6-48f8-448c-8498-ab4b48fb6868', N'425f0943-c2a6-449f-aeaa-9f4d9240a2d9', N'uploads/ad056b36-f604-4b87-b65d-28d54183ff1c.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T04:09:05.060' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4ab95780-e1a7-4a7f-9c02-b2790c4efdc0', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', N'uploads/cb042c42-501c-43d6-9872-c5cf64e31143.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T04:11:41.997' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4c85bf52-1d44-462b-8004-b97819e0a390', N'e93f2721-e761-4063-9f83-715fdb1b70db', N'uploads/cfa2deda-3e2e-436b-ae3f-97ffa1edc5de.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:22:23.763' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'b5d5082d-7359-463b-ad99-ba021355e1c5', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', N'uploads/b306d347-43c8-4f4c-8979-cff97750c61c.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:33:42.617' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'7d530418-0ae1-419b-a344-bbbacc47c0e3', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', N'uploads/6aaa7b56-0563-45a5-b4e0-a0a7f334d49c.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:33:42.617' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e127e46e-38a1-4a8b-923c-bbbe9b9f9d49', N'd19a26b7-2706-446b-aa77-56b3f47407e6', N'uploads/8ab14fec-070f-4085-97f2-9a476af24243.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:20:27.330' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'94a0bd88-0d8f-4e3f-a09b-bdf8797a7163', N'5f894d80-ae8e-4451-948d-eccbc88d9a34', N'uploads/62a2853d-ca8c-4890-bec0-b2f6a0b4dbdc.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:33:42.620' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'89a2944a-f2a3-484c-ac57-be59dfc6b95e', N'48cd094f-abda-445c-9f14-2ab47316a4a6', N'uploads/af1cc044-6845-4484-bc48-18d287249ca9.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:12:35.147' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'993acdd8-053f-46a5-852c-be993bbba5d0', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', N'uploads/e6f3ed0b-5c87-4019-b0fd-c79502c388af.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:45:53.857' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'0dfd704e-6024-4fa0-b22d-c04a37accd8b', N'e93f2721-e761-4063-9f83-715fdb1b70db', N'uploads/12be6ef5-2a50-4161-ac43-3156b1bd01d4.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:22:23.757' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'389283bb-9e65-4798-964d-c0956c420a80', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', N'uploads/878bc8be-bcb6-4474-bb60-357cff025cb8.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:26:57.787' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e4ee8ca0-8642-4e67-86e4-c39b122d7d46', N'48cd094f-abda-445c-9f14-2ab47316a4a6', N'uploads/3a7e61cc-882c-4f54-8396-d70d78cf9765.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:12:35.153' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c6267749-6d18-468c-80db-c400e897f7a6', N'0d802abe-e4b1-443a-8900-b914a268de03', N'uploads/97d44487-bb50-4188-899d-eb84484fbbf8.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:44:58.707' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c7e87c4b-6787-493a-97c5-c54c3883c63a', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', N'uploads/5bf7c1d7-6380-4ce5-a6a6-124ff66e2fe9.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:32:09.997' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'8f0b3704-a71d-4e0d-a5d8-c5864f6e39be', N'7b34c56d-e425-5f40-ad89-31eed87869c1', N'uploads/fea5f1d2-f8d8-44ff-bd60-39e5bc696830.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:14:32.950' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'1af40328-f740-46b3-8aee-c850f50dfcb0', N'48cd094f-abda-445c-9f14-2ab47316a4a6', N'uploads/90b092a0-a2dd-49d6-b712-491d63948d5a.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:12:35.150' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'5f0e9a5f-acb1-4cef-bc56-c85f43257ba5', N'd19a26b7-2706-446b-aa77-56b3f47407e6', N'uploads/6fec91ea-0e4a-4b25-a679-16115a8e3c8b.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:20:27.320' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9ee10689-ec8c-44f8-a398-c9051f88cafd', N'75de6533-f54c-4f52-823e-5295bf3ff29b', N'uploads/f238c6b2-d93f-41e5-804c-05840cdc23aa.jpg', N'Image Caption', 1, 1, CAST(N'2025-04-29T12:52:24.563' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'2065aa36-9b4f-43cf-8158-ca48ca5955fd', N'7b34c56d-e425-5f40-ad89-31eed87869c1', N'uploads/2765eea2-71e1-480c-8c02-c009fafb43b9.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:14:32.943' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'039a1b3b-cdb2-4203-a712-cab8f45cc0c9', N'38af6568-fa63-4f89-afaa-fd5c5008433b', N'uploads/81575290-d247-4036-9b2c-67549fa5a481.png', N'Image Caption', 5, 0, CAST(N'2025-05-03T04:12:55.760' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'b90f0a5c-84e5-49ee-a601-cbeb8a9a777a', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', N'uploads/8b30d367-5635-4e04-a99e-ccba2eb94b28.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:26:57.793' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'35ba6366-452d-413b-955a-cc014a0907f4', N'16fc94a4-e533-4059-b3cb-69462157698e', N'uploads/548801a2-6c68-441c-92af-486a3373a7e5.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T04:08:21.270' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'5028d3b3-985d-4df5-ad02-d1c8cac03a33', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', N'uploads/8fd2d758-c749-44eb-a29d-b024de9acace.jpg', N'Image Caption', 7, 0, CAST(N'2025-05-03T03:08:03.120' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f8a43d1f-c5e9-4713-967d-d29c59908809', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', N'uploads/ec12d4f7-efe5-499b-a678-8e0d275f435b.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:24:30.130' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'82524ada-85b2-469a-9394-d406ed89c43b', N'3826a636-f756-4251-9149-528ed1962cbf', N'uploads/74708412-8819-4eb2-aa11-72b5163555dc.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:55:44.160' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4b7f0bc7-e4d7-424a-ab6f-d42685d55fcf', N'2a991029-4265-4713-bbc5-aff01ed72820', N'uploads/f0c74859-2be9-45ec-a27f-1834dcfb0588.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T04:10:36.410' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'4b74b913-95ab-4ee6-b901-d4e020a606f4', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', N'uploads/6cc9f1c3-d80d-4710-a140-162aa545c938.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T04:11:42.003' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'794ffaa0-6121-4202-b4e1-d62aed348847', N'0d802abe-e4b1-443a-8900-b914a268de03', N'uploads/32c265a7-b868-4c71-b504-1e5cd45d3bf4.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:44:58.693' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'af07e12a-4229-432e-8fb0-d6636a4b33a3', N'4a49ba84-fa09-422a-adc9-cfb44d07287c', N'uploads/c3f49bf1-774e-4b08-937d-5fe3bf7560b3.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:45:53.853' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'3ee3d805-ad50-4d27-8049-daea2d4875c9', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', N'uploads/bc5929fb-286e-4851-b5dd-d42ed11b22fb.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:16:34.287' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9b5931ca-7252-436c-873f-db86336b67e9', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', N'uploads/e4149f3d-14e4-4f66-97c7-b767c9d0aa00.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:43:45.847' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'56bfd32d-8b48-48f1-bc70-dc058502d52d', N'9c13901f-c314-4c39-8c78-10eec76758b9', N'uploads/c383163f-19d1-4235-8826-0c602bcb6add.png', N'Image Caption', 1, 1, CAST(N'2025-04-29T12:38:31.790' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'ba3dc1c4-106f-4cee-b8e0-dd44cb81e4f2', N'ec17e6ba-96ab-4bea-bdda-c642d170467a', N'uploads/51b1a3b4-7760-47e4-9fd5-570fce8c0224.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T04:11:42.000' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'bf8211ae-0833-40f3-810f-e19e9411cbd5', N'21e8997f-c651-4427-94a5-4f441d1c1678', N'uploads/299d0dfd-3469-4813-8234-d9cb0c2a4393.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:50:49.080' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'92ff74f9-c25a-4c80-9562-e1b741acdbb9', N'0d802abe-e4b1-443a-8900-b914a268de03', N'uploads/33959e30-1bbd-4f2d-a4f3-1a2a7e1e0ccb.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:44:58.700' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'f8e267ae-5e56-424f-9f26-e2f04ca32fde', N'48cd094f-abda-445c-9f14-2ab47316a4a6', N'uploads/facc0501-95c9-4774-b784-063f29b98e30.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:12:35.157' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'b445c88a-5ba7-4788-a043-e54082e5970c', N'86134d93-2c95-451c-88e1-9bd850086f4a', N'uploads/782a4416-a728-4855-9806-268e918dc35a.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T04:07:44.263' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'5c7fdb93-3eb2-4027-b519-e6bc64cf5eea', N'23c044f2-bfb9-4c1a-a0d7-ffb26132b707', N'uploads/5d407732-0dac-48b4-a1b2-bf4961a609dc.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:35:57.143' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'cbb31006-b1ee-49ec-9e7a-e79d78a6b0a9', N'8fd9cf49-5134-4b40-89df-83ca18b274a2', N'uploads/33d6bd02-1bfc-4109-8746-57bc7e123516.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:24:30.127' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'0c2d4b86-c4cc-4042-a06a-e82121c4ac79', N'e93f2721-e761-4063-9f83-715fdb1b70db', N'uploads/85fe192d-c82b-4ab2-98ca-05b727ad7e21.jpeg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:22:23.767' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'e8942376-5b83-46fe-bf22-e97173a6d244', N'c7dbe33e-488d-404a-9ebf-6e48345d9e65', N'uploads/db9146e2-11cc-41c5-9c2e-b2277c9341b8.jpeg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:44:16.740' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'999a9f31-eedc-4389-a904-ebfa87b2810a', N'7b34c56d-e425-5f40-ad89-31eed87869c1', N'uploads/30bd8f00-0cce-4b84-961c-ed0feb01b73b.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:14:32.957' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'09c3dfdd-dcf5-4a6c-8217-ec7a3e06932a', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', N'uploads/9477cae4-a69f-42f5-a59a-d3f5404906fc.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:43:45.827' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'b7646205-6e71-4e19-b7ee-ed1f9cb5c628', N'0d802abe-e4b1-443a-8900-b914a268de03', N'uploads/cd290f3a-8fe9-4ce5-8861-6b03eb24f531.jpg', N'Image Caption', 3, 0, CAST(N'2025-05-03T03:44:58.697' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9a276add-d38d-468c-bf59-ef0cfffca3b8', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', N'uploads/17625c32-60b2-4cc3-9297-c12aff97875c.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:16:34.297' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9ec0ddc0-98e3-4292-96bf-ef909d386a24', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', N'https://images.unsplash.com/photo-1564419320461-6870880221ad?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3', N'Gold-accented master bathroom', 2, 0, CAST(N'2025-04-13T17:15:03.227' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'0d30c5e0-a208-47fc-8120-efd0e597e547', N'd4d75353-1c00-4fbb-8176-e22c2a3d69e5', N'uploads/2aab27f3-64e8-4901-a9e2-a9eaa80a447d.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T03:32:10.000' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'93fecc30-6bbe-4e33-8adc-f1e183afa583', N'6b26b80a-d3b3-4139-bbe4-848f9474f039', N'uploads/42973c3c-6366-49c7-b8c0-e6b3d41e6a83.jpg', N'Image Caption', 5, 0, CAST(N'2025-05-03T03:26:57.790' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'cd170270-4374-468f-8184-f3b70d0b7336', N'38af6568-fa63-4f89-afaa-fd5c5008433b', N'uploads/dfe3688f-28ab-4c67-86e5-a3c55ed8b13f.png', N'Image Caption', 1, 1, CAST(N'2025-05-03T04:12:55.750' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'41c88842-c1b8-449d-8874-f3cd1417c3fa', N'16fc94a4-e533-4059-b3cb-69462157698e', N'uploads/99120161-35fa-40de-bf57-581055617670.jpg', N'Image Caption', 6, 0, CAST(N'2025-05-03T04:08:21.273' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'd7092ced-7c39-4d06-b248-f5917b9fd4a7', N'0aadcb2f-6e36-4dda-a91f-55c53485b637', N'uploads/82fbbe3e-283f-43aa-a6d0-0b29440d8560.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:43:45.837' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'ab4ca05a-6b9c-4e90-9a3e-f681ccd20027', N'88dd91cf-1d56-44cc-ad68-4f8289e919a2', N'uploads/655868af-fdd8-499e-8ef3-832e9f0245b6.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T03:16:34.287' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'a8d090c5-0a7c-42b4-8bca-fb593c916c7f', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', N'uploads/0be47912-31ab-4cc5-be9f-5e790b227602.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:51:58.573' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'6b6f9cbc-0852-48cc-9704-fda0a7d16ae1', N'b00d015a-57ce-46bb-83de-08b5e76f96e7', N'uploads/467fbac4-1a86-4045-b188-a57a546bc342.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:08:03.107' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'7ee7d3a3-2913-4b74-ba88-fdecd068f256', N'8a23b45c-d314-4e39-9c78-20ffc76758b0', N'uploads/fa7e79fe-d714-4900-879f-6a2ad9079915.jpg', N'Image Caption', 1, 1, CAST(N'2025-05-03T03:51:58.573' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'0384c498-18f1-4480-b803-fe6f4196a8ad', N'81de9b65-33a6-4bb0-8f00-70f5b4ae4ac5', N'uploads/83d9b553-de87-43e6-ab11-4b2ddb724cad.jpg', N'Image Caption', 2, 0, CAST(N'2025-05-03T03:57:33.127' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'c8a0935c-4920-4771-8e94-ffd6d0cbfc90', N'29a42d61-b4ef-40b9-b19c-52b145c61aab', N'uploads/109d5fd3-deeb-4ad3-b5ec-8067ef83b697.png', N'Image Caption', 2, 0, CAST(N'2025-04-29T12:53:41.657' AS DateTime))
GO
INSERT [dbo].[ListingPhotos] ([Id], [listingId], [url], [caption], [displayOrder], [isPrimary], [uploadedAt]) VALUES (N'9c747ef1-e85e-4cfb-8f9c-ffeaf92eee1f', N'ceea6ecb-f8cd-4482-9e0d-a34577956eb8', N'uploads/0d67de12-1f00-43d8-9e8a-8239aaa0f4f0.jpg', N'Image Caption', 4, 0, CAST(N'2025-05-03T04:10:03.713' AS DateTime))
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250413105816_m1', N'9.0.3')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250417183126_ChatBotAndConversations', N'9.0.3')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250420150629_last', N'9.0.3')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250421112606_m1', N'9.0.3')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250424092612_m1', N'9.0.3')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250427201540_m1', N'9.0.3')
GO
