-- Add ON DELETE and ON UPDATE clauses to foreign key constraints

-- Product table
ALTER TABLE Product
DROP CONSTRAINT IF EXISTS Product_BrandID_fkey;

ALTER TABLE Product
ADD CONSTRAINT Product_BrandID_fkey
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
    ON DELETE SET NULL;  -- Changed from SET NULL to NO ACTION

-- ProductColors table
ALTER TABLE ProductColors
DROP CONSTRAINT IF EXISTS ProductColors_ProductID_fkey;

ALTER TABLE ProductColors
ADD CONSTRAINT ProductColors_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE CASCADE;

-- ClothingItem and AccessoryItem tables
ALTER TABLE ClothingItem
DROP CONSTRAINT IF EXISTS ClothingItem_ProductID_fkey;

ALTER TABLE ClothingItem
ADD CONSTRAINT ClothingItem_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE CASCADE;

ALTER TABLE AccessoryItem
DROP CONSTRAINT IF EXISTS AccessoryItem_ProductID_fkey;

ALTER TABLE AccessoryItem
ADD CONSTRAINT AccessoryItem_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE CASCADE;

-- SustainabilityMetric table
ALTER TABLE SustainabilityMetric
DROP CONSTRAINT IF EXISTS SustainabilityMetric_ProductID_fkey;

ALTER TABLE SustainabilityMetric
ADD CONSTRAINT SustainabilityMetric_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE NO ACTION;

ALTER TABLE SustainabilityMetric
DROP CONSTRAINT IF EXISTS SustainabilityMetric_BrandID_fkey;

ALTER TABLE SustainabilityMetric
ADD CONSTRAINT SustainabilityMetric_BrandID_fkey
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
    ON DELETE NO ACTION;

-- Category table (self-referencing foreign key)
ALTER TABLE Category
DROP CONSTRAINT IF EXISTS Category_ParentCategoryID_fkey;

ALTER TABLE Category
ADD CONSTRAINT Category_ParentCategoryID_fkey
    FOREIGN KEY (ParentCategoryID) REFERENCES Category(CategoryID)
    ON DELETE NO ACTION;

-- Inventory table
ALTER TABLE Inventory
DROP CONSTRAINT IF EXISTS Inventory_ProductID_fkey;

ALTER TABLE Inventory
ADD CONSTRAINT Inventory_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE NO ACTION;

-- UserActivity, Cart, Wishlist tables
ALTER TABLE UserActivity
DROP CONSTRAINT IF EXISTS UserActivity_UserID_fkey;

ALTER TABLE UserActivity
ADD CONSTRAINT UserActivity_UserID_fkey
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
    ON DELETE NO ACTION;

ALTER TABLE Cart
DROP CONSTRAINT IF EXISTS Cart_UserID_fkey;

ALTER TABLE Cart
ADD CONSTRAINT Cart_UserID_fkey
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
    ON DELETE NO ACTION;

ALTER TABLE Wishlist
DROP CONSTRAINT IF EXISTS Wishlist_UserID_fkey;

ALTER TABLE Wishlist
ADD CONSTRAINT Wishlist_UserID_fkey
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
    ON DELETE NO ACTION;

-- CartItem and WishlistItem tables
ALTER TABLE CartItem
DROP CONSTRAINT IF EXISTS CartItem_CartID_fkey;

ALTER TABLE CartItem
ADD CONSTRAINT CartItem_CartID_fkey
    FOREIGN KEY (CartID) REFERENCES Cart(CartID)
    ON DELETE NO ACTION;

ALTER TABLE CartItem
DROP CONSTRAINT IF EXISTS CartItem_ProductID_fkey;

ALTER TABLE CartItem
ADD CONSTRAINT CartItem_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE NO ACTION;

ALTER TABLE WishlistItem
DROP CONSTRAINT IF EXISTS WishlistItem_WishlistID_fkey;

ALTER TABLE WishlistItem
ADD CONSTRAINT WishlistItem_WishlistID_fkey
    FOREIGN KEY (WishlistID) REFERENCES Wishlist(WishlistID)
    ON DELETE NO ACTION;

ALTER TABLE WishlistItem
DROP CONSTRAINT IF EXISTS WishlistItem_ProductID_fkey;

ALTER TABLE WishlistItem
ADD CONSTRAINT WishlistItem_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE SET NULL;

-- Review table
ALTER TABLE Review
DROP CONSTRAINT IF EXISTS Review_UserID_fkey;

ALTER TABLE Review
ADD CONSTRAINT Review_UserID_fkey
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
    ON DELETE NO ACTION;

ALTER TABLE Review
DROP CONSTRAINT IF EXISTS Review_ProductID_fkey;

ALTER TABLE Review
ADD CONSTRAINT Review_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE NO ACTION;

-- Outfit and OutfitItem tables
ALTER TABLE Outfit
DROP CONSTRAINT IF EXISTS Outfit_UserID_fkey;

ALTER TABLE Outfit
ADD CONSTRAINT Outfit_UserID_fkey
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
    ON DELETE NO ACTION;

ALTER TABLE OutfitItem
DROP CONSTRAINT IF EXISTS OutfitItem_OutfitID_fkey;

ALTER TABLE OutfitItem
ADD CONSTRAINT OutfitItem_OutfitID_fkey
    FOREIGN KEY (OutfitID) REFERENCES Outfit(OutfitID)
    ON DELETE NO ACTION;

ALTER TABLE OutfitItem
DROP CONSTRAINT IF EXISTS OutfitItem_ProductID_fkey;

ALTER TABLE OutfitItem
ADD CONSTRAINT OutfitItem_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE NO ACTION;

-- Order table
ALTER TABLE "Order"
DROP CONSTRAINT IF EXISTS Order_UserID_fkey;

ALTER TABLE "Order"
ADD CONSTRAINT Order_UserID_fkey
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
    ON DELETE SET NULL;

-- OrderItem table
ALTER TABLE OrderItem
DROP CONSTRAINT IF EXISTS OrderItem_OrderID_fkey;

ALTER TABLE OrderItem
ADD CONSTRAINT OrderItem_OrderID_fkey
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID)
    ON DELETE NO ACTION;

ALTER TABLE OrderItem
DROP CONSTRAINT IF EXISTS OrderItem_ProductID_fkey;

ALTER TABLE OrderItem
ADD CONSTRAINT OrderItem_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE NO ACTION;

-- Payment table
ALTER TABLE Payment
DROP CONSTRAINT IF EXISTS Payment_OrderID_fkey;

ALTER TABLE Payment
ADD CONSTRAINT Payment_OrderID_fkey
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID)
    ON DELETE NO ACTION;

-- Return table
ALTER TABLE "Return"
DROP CONSTRAINT IF EXISTS Return_OrderID_fkey;

ALTER TABLE "Return"
ADD CONSTRAINT Return_OrderID_fkey
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID)
    ON DELETE NO ACTION;

ALTER TABLE "Return"
DROP CONSTRAINT IF EXISTS Return_ProductID_fkey;

ALTER TABLE "Return"
ADD CONSTRAINT Return_ProductID_fkey
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    ON DELETE NO ACTION;

-- Shipment table
ALTER TABLE Shipment
DROP CONSTRAINT IF EXISTS Shipment_OrderID_fkey;

ALTER TABLE Shipment
ADD CONSTRAINT Shipment_OrderID_fkey
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID)
    ON DELETE NO ACTION;

-- LoyaltyProgram table
ALTER TABLE LoyaltyProgram
DROP CONSTRAINT IF EXISTS LoyaltyProgram_UserID_fkey;

ALTER TABLE LoyaltyProgram
ADD CONSTRAINT LoyaltyProgram_UserID_fkey
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
    ON DELETE NO ACTION;

ALTER TABLE LoyaltyProgram
DROP CONSTRAINT IF EXISTS LoyaltyProgram_OrderID_fkey;

ALTER TABLE LoyaltyProgram
ADD CONSTRAINT LoyaltyProgram_OrderID_fkey
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID)
    ON DELETE SET NULL;