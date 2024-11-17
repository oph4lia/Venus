-- Existing tables with modifications
CREATE TABLE Brand (
    BrandID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    FoundedYear INT,
    Website VARCHAR(255),
    Logo VARCHAR(255),
    AverageSustainabilityScore DECIMAL(3, 2)
);

CREATE TABLE Product (
    ProductID INT,
    BrandID INT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2),
    Material VARCHAR(100),
    StockQuantity INT,
    DateAdded DATE,
    LastUpdated DATE,
    AverageRating DECIMAL(3, 2),
    Weight DECIMAL(5, 2),
    RefCategory VARCHAR(50),
    PRIMARY KEY (ProductID, BrandID),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
);


CREATE TABLE ProductColors (
    ProductID INT,
    BrandID INT,
    Color VARCHAR(50),
    PRIMARY KEY (ProductID, BrandID, Color),
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);



CREATE TABLE ClothingItem (
    ProductID INT,
    BrandID INT,
    AvailableSizes VARCHAR(100),
    Dimensions VARCHAR(100),
    WaistWidth DECIMAL(5, 2),
    ChestWidth DECIMAL(5, 2),
    ShoulderWidth DECIMAL(5, 2),
    SleeveLength DECIMAL(5, 2),
    TotalLength DECIMAL(5, 2),
    PRIMARY KEY (ProductID, BrandID),
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);


CREATE TABLE AccessoryItem (
    ProductID INT,
    BrandID INT,
    Type VARCHAR(50), -- e.g., jewelry, belt, bag
    Material VARCHAR(100),
    PRIMARY KEY (ProductID, BrandID),
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);


-- Remaining tables (unchanged)
CREATE TABLE SustainabilityMetric (
    MetricID INT PRIMARY KEY,
    MetricType VARCHAR(100),
    Value DECIMAL(10, 2),
    ProductID INT,
    BrandID INT,
    BrandUnit VARCHAR(50),
    ProductUnit VARCHAR(50),
    MeasurementData TEXT,
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
	BrandID INT,
    Quantity INT,
    LastUpdated DATE,
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);

CREATE TABLE "User" (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(255) UNIQUE NOT NULL,
    TotalSpent DECIMAL(10, 2),
    Password VARCHAR(255) NOT NULL,
    RegistrationDate DATE,
    DOB DATE,
    PhoneNumber VARCHAR(15),
    LastName VARCHAR(100),
    FirstName VARCHAR(100),
    UserType VARCHAR(20),
    LastLoginDate DATE
);

CREATE TABLE RegularUser (
    UserID INT PRIMARY KEY,
    UserType VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES "User"(UserID),
    CHECK (UserType in ('regular'))
);

CREATE TABLE AdminUser (
    UserID INT PRIMARY KEY,
    UserType VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES "User"(UserID),
    CHECK (UserType in ('admin'))
);

CREATE TABLE UserActivity (
    ActivityID INT PRIMARY KEY,
    UserID INT,
    LogTime DATETIME,
    Details TEXT,
    ActivityType VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
);

CREATE TABLE Cart (
    CartID INT PRIMARY KEY,
    UserID INT,
    CreatedAt DATETIME,
    UpdatedAt DATETIME,
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
);

CREATE TABLE CartItem (
    CartID INT,
    ProductID INT,
	BrandID INT,
    Quantity INT,
    AddedAt DATETIME,
    PRIMARY KEY (CartID, ProductID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);

CREATE TABLE Wishlist (
    WishlistID INT PRIMARY KEY,
    UserID INT,
    CreatedAt DATETIME,
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
);

CREATE TABLE WishlistItem (
    WishlistItemID INT PRIMARY KEY,
    WishlistID INT,
    ProductID INT,
	BrandID INT,
    AddedAt DATETIME,
    FOREIGN KEY (WishlistID) REFERENCES Wishlist(WishlistID),
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
	BrandID INT,
    ReviewDate DATE,
    Rating DECIMAL(2, 1),
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES "User"(UserID),
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);

CREATE TABLE Outfit (
    OutfitID INT PRIMARY KEY,
    UserID INT,
    CreatedAt DATETIME,
    UpdatedAt DATETIME,
    Description TEXT,
    Name VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
);

CREATE TABLE OutfitItem (
    OutfitID INT,
    ProductID INT,
	BrandID INT,
    PRIMARY KEY (OutfitID, ProductID),
    FOREIGN KEY (OutfitID) REFERENCES Outfit(OutfitID),
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);

CREATE TABLE "Order" (
    OrderID INT PRIMARY KEY,
    UserID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    BillingAddress TEXT,
    ShippingAddress TEXT,
    Status VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
);

CREATE TABLE OrderItem (
    OrderID INT,
    ProductID INT,
    BrandID INT,
    OrderItem INT IDENTITY(1,1) PRIMARY KEY,
    Quantity INT,
    PriceAtPurchase DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID),
    FOREIGN KEY (ProductID, BrandID) REFERENCES Product(ProductID, BrandID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Address TEXT,
    Status VARCHAR(50),
    PaymentDate DATE,
    TransactionID VARCHAR(255),
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID)
);

CREATE TABLE "Return" (
    ReturnID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    OrderItemID INT NOT NULL,
    RequestDate DATE,
    CompletionDate DATE,
    Status VARCHAR(50),
    Reason TEXT,
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID),
    FOREIGN KEY (OrderItemID) REFERENCES OrderItem(OrderItemID)
);

CREATE TABLE Shipment (
    ShipmentID INT PRIMARY KEY,
    OrderID INT,
    TrackingNumber VARCHAR(255),
    Carrier VARCHAR(100),
    ShippingDate DATE,
    EstimateDeliveryDate DATE,
    ActualDeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID)
);

CREATE TABLE LoyaltyProgram (
    LoyaltyID INT PRIMARY KEY,
    UserID INT,
    OrderID INT,
    PointsEarned INT,
    DateEarned DATE,
    FOREIGN KEY (UserID) REFERENCES "User"(UserID),
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID)
);
