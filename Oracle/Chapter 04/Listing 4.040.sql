SELECT Customers.CustomerID, Customers.CustFirstName, 
  Customers.CustLastName, OFiltered.OrderNumber, 
  OFiltered.OrderDate, OFiltered.OrderTotal
FROM Customers LEFT JOIN 
  (SELECT Orders.OrderNumber, Orders.CustomerID, 
    Orders.OrderDate, Orders.OrderTotal
  FROM Orders
  WHERE Orders.OrderDate BETWEEN CAST('2015-10-01' AS DATE)
    AND CAST('2015-12-31' AS DATE)) AS OFiltered
  ON Customers.CustomerID = OFiltered.CustomerID;
