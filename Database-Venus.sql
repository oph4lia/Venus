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
    ProductID INT PRIMARY KEY,
    BrandID INT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2),
    Material VARCHAR(100),
    StockQuality INT,
    DateAdded DATE,
    LastUpdated DATE,
    AverageRating DECIMAL(3, 2),
    Weight DECIMAL(5, 2),
    RefCategory VARCHAR(50),
    AvailableSizes VARCHAR(100),
    Colors VARCHAR(100),
    Dimensions VARCHAR(100),
    WaistWidth DECIMAL(5, 2),
    ChestWidth DECIMAL(5, 2),
    ShoulderWidth DECIMAL(5, 2),
    SleeveLength DECIMAL(5, 2),
    TotalLength DECIMAL(5, 2),
    Type VARCHAR(20),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
);

CREATE TABLE ClothingItem (
    ProductID INT PRIMARY KEY,
    ClothType VARCHAR(50),
	Type VARCHAR(20),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CHECK (Type in ('clothing'))
);

CREATE TABLE AccessoryItem (
    ProductID INT PRIMARY KEY,
    AccessoryType VARCHAR(50),
	Type VARCHAR(20),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CHECK (Type in ('accessory'))
);


CREATE TABLE SustainabilityMetric (
    MetricID INT PRIMARY KEY,
    MetricType VARCHAR(100),
    Value DECIMAL(10, 2),
    ProductID INT,
    BrandID INT,
    BrandUnit VARCHAR(50),
    ProductUnit VARCHAR(50),
    MeasurementData TEXT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
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
    Quantity INT,
    LastUpdated DATE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE "User" (
    UserID INT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL,
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
    Timestamp TIMESTAMP,
    Details TEXT,
    ActivityType VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
);

CREATE TABLE Cart (
    CartID INT PRIMARY KEY,
    UserID INT,
    CreatedAt TIMESTAMP,
    UpdatedAt TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES "User"(UserID)
);

CREATE TABLE CartItem (
    CartID INT,
    ProductID INT,
    Quantity INT,
    AddedAt TIMESTAMP,
    PRIMARY KEY (CartID, ProductID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Wishlist (
    WishlistID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    CreatedAt TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES "User"(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE WishlistItem (
    WishlistItemID INT PRIMARY KEY,
    WishlistID INT,
    ProductID INT,
    AddedAt TIMESTAMP,
    FOREIGN KEY (WishlistID) REFERENCES Wishlist(WishlistID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    ReviewDate DATE,
    Rating DECIMAL(2, 1),
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES "User"(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Outfit (
    OutfitID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    CreatedAt TIMESTAMP,
    UpdatedAt TIMESTAMP,
    Description TEXT,
    Name VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES "User"(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE OutfitItem (
    OutfitID INT PRIMARY KEY,
    ProductID INT,
    FOREIGN KEY (OutfitID) REFERENCES Outfit(OutfitID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE "Order" (
    OrderID INT PRIMARY KEY,
    UserID INT UNIQUE,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    BillingAddress TEXT,
    ShippingAddress TEXT,
    Status VARCHAR(50),
    ProductID INT UNIQUE,
    FOREIGN KEY (UserID) REFERENCES "User"(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE OrderItem (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PriceAtPurchase DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
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
    OrderID INT,
    CompletionDate DATE,
    RequestDate DATE,
    Status VARCHAR(50),
    Reason TEXT,
    ProductID INT,
    UserID INT,
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID),
    FOREIGN KEY (ProductID) REFERENCES "Order"(ProductID),
    FOREIGN KEY (UserID) REFERENCES "Order"(UserID)
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
    InventoryID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    Quantity INT,
    LastUpdated DATE,
    FOREIGN KEY (UserID) REFERENCES "User"(UserID),
    FOREIGN KEY (ProductID) REFERENCES "Order"(ProductID)
);