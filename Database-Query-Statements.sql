--Brand Table
--Update: Change the name of the brand with BrandID = 1
UPDATE Brand SET Name = 'EcoWear Updated' WHERE BrandID = 1;
--Query
SELECT * FROM Brand WHERE FoundedYear > 2015;

--Product Table
--Update: Update the price of the product with ProductID = 2672
UPDATE Product SET Price = 55.99 WHERE ProductID = 2672;
--Query
SELECT * FROM Product WHERE AverageRating > 4.5;

--ClothingItem Table
--Update: Update the AvailableSizes for ProductID = 3457
UPDATE ClothingItem SET AvailableSizes='L' WHERE ProductID = 3457;
--Query
SELECT * FROM ClothingItem WHERE BrandID=3;

--Accessory Item
--Update: Change Accessory for ProductID = 5998
UPDATE AccessoryItem SET Type = 'Sustainable Backpack' WHERE ProductID = 5998;
--Query
SELECT * FROM AccessoryItem WHERE Material = 'Organic Wool';

--SustainabilityMetric Table
--Update: Update the value for MetricId = 1
UPDATE SustainabilityMetric SET Value=14.5 WHERE MetricID = 1;
--Query
SELECT * FROM SustainabilityMetric WHERE MetricID > 7;

--Category Table
--Update: Change the name of the category with CategoryID = 2
UPDATE Category SET Name = 'Updated Accessories' WHERE CategoryID=2;
--Query
SELECT * FROM Category WHERE ParentCategoryID IS NOT NULL;

--Inventory Table
--Update: Update the quantity for ProductID = 1345
UPDATE Inventory SET Quantity=120 WHERE ProductID = 1345;
--Query
SELECT * FROm Inventory WHERE Quantity > 50;

--User Table
--Update: Update the email of the user with Name = John
UPDATE "User" SET Email = 'updateuduser1@example.com' WHERE FirstName='John';
--Query
SELECT * FROM "User" WHERE RegistrationDate > '2024-01-01';

--RegularUser Table
--Update: Update the usertype for UserID = 1
UPDATE RegularUser SET UserType = 'admin' where UserID = 1;
--Query
SELECT * FROM RegularUser WHERE UserID < 4;

--AdminUser Table
--Update: Update the usertype for UserID = 2
UPDATE AdminUser SET UserType = 'superadmin' WHERE UserID = 2;
--Query
SELECT * FROM AdminUser Where UserID=8;

--UserActivity Table
--Update: Update the activity details for ActivityID = 1
UPDATE UserActivity SET Details = 'User logged in from new device' WHERE ActivityID=3;
--Query
SELECT * FROM UserActivity WHERE UserID=1;

--Cart Table
--Update: Update the updated timestamp for CartID=1
UPDATE Cart SET UpdatedAt = '2024-11-17 5:00:00' WHERE CartID = 1;
--Query
SELECT * FROM Cart WHERE CreatedAt < '2024-09-01';

--CartItem Table
--Update: Update the quantity for a product in the cart(CartID=1, ProductID=2672)
UPDATE CartItem SET Quantity=3 WHERE CartID=1 AND ProductID=2672;
--Query
SELECT * FROM CartItem WHERE CartID=1;

--Wishlist Table
--Update: Update teh created timestap for WishlistID=1
UPDATE Wishlist SET CreatedAt= '2024-11-17 5:00:00' WHERE WishlistID=1;
--Query
SELECT * FROM Wishlist WHERE CreatedAt < '2024-8-1';

--WishlistItem Table
--Update: Update teh added timestap for wishlistitemID=1
UPDATE WishlistItem SET AddedAt = '2024-11-17 5:00:00' WHERE WishlistItemID = 1;
--Query
SELECT * FROM WishlistItem WHERE WishlistID > 6;

--Review Table
--Update: Update the rating for ReviewID=1
UPDATE Review SET Rating=5.0 WHERE ReviewID=1;
--Query
SELECT * FROM Review WHERE Rating < 4.5;

--Outfit Table
--Update: Update the description for OutfitID=1
UPDATE Outfit SET Description = 'Updated Summer outfit description' WHERE OutfitID=1;
--Query
SELECT * FROM Outfit WHERE CreatedAt > '2024-05-01';

--OutfitItem Table
--Update: Update the outfitID where ProductID=2672;
UPDATE OutfitItem SET OutfitID=1 WHERE ProductID=2672;
--Query
SELECT * FROM OutfitItem WHERE OutfitID < 4;

--Order Table
--Update: Update the status of the order with OrderID=17892
UPDATE "Order" SET Status='delivered' WHERE OrderID=17892;
--Query
SELECT * FROM "Order" WHERE TotalAmount > 180;

--OrderItem Table
--Update: Update the price at purchase for OrderID=17892 and ProductID=1345
UPDATE OrderItem SET PriceAtPurchase=30.00 WHERE OrderID=17892 AND ProductID=1345;
--Query
SELECT * FROM OrderItem WHERE OrderID =21539 ;

--Payment Table
--Update: Update the status for paymentID=1923
UPDATE Payment SET Status = 'processing' WHERE PaymentID=1923;
--Query
SELECT * FROM Payment WHERE PaymentMethod = 'credit card';

--Return Table
--Update: Update the reason for ReturnID=1
UPDATE "Return" SET Reason = 'Wrong size and color' WHERE ReturnID=1;
--Query
SELECT * FROM "Return" WHERE OrderID=17892;

--Shipment Table
--Update: Update teh carrier for ShipmentID=1
UPDATE Shipment SET Carrier = 'DHL' WHERE ShipmentID=1;
--Query
SELECT * FROM Shipment WHERE ActualDeliveryDate < '2024-09-01';

--LoyaltyProgram Table
--Update: Update the points earned for LoyaltyID=1
UPDATE LoyaltyProgram SET PointsEarned=100 WHERE LoyaltyID=1;
--Query
SELECT * FROM LoyaltyProgram WHERE PointsEarned > 75;

--ProductColors
--Update: Update the color of productID=4130
UPDATE ProductColors SET Color='beige' where ProductID=2459;
--Query
SELECT * From ProductColors WHERE Color='black' OR Color='blue';