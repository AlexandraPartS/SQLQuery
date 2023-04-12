CREATE DATABASE productsdb
GO

USE productsdb;

CREATE TABLE Products
(
    Id INT PRIMARY KEY IDENTITY,
    ProductTitle NVARCHAR(50) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
CREATE TABLE Categoryes
(
    Id INT PRIMARY KEY IDENTITY,
    CategoryTitle NVARCHAR(20) NOT NULL,
    CreatedAt Date
);
CREATE TABLE Product_Categoryes
(
    ProductId INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
    CategoryesId INT NOT NULL REFERENCES Categoryes(Id) ON DELETE CASCADE
);


INSERT INTO Products 
VALUES 
(N'Стол LACK', 'IKEA', 20, 36000),
(N'Ковер TIPHEDE', 'IKEA', 1, 41000),
(N'Тумба для ванной комнаты ФИСКОН', 'IKEA', 5, 52000),
(N'Люстра KNAPPA', 'IKEA', 15, 46000),
(N'Ручка Hishult', 'IKEA', 5, 56000)

 
INSERT INTO Categoryes
VALUES
(N'Гостинная', '2022-07-11'),
(N'Спальня', '2022-07-13'),
(N'Кухня', '2022-07-11'),
(N'Ванная', '2022-07-11')

INSERT INTO Product_Categoryes
VALUES
( 
    (SELECT Id FROM Products WHERE ProductTitle=N'Стол LACK'), 
    (SELECT Id FROM Categoryes WHERE CategoryTitle=N'Гостинная')
),
( 
    (SELECT Id FROM Products WHERE ProductTitle=N'Стол LACK'), 
    (SELECT Id FROM Categoryes WHERE CategoryTitle=N'Спальня')
),
( 
    (SELECT Id FROM Products WHERE ProductTitle=N'Стол LACK'), 
    (SELECT Id FROM Categoryes WHERE CategoryTitle=N'Кухня')
),
( 
    (SELECT Id FROM Products WHERE ProductTitle=N'Ковер TIPHEDE'), 
    (SELECT Id FROM Categoryes WHERE CategoryTitle=N'Гостинная')
),
( 
    (SELECT Id FROM Products WHERE ProductTitle=N'Ковер TIPHEDE'), 
    (SELECT Id FROM Categoryes WHERE CategoryTitle=N'Спальня')
),
( 
    (SELECT Id FROM Products WHERE ProductTitle=N'Тумба для ванной комнаты ФИСКОН'), 
    (SELECT Id FROM Categoryes WHERE CategoryTitle=N'Ванная')
),
( 
    (SELECT Id FROM Products WHERE ProductTitle=N'Люстра KNAPPA'), 
    (SELECT Id FROM Categoryes WHERE CategoryTitle=N'Гостинная')
),
( 
    (SELECT Id FROM Products WHERE ProductTitle=N'Люстра KNAPPA'), 
    (SELECT Id FROM Categoryes WHERE CategoryTitle=N'Спальня')
)

SELECT ProductTitle, CategoryTitle
FROM Products
     LEFT JOIN 

     (SELECT CategoryTitle, ProductId
      FROM Categoryes
      JOIN Product_Categoryes
      ON Categoryes.Id = Product_Categoryes.CategoryesId) AS CATEGORYNew

      ON CATEGORYNew.ProductId = Products.Id
