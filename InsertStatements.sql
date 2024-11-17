-- INSERT Data into Brand Table
INSERT INTO Brand (BrandID, Name, Description, FoundedYear, Website, Logo, AverageSustainabilityScore) VALUES
(1, 'EcoWear', 'Sustainable fashion brand', 2010, 'www.ecowear.com', 'logo1.png', 8.5),
(2, 'GreenThreads', 'Eco-friendly clothing', 2015, 'www.greenthreads.com', 'logo2.png', 7.8),
(3, 'NatureStyle', 'Natural material clothes', 2012, 'www.naturestyle.com', 'logo3.png', 9.2),
(4, 'RecycledFashion', 'Recycled materials fashion', 2018, 'www.recycledfashion.com', 'logo4.png', 8.0),
(5, 'EcoChic', 'Stylish and sustainable', 2020, 'www.ecochic.com', 'logo5.png', 7.9),
(6, 'ZeroWaste', 'Zero-waste manufacturing', 2019, 'www.zerowaste.com', 'logo6.png', 9.1),
(7, 'GreenWave', 'Sustainable outdoor gear', 2017, 'www.greenwave.com', 'logo7.png', 8.3),
(8, 'PureNature', 'Organic and natural materials', 2013, 'www.purenature.com', 'logo8.png', 8.9),
(9, 'SustainCloth', 'Sustainable luxury clothing', 2016, 'www.sustaincloth.com', 'logo9.png', 9.0),
(10, 'EcoFuture', 'Future-forward eco fashion', 2021, 'www.ecofuture.com', 'logo10.png', 7.7);

-- INSERT Data into Product Table
INSERT INTO Product (ProductID, BrandID, Name, Description, Price, Material, StockQuantity, DateAdded, LastUpdated, AverageRating, Weight, RefCategory) VALUES
(1345, 1, 'Eco T-Shirt', '100% organic cotton', 25.99, 'Organic Cotton', 100, '2024-01-01', '2024-02-01', 4.5, 0.5, 'Mens Clothing'),
(2672, 2, 'Recycled Jeans', 'Made from recycled denim', 49.99, 'Recycled Denim', 50, '2024-03-01', '2024-03-15', 4.7, 1.0, 'Clothing'),
(3457, 3, 'Sustainable Jacket', 'Water-resistant and eco-friendly', 89.99, 'Recycled Polyester', 20, '2024-04-01', '2024-04-10', 4.8, 1.5, 'Clothing'),
(4130, 4, 'Recycled Hoodie', 'Hoodie made from recycled fibers', 60.00, 'Recycled Cotton', 40, '2024-05-01', '2024-05-05', 4.4, 1.2, 'Womens Clothing'),
(5998, 5, 'Eco Backpack', 'Backpack made from sustainable materials', 70.00, 'Recycled Nylon', 50, '2024-06-01', '2024-06-10', 4.6, 1.3, 'Bags'),
(6218, 6, 'Zero Waste Hat', '100% zero-waste manufacturing', 20.00, 'Recycled Wool', 60, '2024-06-15', '2024-06-20', 4.5, 0.3, 'Hats'),
(7193, 7, 'Eco Running Shoes', 'Eco-friendly running shoes', 90.00, 'Organic Rubber', 30, '2024-07-01', '2024-07-05', 4.7, 0.8, 'Footwear'),
(8116, 8, 'PureNature Scarf', 'Scarf made from natural fibers', 30.00, 'Organic Wool', 100, '2024-08-01', '2024-08-05', 4.3, 0.4, 'Accessory'),
(9053, 9, 'Sustainable Suit', 'Luxury suit made from eco-friendly materials', 500.00, 'Recycled Wool', 10, '2024-09-01', '2024-09-10', 4.9, 2.5, 'Clothing'),
(1067, 10, 'EcoFuture Sunglasses', 'Sunglasses made from sustainable materials', 150.00, 'Recycled Plastic', 20, '2024-09-15', '2024-09-20', 4.8, 0.2, 'Sunglasses'),
(8756, 4, 'Recycled Pants', 'Recycled pair of levis jeans', 70.00, 'Denim', 10, '2024-05-10', '2024-05-28', 4.0, 1.0, 'Mens Clothing'),
(2459, 7, 'Eco Hiking boots', 'Eco-friendly hiking boots', 120.00, 'Organic Rubber', 15, '2024-07-06', '2024-11-03', 4.0, 2.1, 'Footwear');

-- INSERT: ClothingItem table with clothing-specific measurements
INSERT INTO ClothingItem (ProductID, BrandID, AvailableSizes, Dimensions, WaistWidth, ChestWidth, ShoulderWidth, SleeveLength, TotalLength) VALUES
(1345, 1, 'S,M,L', '10x10x1', 30.0, 50.0, 40.0, 65.0, 70.0),
(2672, 2, 'S,M,L', '30x40x2', 32.0, 52.0, 42.0, 68.0, 72.0),
(3457, 3, 'M,L', '15x10x5', 32.0, 54.0, 44.0, 70.0, 75.0),
(4130, 4, 'S,M,L', '20x30x2', 28.0, 48.0, 42.0, 62.0, 72.0),
(7193, 7, 'S,M,L', '20x10x5', NULL, NULL, NULL, NULL, NULL),
(9053, 9, 'M,L', '50x50x10', 40.0, 60.0, 50.0, 75.0, 80.0),
(8756, 4, 'S,M,L', '30x40x2', 34.0, NULL, NULL, NULL, NULL),
(2459, 7, '7,8,9,10,11', NULL, NULL, NULL, NULL, NULL, NULL);

-- INSERT: AccessoryItem table with updated structure
INSERT INTO AccessoryItem (ProductID, BrandID, Type, Material) VALUES
(5998, 5, 'bag', 'Recycled Nylon'),
(6218, 6, 'hat', 'Recycled Wool'),
(8116, 8, 'scarf', 'Organic Wool'),
(1067, 10, 'sunglasses', 'Recycled Plastic');

-- INSERT Data into SustainabilityMetric Table
INSERT INTO SustainabilityMetric (MetricID, MetricType, Value, ProductID, BrandID, BrandUnit, ProductUnit, MeasurementData) VALUES
(1, 'CO2 Emission', 12.5, 1345, 1, 'kg', 'g', 'Measured during production'),
(2, 'Water Usage', 30.0, 2672, 2, 'liters', 'ml', 'Water used in material processing'),
(3, 'Energy Consumption', 50.0, 3457, 3, 'kWh', 'Wh', 'Energy used in manufacturing'),
(4, 'Waste Generated', 5.0, 4130, 4, 'kg', 'g', 'Waste generated during production'),
(5, 'Recycled Content', 80.0, 5998, 5, '%', '%', 'Percentage of recycled material used'),
(6, 'CO2 Emission', 15.0, 6218, 6, 'kg', 'g', 'Measured during production'),
(7, 'Water Usage', 40.0, 7193, 7, 'liters', 'ml', 'Water used in manufacturing'),
(8, 'Energy Consumption', 60.0, 8116, 8, 'kWh', 'Wh', 'Energy consumed during production'),
(9, 'Waste Generated', 6.0, 9053, 9, 'kg', 'g', 'Waste generated during suit manufacturing'),
(10, 'Recycled Content', 90.0, 1067, 10, '%', '%', 'Percentage of recycled material in sunglasses');

-- INSERT Data into Category Table
INSERT INTO Category (CategoryID, Name, Description, ParentCategoryID) VALUES
(1, 'Clothing', 'All clothing items', NULL),
(2, 'Accessories', 'All accessories', NULL),
(3, 'Mens Clothing', 'Clothing for men', 1),
(4, 'Womens Clothing', 'Clothing for women', 1),
(5, 'Eco-Friendly Products', 'All eco-friendly products', NULL),
(6, 'Footwear', 'All types of shoes', 1),
(7, 'Outerwear', 'Jackets and coats', 1),
(8, 'Hats', 'Various types of hats', 2),
(9, 'Bags', 'Different styles of bags', 2),
(10, 'Sunglasses', 'Sunglasses and eyewear', 2);

-- INSERT Data into Inventory Table
INSERT INTO Inventory (InventoryID, ProductID, BrandID, Quantity, LastUpdated) VALUES
(1993721, 1345, 1, 100, '2024-07-01'),
(2628436, 2672, 2, 50, '2024-07-15'),
(3364828, 3457, 3,  20, '2024-08-01'),
(4097352, 4130, 4, 40, '2024-08-15'),
(5159465, 5998, 5, 50, '2024-09-01'),
(6475038, 6218, 6, 60, '2024-09-10'),
(7130485, 7193, 7, 30, '2024-09-20'),
(8095128, 8116, 8, 100, '2024-09-25'),
(9739462, 9053, 9, 10, '2024-10-01'),
(1023447, 1067, 10, 20, '2024-10-10');

-- INSERT Data into User Table
INSERT INTO "User" (Email, TotalSpent, Password, RegistrationDate, DOB, PhoneNumber, LastName, FirstName, UserType, LastLoginDate) VALUES
('user1@example.com', 150.50, 'password123', '2023-01-01', '1990-05-15', '1234567890', 'Doe', 'John', 'regular', '2024-09-01'),
('admin1@example.com', 500.00, 'adminpass', '2023-06-10', '1985-08-25', '0987654321', 'Smith', 'Jane', 'admin', '2024-10-10'),
('user2@example.com', 200.00, 'password456', '2023-03-05', '1992-09-10', '5555555555', 'Brown', 'Lisa', 'regular', '2024-09-15'),
('user3@example.com', 300.00, 'password789', '2023-07-12', '1988-11-20', '4444444444', 'Johnson', 'Tom', 'regular', '2024-09-18'),
('admin2@example.com', 700.00, 'adminpass2', '2023-08-18', '1983-12-05', '6666666666', 'Williams', 'Mary', 'admin', '2024-10-12'),
('user4@example.com', 100.00, 'password001', '2024-01-20', '1995-04-22', '3333333333', 'Taylor', 'Mark', 'regular', '2024-10-01'),
('user5@example.com', 250.00, 'password002', '2024-02-15', '1991-07-14', '7777777777', 'Anderson', 'Emily', 'regular', '2024-10-05'),
('admin3@example.com', 600.00, 'adminpass3', '2024-03-10', '1986-02-18', '8888888888', 'White', 'Jake', 'admin', '2024-10-09'),
('user6@example.com', 175.00, 'password003', '2024-04-25', '1993-10-12', '2222222222', 'Harris', 'Olivia', 'regular', '2024-10-07'),
('user7@example.com', 320.00, 'password004', '2024-05-18', '1989-06-30', '1111111111', 'Martinez', 'David', 'regular', '2024-10-03');

-- INSERT Data into RegularUser Table
INSERT INTO RegularUser (UserID) VALUES
(1), (3), (4), (6), (7), (9), (10);

-- INSERT Data into AdminUser Table
INSERT INTO AdminUser (UserID) VALUES
(2), (5), (8);

-- INSERT Data into UserActivity Table
INSERT INTO UserActivity (ActivityID, UserID, LogTime, Details, ActivityType) VALUES
(1, 1, '2024-09-10 10:00:00', 'Logged in', 'login'),
(2, 1, '2024-09-10 10:30:00', 'Browsed products', 'browse'),
(3, 2, '2024-10-01 14:00:00', 'Updated system settings', 'admin action'),
(4, 3, '2024-09-15 16:00:00', 'Logged in', 'login'),
(5, 4, '2024-09-18 11:00:00', 'Made a purchase', 'purchase'),
(6, 5, '2024-10-10 13:00:00', 'Reviewed system logs', 'admin action'),
(7, 6, '2024-10-01 09:00:00', 'Browsed products', 'browse'),
(8, 7, '2024-10-05 10:00:00', 'Added item to cart', 'cart addition'),
(9, 8, '2024-10-09 08:30:00', 'Reviewed user accounts', 'admin action'),
(10, 9, '2024-10-07 14:00:00', 'Made a purchase', 'purchase');

-- INSERT Data into Cart Table
INSERT INTO Cart (CartID, UserID, CreatedAt, UpdatedAt) VALUES
(1, 1, '2024-08-01 12:00:00', '2024-08-05 12:30:00'),
(2, 3, '2024-09-01 14:00:00', '2024-09-02 14:30:00'),
(3, 4, '2024-09-18 16:00:00', '2024-09-19 16:30:00'),
(4, 6, '2024-10-01 09:00:00', '2024-10-02 09:30:00'),
(5, 7, '2024-10-05 10:00:00', '2024-10-06 10:30:00'),
(6, 9, '2024-10-07 14:00:00', '2024-10-08 14:30:00'),
(7, 10, '2024-10-03 08:00:00', '2024-10-04 08:30:00'),
(8, 8, '2024-10-09 08:30:00', '2024-10-10 09:00:00'),
(9, 2, '2024-10-01 12:00:00', '2024-10-02 12:30:00'),
(10, 5, '2024-10-10 13:00:00', '2024-10-11 13:30:00');

-- INSERT Data into CartItem Table
INSERT INTO CartItem (CartID, ProductID, BrandID, Quantity, AddedAt) VALUES
(1, 1345, 1, 2, '2024-08-01 12:10:00'),
(1, 2672, 2, 1, '2024-08-01 12:15:00'),
(2, 3457, 3, 1, '2024-09-01 14:10:00'),
(2, 4130, 4, 2, '2024-09-01 14:20:00'),
(3, 5998, 5, 1, '2024-09-18 16:10:00'),
(3, 6218, 6, 3, '2024-09-18 16:20:00'),
(4, 7193, 7, 1, '2024-10-01 09:10:00'),
(5, 8116, 8, 2, '2024-10-05 10:10:00'),
(6, 9053, 9, 1, '2024-10-07 14:10:00'),
(7, 1067, 10, 2, '2024-10-03 08:10:00');

-- INSERT Data into Wishlist Table
INSERT INTO Wishlist (WishlistID, UserID, CreatedAt) VALUES
(1, 1, '2024-06-15 15:00:00'),
(2, 3, '2024-07-01 12:00:00'),
(3, 4, '2024-07-15 10:00:00'),
(4, 6, '2024-08-05 09:00:00'),
(5, 7, '2024-08-15 14:00:00'),
(6, 9, '2024-09-01 16:00:00'),
(7, 10, '2024-09-10 13:00:00'),
(8, 8, '2024-09-25 11:00:00'),
(9, 2, '2024-10-01 08:00:00'),
(10, 5, '2024-10-05 14:00:00');

-- INSERT Data into WishlistItem Table
INSERT INTO WishlistItem (WishlistItemID, WishlistID, ProductID, BrandID, AddedAt) VALUES
(1, 1, 1345, 1, '2024-06-15 15:05:00'),
(2, 2, 2672, 2, '2024-07-01 12:05:00'),
(3, 3, 3457, 3, '2024-07-15 10:05:00'),
(4, 4, 4130, 4, '2024-08-05 09:05:00'),
(5, 5, 5998, 5, '2024-08-15 14:05:00'),
(6, 6, 6218, 6, '2024-09-01 16:05:00'),
(7, 7, 7193, 7, '2024-09-10 13:05:00'),
(8, 8, 8116, 8, '2024-09-25 11:05:00'),
(9, 9, 9053, 9, '2024-10-01 08:05:00'),
(10, 10, 1067, 10, '2024-10-05 14:05:00');

-- INSERT Data into Review Table
INSERT INTO Review (ReviewID, UserID, ProductID, BrandID, ReviewDate, Rating, Comment) VALUES
(1, 1, 1345, 1, '2024-07-20', 4.5, 'Great product!'),
(2, 2, 2672, 2, '2024-07-22', 4.7, 'Comfortable and eco-friendly'),
(3, 3, 3457, 3, '2024-07-25', 4.8, 'Love the sustainable material'),
(4, 4, 4130, 4, '2024-08-01', 4.4, 'Very stylish'),
(5, 5, 5998, 5, '2024-08-05', 4.6, 'Highly recommend'),
(6, 6, 6218, 6, '2024-08-10', 4.5, 'Amazing product'),
(7, 7, 7193, 7, '2024-08-15', 4.7, 'Perfect for running'),
(8, 8, 8116, 8, '2024-08-20', 4.3, 'Warm and cozy'),
(9, 9, 9053, 9, '2024-08-25', 4.9, 'Luxury with sustainability'),
(10, 10, 1067, 10, '2024-09-01', 4.8, 'Great sunglasses!');

-- INSERT Data into Outfit Table
INSERT INTO Outfit (OutfitID, UserID, CreatedAt, UpdatedAt, Description, Name) VALUES
(1, 1, '2024-05-10 09:00:00', '2024-05-12 09:30:00', 'Summer outfit', 'Summer Casual'),
(2, 3, '2024-06-01 10:00:00', '2024-06-03 10:30:00', 'Winter collection', 'Winter Warmth'),
(3, 4, '2024-07-10 08:00:00', '2024-07-12 08:30:00', 'Office wear', 'Business Attire'),
(4, 6, '2024-08-01 12:00:00', '2024-08-05 12:30:00', 'Casual day out', 'Weekend Vibes'),
(5, 7, '2024-09-01 14:00:00', '2024-09-05 14:30:00', 'Beach wear', 'Summer Beach'),
(6, 9, '2024-09-10 09:00:00', '2024-09-12 09:30:00', 'Formal wear', 'Evening Elegance'),
(7, 10, '2024-10-01 08:00:00', '2024-10-03 08:30:00', 'Sports wear', 'Athletic Fit'),
(8, 8, '2024-10-05 10:00:00', '2024-10-06 10:30:00', 'Outdoor gear', 'Hiking Ready'),
(9, 2, '2024-10-09 07:00:00', '2024-10-10 07:30:00', 'Autumn collection', 'Fall Fashion'),
(10, 5, '2024-10-15 15:00:00', '2024-10-16 15:30:00', 'Party wear', 'Evening Party');

-- INSERT Data into OutfitItem Table
INSERT INTO OutfitItem (OutfitID, ProductID, BrandID) VALUES
(1, 1345, 1),
(2, 2672, 2),
(3, 3457, 3),
(4, 4130, 4),
(5, 5998, 5),
(6, 6218, 6),
(7, 7193, 7),
(8, 8116, 8),
(9, 9053, 9),
(10, 1067, 10);

-- INSERT Data into Order Table
INSERT INTO "Order" (OrderID, UserID, OrderDate, TotalAmount, BillingAddress, ShippingAddress, Status) VALUES
(17892, 1, '2024-08-20', 100.00, '123 Street, City', '123 Street, City', 'shipped'),
(21539, 3, '2024-08-25', 120.00, '456 Avenue, Town', '456 Avenue, Town', 'shipped'),
(38730, 4, '2024-09-01', 80.00, '789 Boulevard, City', '789 Boulevard, City', 'processing'),
(42581, 6, '2024-09-10', 150.00, '1010 Circle, Village', '1010 Circle, Village', 'delivered'),
(55429, 7, '2024-09-15', 200.00, '1212 Road, Hamlet', '1212 Road, Hamlet', 'shipped'),
(62187, 9, '2024-09-20', 175.00, '1313 Drive, City', '1313 Drive, City', 'processing'),
(76520, 10, '2024-09-25', 220.00, '1414 Path, Town', '1414 Path, Town', 'shipped'),
(81137, 8, '2024-09-30', 300.00, '1515 Lane, City', '1515 Lane, City', 'delivered'),
(98621, 2, '2024-10-01', 180.00, '1616 Street, Village', '1616 Street, Village', 'processing'),
(10413, 5, '2024-10-05', 250.00, '1717 Avenue, City', '1717 Avenue, City', 'shipped');

-- INSERT Data into OrderItem Table
INSERT INTO OrderItem (OrderID, ProductID, BrandID, Quantity, PriceAtPurchase) VALUES
(17892, 1345, 1, 2, 25.99),
(17892, 2672, 2, 1, 49.99),
(21539, 3457, 3, 1, 89.99),
(21539, 4130, 4, 2, 60.00),
(38730, 5998, 5, 1, 70.00),
(38730, 6218, 6, 3, 20.00),
(42581, 7193, 7, 1, 90.00),
(55429, 8116, 8, 2, 30.00),
(62187, 9053, 9, 1, 500.00),
(76520, 1067, 10, 2, 150.00),
(81137, 8116, 8, 1, 30.00),
(98621, 2672, 2, 1, 49.99),
(10413, 1345, 1, 2, 25.99);

-- INSERT Data into Payment Table
INSERT INTO Payment (PaymentID, OrderID, Address, Status, PaymentDate, TransactionID, PaymentMethod, Amount) VALUES
(1923, 17892, '123 Street, City', 'completed', '2024-08-20', 'TX12345', 'credit card', 100.00),
(2625, 21539, '456 Avenue, Town', 'completed', '2024-08-25', 'TX23456', 'debit card', 120.00),  -- Fixed OrderID from 21549 to 21539
(3120, 38730, '789 Boulevard, City', 'processing', '2024-09-01', 'TX34567', 'paypal', 80.00),
(4729, 42581, '1010 Circle, Village', 'completed', '2024-09-10', 'TX45678', 'credit card', 150.00),
(5482, 55429, '1212 Road, Hamlet', 'completed', '2024-09-15', 'TX56789', 'debit card', 200.00),
(6018, 62187, '1313 Drive, City', 'processing', '2024-09-20', 'TX67890', 'paypal', 175.00),
(7724, 76520, '1414 Path, Town', 'completed', '2024-09-25', 'TX78901', 'credit card', 220.00),
(8294, 81137, '1515 Lane, City', 'completed', '2024-09-30', 'TX89012', 'paypal', 300.00),
(9248, 98621, '1616 Street, Village', 'processing', '2024-10-01', 'TX90123', 'debit card', 180.00),
(1034, 10413, '1717 Avenue, City', 'completed', '2024-10-05', 'TX01234', 'credit card', 250.00);

-- INSERT Data into Return Table
INSERT INTO "Return" (ReturnID, OrderID, OrderItemID, CompletionDate, RequestDate, Status, Reason) VALUES
(1, 17892, 1345, '2024-09-01', '2024-08-25', 'completed', 'Defective item'),
(2, 21539, 3457, '2024-09-10', '2024-09-05', 'completed', 'Wrong size'),
(3, 38730, 5998, '2024-09-20', '2024-09-15', 'processing', 'Product damaged'),
(4, 42581, 7193, '2024-09-25', '2024-09-20', 'completed', 'Not as described'),
(5, 55429, 8116, '2024-09-30', '2024-09-25', 'processing', 'Wrong color'),
(6, 62187, 9053, '2024-10-05', '2024-09-30', 'completed', 'Late delivery'),
(7, 76520, 1067, '2024-10-10', '2024-10-05', 'processing', 'Item faulty'),
(8, 81137, 8116, '2024-10-15', '2024-10-10', 'completed', 'Changed mind'),
(9, 98621, 2672, '2024-10-20', '2024-10-15', 'processing', 'Wrong order'),
(10, 10413, 1345, '2024-10-25', '2024-10-20', 'completed', 'Defective item');

-- INSERT Data into Shipment Table
INSERT INTO Shipment (ShipmentID, OrderID, TrackingNumber, Carrier, ShippingDate, EstimateDeliveryDate, ActualDeliveryDate) VALUES
(1893625, 17892, 'TRACK123', 'FedEx', '2024-08-21', '2024-08-25', '2024-08-23'),
(2290264, 21539, 'TRACK234', 'UPS', '2024-08-26', '2024-08-30', '2024-08-29'),
(3903572, 38730, 'TRACK345', 'DHL', '2024-09-02', '2024-09-06', '2024-09-05'),
(4362462, 42581, 'TRACK456', 'FedEx', '2024-09-11', '2024-09-15', '2024-09-14'),
(5283653, 55429, 'TRACK567', 'UPS', '2024-09-16', '2024-09-20', '2024-09-19'),
(6252382, 62187, 'TRACK678', 'DHL', '2024-09-21', '2024-09-25', '2024-09-24'),
(7019374, 76520, 'TRACK789', 'FedEx', '2024-09-26', '2024-09-30', '2024-09-29'),
(8829337, 81137, 'TRACK890', 'UPS', '2024-10-01', '2024-10-05', '2024-10-04'),
(9013648, 98621, 'TRACK901', 'DHL', '2024-10-06', '2024-10-10', '2024-10-09'),
(1018374, 10413, 'TRACK012', 'FedEx', '2024-10-11', '2024-10-15', '2024-10-14');

-- INSERT Data into LoyaltyProgram Table
INSERT INTO LoyaltyProgram (LoyaltyID, UserID, PointsEarned, DateEarned) VALUES
(1, 1, 50, '2024-08-20'),
(2, 3, 60, '2024-08-25'),
(3, 4, 40, '2024-09-01'),
(4, 6, 70, '2024-09-10'),
(5, 7, 80, '2024-09-15'),
(6, 9, 75, '2024-09-20'),
(7, 10, 85, '2024-09-25'),
(8, 8, 100, '2024-09-30'),
(9, 2, 90, '2024-10-01'),
(10, 5, 95, '2024-10-05');


