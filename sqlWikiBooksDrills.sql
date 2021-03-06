-- Select the names of all the products in the store.
SELECT Name FROM Products;

-- Select the names and the prices of all the products in the store.
SELECT Name, Price FROM Products;

-- Select the name of the products with a price less than or equal to $200.
SELECT Name, Price FROM Products WHERE Price <= 200;

-- Select all the products with a price between $60 and $120
SELECT Name, Price FROM Products 
    WHERE Price <= 120 and Price >=60;

-- Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT Name, Price * 100 FROM Products;

-- Compute the average price of all the products.
SELECT AVG(Price) FROM Products;

-- Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price) FROM Products WHERE Manufacturer=2;

-- Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) FROM Products WHERE Price >= 180;

-- Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT Name, Price FROM Products
    WHERE Price >= 180
    ORDER BY Price DESC, Name;
    
-- Select all the data from the products, including all the data for each product's manufacturer.
 /* Without INNER JOIN */
 SELECT * FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code;

 /* With INNER JOIN */
 SELECT *
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code;
   
-- Select the product name, price, and manufacturer name of all the products.
/* Without INNER JOIN */
 SELECT Products.Name, Price, Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code;

 /* With INNER JOIN */
 SELECT Products.Name, Price, Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code;
   
-- Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(Price), Manufacturer
    FROM Products
    GROUP BY Manufacturer;
    
-- Select the average price of each manufacturer's products, showing the manufacturer's name.
 /* Without INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name;
 
 /* With INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name;
   
-- Select the names of manufacturer whose products have an average price larger than or equal to $150.
 /* Without INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name
   HAVING AVG(Price) >= 150;
 
 /* With INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name
   HAVING AVG(Price) >= 150;
   
-- Select the name and price of the cheapest product.
SELECT name,price
  FROM Products
  ORDER BY price ASC
  LIMIT 1

/* With a nested SELECT */
SELECT Name, Price
    FROM Products
    WHERE Price = (SELECT MIN(Price) FROM Products);
    
-- Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT Products.Name, MAX(Price), Manufacturers.Name
 FROM Products, Manufacturers
 WHERE Manufacturer = Manufacturers.Code
 GROUP BY Manufacturers.Name;
 
-- Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO Products( Name , Price , Manufacturer)
  VALUES ( 'Loudspeakers' , 70 , 2 );
  
-- Update the name of product 8 to "Laser Printer".
UPDATE Products
   SET Name = 'Laser Printer'
   WHERE Code = 8;
   
-- Apply a 10% discount to all products.
UPDATE Products
    SET Price = Price * 0.9;
    
-- Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE Products
   SET Price = Price * 0.9
   WHERE Price >= 120;