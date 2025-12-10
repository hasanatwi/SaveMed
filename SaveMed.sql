create database SaveMed;
	Use SaveMed
	CREATE TABLE Users (
		UserID INT not null,
		Username VARCHAR(50),
		Email VARCHAR(50),
		Password VARCHAR(50),
		UserType VARCHAR(50)
		Primary key(UserID)
	)

	CREATE TABLE Medications (
		MedicationID INT NOT NULL PRIMARY KEY,
		Name VARCHAR(50),
		Description varchar(50),
		ExpiryDate DATE,
		Price int,
		DosageStrength VARCHAR(50),
		Donated VARCHAR(3),
		UserID INT,
		TherapeuticClass VARCHAR(100),
		 OverTheCounter VARCHAR(3),
		 Discontinued VARCHAR(3),
		FOREIGN KEY (UserID) REFERENCES Users(UserID)
	);

	CREATE TABLE Transactions (
		TransactionID INT NOT NULL PRIMARY KEY,
		BuyerID INT,
		SellerID INT,
		MedicationID INT,
		TransactionDate DATE,
		TransactionAmount INT,
		ShippingDate Date,
		FOREIGN KEY (BuyerID) REFERENCES Users(UserID),
		FOREIGN KEY (SellerID) REFERENCES Users(UserID),
		FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
	);

	CREATE TABLE Pharmacies (
		PharmacyID INT NOT NULL PRIMARY KEY,
		Name VARCHAR(50),
		Location VARCHAR(50),
		UserID INT,
		SameDayDelivery VARCHAR(3), 
		FOREIGN KEY (UserID) REFERENCES Users(UserID)
	);
	CREATE TABLE Orders (
		OrderID INT NOT NULL PRIMARY KEY,
		BuyerID INT,
		SellerID INT,
		MedicationID INT,
		OrderDate DATE,
		ShippingDate DATE,
		Status VARCHAR(50),
		FOREIGN KEY (BuyerID) REFERENCES Users(UserID),
		FOREIGN KEY (SellerID) REFERENCES Users(UserID),
		FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
	);
	CREATE TABLE Policies (
		PolicyID INT PRIMARY KEY,
		PolicyType VARCHAR(50),
		PolicyDescription TEXT
	);
	CREATE TABLE SellerReviews (
		ReviewID INT PRIMARY KEY,
		SellerID INT,
		Rating INT,
		ReviewText TEXT,
		FOREIGN KEY (SellerID) REFERENCES Users(UserID)
	);
	CREATE TABLE PharmacyReviews (
		ReviewID INT PRIMARY KEY,
		PharmacyID INT,
		Rating INT,
		ReviewText TEXT,
		FOREIGN KEY (PharmacyID) REFERENCES Pharmacies(PharmacyID)
	);
	INSERT INTO Users (UserID, Username, Email, Password, UserType)
	VALUES 
		(4, 'Omar', 'omar@gmail.com', 'Gh231123', 'Client'),
		(5, 'Mohammad', 'mohammad@gmail.com', 'sharif456', 'Supplier'),
		(6, 'Hasan', 'hasan@gmail.com', 'atwi2312414', 'Pharmacy')

	INSERT INTO Medications (MedicationID, Name, Description, ExpiryDate, Price, DosageStrength, UserID, Donated, TherapeuticClass, OverTheCounter, Discontinued)
	VALUES
		(7, 'Medicine A', 'This is Medicine A', '2027-06-01', 10.50, '50mg', 4, 'No', 'TherapeuticClass1', 'Yes', 'No'),
		(8, 'Medicine B', 'This is Medicine B', '2025-07-01', 15.75, '100mg', 5, 'Yes', 'TherapeuticClass2', 'No', 'Yes'),
		(9, 'Medicine C', 'This is Medicine C', '2028-08-01', 20.00, '200mg', 6, 'No', 'TherapeuticClass3', 'Yes', 'No');

	INSERT INTO Transactions (TransactionID, BuyerID, SellerID, MedicationID, TransactionDate, ShippingDate, TransactionAmount)
	VALUES
		(1 ,4, 4, 7, '2024-04-20', '2024-04-22', 10.50), 
		(2, 5, 5, 8, '2024-04-21', '2024-04-23', 20.00);

	INSERT INTO Pharmacies (PharmacyID, Name, Location, UserID, SameDayDelivery)
	VALUES
		(3, 'Mazens Pharmacy', 'mazraa St', 4, 'Yes'),
		(4, 'al sharif Pharmacy Y', '456 Elm St', 5, 'No');

		INSERT INTO Orders (OrderID, BuyerID, SellerID, MedicationID, OrderDate, ShippingDate, Status)
	VALUES
		(1, 4, 5, 7, '2024-04-20', '2024-04-22', 'In Transit'),
		(2, 5, 6, 8, '2024-04-21', '2024-04-23', 'Delivered');

	INSERT INTO Policies (PolicyID, PolicyType, PolicyDescription)
	VALUES
		(1, 'Medication', 'Our refund policy allows customers to return medications within 30 days of purchase for a full refund.'),
		(2, 'Shipping', 'We offer free shipping on all orders over $50. For orders below $50, a flat shipping fee of $5 applies.'),
		(3, 'Privacy', 'We are committed to protecting your privacy. We do not share your personal information with third parties.'),
		(4, 'Returns', 'If you are not satisfied with your purchase, you may return it within 14 days for store credit.');

	INSERT INTO Users (UserID, Username, Email, Password, UserType)
	VALUES 
		(7, 'Sarah', 'sarah@example.com', 'password123', 'Client'),
		(8, 'Emily', 'emily@example.com', 'securepass', 'Supplier'),
		(9, 'Michael', 'michael@example.com', 'pass1234', 'Pharmacy'),
		(10, 'John', 'john@example.com', 'johnpass', 'Client'),
		(11, 'Alice', 'alice@example.com', 'alicepass', 'Supplier'),
		(12, 'Emma', 'emma@example.com', 'password123', 'Client'),
		(13, 'David', 'david@example.com', 'securepass', 'Supplier'),
		(14, 'Sophia', 'sophia@example.com', 'pass1234', 'Pharmacy'),
		(15, 'James', 'james@example.com', 'jamespass', 'Client'),
		(16, 'Olivia', 'olivia@example.com', 'oliviapass', 'Supplier'),
		(17, 'William', 'william@example.com', 'williampass', 'Pharmacy'),
		(18, 'Ava', 'ava@example.com', 'password123', 'Client'),
		(19, 'Ethan', 'ethan@example.com', 'securepass', 'Supplier'),
		(20, 'Isabella', 'isabella@example.com', 'pass1234', 'Pharmacy');
	INSERT INTO SellerReviews (ReviewID, SellerID, Rating, ReviewText)
	VALUES
		(1, 4, 5, 'Highly recommended seller! The item arrived in perfect condition.'),
		(2, 5, 4, 'Good experience overall. Will buy again from this seller.'),
		(3, 6, 2, 'Disappointed with the product quality. Expected better.');
		INSERT INTO SellerReviews (ReviewID, SellerID, Rating, ReviewText)
	VALUES
		 (4, 8, 5, 'Highly recommended seller! The item arrived in perfect condition.'),
		(5, 10, 4, 'Good experience overall. Will buy again from this seller.');
	--number 1
		SELECT *
	FROM Medications;

	--number 2
	SELECT *
	FROM Medications
	WHERE Name = 'panadol';

	--number 3
	SELECT COUNT(DISTINCT UserID)
	FROM Users
	WHERE UserType = 'Seller'; 

	--number 4
	SELECT AVG(Price) AS AveragePrice
	FROM Medications;

	--number 5
	SELECT DISTINCT PharmacyID, Name
	FROM Pharmacies;

	--number 6
	SELECT *
	FROM Medications
	WHERE ExpiryDate>=GetDate();

	--number 7
	SELECT COUNT(*)
	FROM Transactions
	WHERE TransactionDate >= DATEADD(MONTH, -1, GETDATE());

	--number 8
	SELECT TOP 10 M.MedicationID, M.Name, COUNT(*) AS SalesCount
	FROM Transactions T
	JOIN Medications M ON T.MedicationID = M.MedicationID
	GROUP BY M.MedicationID, M.Name
	ORDER BY SalesCount DESC;

	--number 9
	SELECT COUNT(*)
	FROM Users
	WHERE UserType = 'Buyer'; 

	--number 10
	SELECT SUM(TransactionAmount) AS TotalRevenue
	FROM Transactions
	WHERE YEAR(TransactionDate) = YEAR(GetDATE()); 

	--number 11
	SELECT Username, Email
	FROM Users
	WHERE UserType = 'Seller'; 

	--number 12
	SELECT DISTINCT M.UserID, U.Username
	FROM Transactions T
	JOIN Medications M ON T.MedicationID = M.MedicationID
	JOIN Users U ON M.UserID = U.UserID
	WHERE T.TransactionAmount >= 100;

	--number 13
	SELECT COUNT(*)
	FROM Medications M
	JOIN Pharmacies P ON M.UserID = P.UserID
	WHERE P.Location = 'hamra';

	--number 14
	SELECT *
	FROM Medications
	WHERE DosageStrength = 'YourDosageStrength'; 

	--number 15
	SELECT AVG(DATEDIFF(day, TransactionDate, ShippingDate)) AS AverageShippingTime
	FROM Transactions
	WHERE ShippingDate IS NOT NULL;

	--number 16
	SELECT COUNT(*)
	FROM Medications
	WHERE Price <= 0;

	--number 17
	SELECT COUNT(*)
	FROM Pharmacies
	WHERE SameDayDelivery = 'Yes'; 

	--number 18
	SELECT COUNT(*)
	FROM Orders
	WHERE Status = 'In Transit'; 

	--number 19
	SELECT COUNT(*)
	FROM Medications
	WHERE Donated = 'Yes'; 


	--number 20
	SELECT COUNT(*)
	FROM Medications
	WHERE UserID IN (SELECT UserID FROM Pharmacies);

	--number 21
	SELECT COUNT(*)
	FROM Medications
	WHERE TherapeuticClass = 'YourTherapeuticClass'; 

	--number 22
	SELECT COUNT(DISTINCT UserID)
	FROM Medications
	WHERE OverTheCounter = 'Yes'; 

	--number 23
	SELECT PolicyDescription AS RefundPolicy
	FROM Policies
	WHERE PolicyType = 'Medication';

	--number 24
	SELECT COUNT(*)
	FROM Medications
	WHERE Discontinued = 'Yes';

	--number 25
	SELECT AVG(Rating) AS AverageRating, COUNT(*) AS NumberOfReviews
	FROM SellerReviews;
	Use SaveMed;
	--number 26:
	SELECT m.MedicationID, m.Name,sr.Rating
FROM Medications m
JOIN Users u ON m.UserID = u.UserID
JOIN SellerReviews sr ON u.UserID = sr.SellerID
WHERE sr.Rating = (
    SELECT MAX(Rating)
    FROM SellerReviews
);
--number 27:
select count(*) as 'the number of users who have registered as suppliers on SaveMed:'from Users as u
where u.UserType='Supplier';
--number 28:
select sum(m.Price) as 'total inventory value of medications listed by pharmacies' from Medications as m
join Users u on m.UserID=u.UserID
join Pharmacies p on u.UserID=p.UserID

select * from Medications;

--number 29:
SELECT *,
    CASE
        WHEN DosageStrength < '100mg' THEN 'Less than 100mg'
        WHEN DosageStrength < '200mg' THEN 'Less than 200mg'
        ELSE 'Others'
    END AS DosageCategory
FROM Medications;

select * from PharmacyReviews;
select * from Users;
INSERT INTO Pharmacies (PharmacyID, Name, Location, UserID, SameDayDelivery)
VALUES 
(1, 'ABC Pharmacy', '123 Main St', 7, 'Yes');
INSERT INTO Pharmacies (PharmacyID, Name, Location, UserID, SameDayDelivery)
VALUES (2, 'XYZ Pharmacy', '456 Elm St', 8, 'No');


INSERT INTO Pharmacies (PharmacyID, Name, Location, UserID, SameDayDelivery)
VALUES (10, 'MNO Pharmacy', '789 Oak St', 9, 'Yes');

INSERT INTO Pharmacies (PharmacyID, Name, Location, UserID, SameDayDelivery)
VALUES (11, 'Sunset Pharmacy', '321 Maple Ave', 10, 'Yes');

INSERT INTO Pharmacies (PharmacyID, Name, Location, UserID, SameDayDelivery)
VALUES (12, 'City Drugstore', '555 Pine St', 11, 'No');

INSERT INTO Pharmacies (PharmacyID, Name, Location, UserID, SameDayDelivery)
VALUES (6, 'Central Pharmacy', '777 Broadway', 12, 'Yes');

select * from Pharmacies;



--number 30:
select count(*) as 'number of pharmacies which offer the Same day delivery service'  from Pharmacies where SameDayDelivery='Yes';

--number 31:
select * from Medications where len(Name)>8;

--number 32:
select avg(Rating) as 'the average of the ratings',count(*) as 'the number of ratings' from SellerReviews;

--number 33:
select  avg(m.Price) as 'the average shipping cost for medications purchased form sellers ' from Medications as m
join Users u on u.UserID=m.UserID
join SellerReviews sr on u.UserID=sr.SellerID;

--number 34:
select m.MedicationID,m.Name,m.ExpiryDate from Medications as m
join Users u on m.UserID=u.UserID and u.UserType='Pharmacy'
join Pharmacies p on u.UserID=p.UserID;


--number 35:
select count(*) as 'number of medications recalled by sellers' from Medications as m
join Users u on m.UserID=u.UserID
join SellerReviews sr on u.UserID=sr.SellerID;

--number 36:
select * from Medications as m
where m.UserID=(select UserID from Users where UserName='Emily');

--number 37:
select sum(t.TransactionAmount) as 'the total number of transactions made by Client or Pharmacy' from Transactions as t
join Users u on t.SellerID=u.UserID and (u.UserType='Client' or u.UserType='Pharmacy');

--number 38:
select count(*) as 'total number of medications that have been sold to pharmacies and clients' from Medications as m
join Users u on u.UserID=m.UserID and (u.UserType='Client' or u.UserType='Pharmacy');

--number 39:
select count(*) as 'total number of transactions processed on SaveMed' from Transactions;

--number 40:
select m.* from Medications as m
join Users u on m.UserID=u.UserID
join Pharmacies p on u.UserID=p.UserID and p.Name='Mazens Pharmacy';

--number 41:
select count(*) as 'number of medications available over the counter' from Medications where OverTheCounter='Yes';

--number 42:
select sum(m.Price) as 'total value of medications donated to charitable organizations' from Medications as m
join Users u on m.UserID=u.UserID
join SellerReviews sr on sr.SellerID=u.UserID;

Use SaveMed;
--number 43:
select p.PharmacyID,p.Name from Pharmacies as p
join PharmacyReviews pr on p.PharmacyID=pr.PharmacyID
where pr.Rating=(select max(Rating) from PharmacyReviews);

INSERT INTO PharmacyReviews (ReviewID, PharmacyID, Rating, ReviewText)
VALUES (1, 1, 4, 'Good service and friendly staff.');
INSERT INTO PharmacyReviews (ReviewID, PharmacyID, Rating, ReviewText)
VALUES (2, 1, 5, 'Excellent experience, highly recommended.');
INSERT INTO PharmacyReviews (ReviewID, PharmacyID, Rating, ReviewText)
VALUES (3, 2, 3, 'Average service, could be better.');
INSERT INTO PharmacyReviews (ReviewID, PharmacyID, Rating, ReviewText)
VALUES (4, 2, 2, 'Disappointing experience, won''t visit again.');
INSERT INTO PharmacyReviews (ReviewID, PharmacyID, Rating, ReviewText)
VALUES (5, 3, 5, 'Outstanding service, quick delivery.');
INSERT INTO PharmacyReviews (ReviewID, PharmacyID, Rating, ReviewText)
VALUES (6, 3, 4, 'Great experience, knowledgeable staff.');
INSERT INTO PharmacyReviews (ReviewID, PharmacyID, Rating, ReviewText)
VALUES (7, 4, 3, 'Average service, prices could be lower.');
INSERT INTO PharmacyReviews (ReviewID, PharmacyID, Rating, ReviewText)
VALUES (8, 4, 2, 'Disappointed with the quality of products.');

--number 44:
select * from Policies;

--number 45:
select avg(m.Price) as 'the average of prices of the medications offering same-day delivery' from Medications as m
join Users u on m.UserID=u.UserID
join Pharmacies p on u.UserID=p.UserID where p.SameDayDelivery='Yes';

--number 46:
select p.Location, count(t.TransactionID) as 'number of transactions' from Pharmacies as p
join Users u on p.UserID=u.UserID
join Transactions as t on t.SellerID=u.UserID
where p.Location='456 Elm St'
group by p.Location;

--number 47:
select m.name as 'medications that has not received any reviews from the suppliers yet.' from Medications as m 
join Users u on m.UserID=u.UserID
join SellerReviews sr on u.UserID=sr.SellerID where sr.Rating is null;

INSERT INTO Orders (OrderID, BuyerID, SellerID, MedicationID, OrderDate, ShippingDate, Status)
VALUES 
    (1, 4, 5, 7, '2024-04-20', '2024-04-22', 'In Transit'),
    (2, 5, 6, 8, '2024-04-21', '2024-04-23', 'Delivered'),
    (3, 6, 7, 9, '2024-04-22', '2024-04-24', 'In Transit'),
    (4, 7, 8, 10, '2024-04-23', '2024-04-25', 'Pending'),
    (5, 8, 9, 11, '2024-04-24', '2024-04-26', 'Delivered'),
    (6, 9, 10, 12, '2024-04-25', '2024-04-27', 'In Transit');


--number 48:
SELECT Status, COUNT(*) AS OrderCount
FROM Orders
GROUP BY Status;

--number 49:
select count(m.MedicationID) as 'total quantity of medications purchased by buyers' from Medications as m
join Orders o on m.UserID=o.BuyerID;

--number 50:
select m.Name from Medications as m
join Users u on m.UserID=u.UserID
join Pharmacies p on u.UserID=p.UserID
where m.Discontinued='No' and p.SameDayDelivery='Yes';

Use SaveMed;
--adding an attribute to the table Medications:
alter table Medications
add InsuranceCoverage varchar(3);

INSERT INTO Medications (MedicationID, Name, Description, ExpiryDate, Price, DosageStrength, Donated, UserID, TherapeuticClass, OverTheCounter, Discontinued, InsuranceCoverage)
VALUES
    (13, 'Medicine D', 'This is Medicine D', '2026-09-01', 25, '150mg', 'Yes', 10, 'TherapeuticClass4', 'No', 'Yes', 'Yes'),
    (14, 'Medicine E', 'This is Medicine E', '2027-10-01', 30, '300mg', 'No', 11, 'TherapeuticClass5', 'Yes', 'No', 'Yes');
INSERT INTO Medications (MedicationID, Name, Description, ExpiryDate, Price, DosageStrength, Donated, UserID, TherapeuticClass, OverTheCounter, Discontinued, InsuranceCoverage)
VALUES
    (15, 'Medicine F', 'This is Medicine F', '2025-11-01', 18, '75mg', 'No', 12, 'TherapeuticClass6', 'No', 'No', 'Yes'),
    (16, 'Medicine G', 'This is Medicine G', '2026-12-01', 22, '250mg', 'Yes', 13, 'TherapeuticClass7', 'Yes', 'No', 'Yes');
INSERT INTO Medications (MedicationID, Name, Description, ExpiryDate, Price, DosageStrength, Donated, UserID, TherapeuticClass, OverTheCounter, Discontinued, InsuranceCoverage)
VALUES
    (17, 'Medicine H', 'This is Medicine H', '2025-05-01', 12, '50mg', 'No', 14, 'TherapeuticClass8', 'Yes', 'No', 'No'),
    (18, 'Medicine I', 'This is Medicine I', '2026-03-01', 16, '100mg', 'Yes', 15, 'TherapeuticClass9', 'No', 'Yes', 'No');

select * FROM Medications;

--number 51:
select count(m.MedicationID) as 'number of medications that are available with insurance converage' from Medications as m where m.InsuranceCoverage='Yes';

--adding an attribute to the medications table
alter table Medications
add hasSideEffects varchar(3);

INSERT INTO Medications (MedicationID, Name, Description, ExpiryDate, Price, DosageStrength, Donated, UserID, TherapeuticClass, OverTheCounter, Discontinued, InsuranceCoverage, hasSideEffects)
VALUES
    (19, 'Medicine J', 'This is Medicine J', '2026-05-01', 12, '50mg', 'No', 16, 'TherapeuticClass10', 'No', 'No', 'Yes', 'No'),
    (20, 'Medicine K', 'This is Medicine K', '2027-03-01', 16, '100mg', 'Yes', 17, 'TherapeuticClass11', 'No', 'Yes', 'No', 'Yes');
INSERT INTO Medications (MedicationID, Name, Description, ExpiryDate, Price, DosageStrength, Donated, UserID, TherapeuticClass, OverTheCounter, Discontinued, InsuranceCoverage, hasSideEffects)
VALUES
    (21, 'Medicine L', 'This is Medicine L', '2026-08-01', 20, '75mg', 'No', 18, 'TherapeuticClass12', 'Yes', 'No', 'Yes', 'Yes'),
    (22, 'Medicine M', 'This is Medicine M', '2027-07-01', 24, '150mg', 'Yes', 19, 'TherapeuticClass13', 'No', 'Yes', 'No', 'No');

--number 52:
select * from Medications where hasSideEffects='No';

--number 53:
update Medications
set price=price*1.1;

--number 54:
update Medications
 set price=price* 1.15 where InsuranceCoverage='Yes';

--number 55:
select * from Medications order by price desc;

--number 56:
select * from Medications order by price asc;

--number 57:
select M.Name as 'name of the medication',sum(T.TransactionAmount) as 'total transaction amount' from Transactions as T
join Medications M on M.MedicationID=T.MedicationID
Group by M.Name;

--number 58:
select * from Medications
where price=(select Min(price) from Medications);

--number 59:
select * from Medications
where price=(select Max(price) from Medications);

--number 60:
select  
M.Name AS MedicationName, 
avg(M.Price) AS AveragePrice
from 
Medications M
group by
M.Name
having 
avg(M.Price) > 15;

--number 61:
select * from Medications where UserID in (5,8,10);

--number 62:
select U.Username, M.Name from Users U
RIGHT OUTER JOIN Medications M on U.UserID = M.UserID;

--number 63:
select U.Username, M.Name from Users U
LEFT OUTER JOIN Medications M on U.UserID = M.UserID;


--number 64:
update Medications
set price=price*2
from Medications as m
join Users u on u.UserID=m.UserID where u.UserType='Supplier';

select * from Medications;



