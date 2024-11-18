delete from OrderItem where OrderID=17892;
delete from OrderItem where OrderID=10413;
select * from OrderItem;

delete from CartItem where CartID=1;
select * from CartItem;

delete from WishlistItem where WishlistID=1;
select * from WishlistItem;

delete from OutfitItem where OutfitID = 1;
select * from OutfitItem;

delete from Payment where OrderID = 17892;
select * from Payment;

delete from Shipment where OrderID = 17892;
select * from Shipment;

delete from "Return" where OrderID = 17892;
delete from "Return" where OrderID = 10413;
select * from "Return";

delete from "Order" where OrderID=17892;
select * from "Order";

delete from Cart where CartID=1;
select * from Cart;

delete Wishlist where WishlistID=1;
select * from Wishlist;

delete from Outfit where OutfitID=1;
select * from Outfit;

delete from UserActivity where UserID=1
select * from UserActivity;

delete from Review where UserID=1;
select * from Review;

delete from LoyaltyProgram where UserId=1;
select * from LoyaltyProgram;

delete from Category where CategoryID = 1;
select * from Category;

delete from SustainabilityMetric where BrandID=1;
select * from SustainabilityMetric;

delete from Inventory where ProductID=1345;
select * from Inventory;

delete from AccessoryItem where ProductID = 1345;
delete from ClothingItem where ProductID = 1345;
select * from AccessoryItem;
select * from ClothingItem;

delete from ProductColors where ProductID=1345 AND BrandID=1;
select * from ProductColors;

delete from Product where ProductID=1345;
select * from Product;

Delete from "User" where UserID = 1;
select * from "User";
