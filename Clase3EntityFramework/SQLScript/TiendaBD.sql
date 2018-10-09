CREATE TABLE Categories(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
)
CREATE INDEX CategoryNameIndex ON Categories(Name);

CREATE TABLE Products(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Price FLOAT NULL,
)
CREATE INDEX ProductsNameIndex ON Products(Name);

CREATE TABLE Customers(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Sex CHAR(1) NOT NULL,
    BirthDay DATE NOT NULL,
    Address NVARCHAR(MAX) NOT NULL,
    AddressLocation GEOGRAPHY NOT NULL,
)
CREATE INDEX CustomersNameIndex ON Customers(Name);
CREATE SPATIAL INDEX CustomersAddressLocationIndex ON Customers(AddressLocation);

CREATE TABLE Orders(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    RegistrationDate DATETIME NOT NULL,
    CustomerId INT NOT NULL,
    Total FLOAT NOT NULL,
   FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
)
CREATE INDEX OrdersCustomerIdIndex ON Orders(CustomerId);

CREATE TABLE OrderDetails(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    UnitPrice FLOAT NOT NULL,
    Amount INT NOT NULL,
   FOREIGN KEY (OrderId) REFERENCES Orders(Id),
   FOREIGN KEY (ProductId) REFERENCES Products(Id)
)
CREATE INDEX OrderDetailsOrderIdIndex ON OrderDetails(OrderId);
CREATE INDEX OrderDetailsProductIdIndex ON OrderDetails(ProductId);

CREATE TABLE ProductsCategoriesRelation(
    CategoryId INT NOT NULL ,
    ProductId INT NOT NULL,
   FOREIGN KEY (ProductId) REFERENCES Products(Id),
   FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
    PRIMARY KEY (CategoryId, ProductId)
)
