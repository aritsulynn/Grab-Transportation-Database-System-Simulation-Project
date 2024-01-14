-- GROUP 8
USE grabcompany;

-- 1
-- Find the average of payment for all customer.
SELECT ROUND(AVG(Payment_Amount),2) as `Average of payment` FROM Payment_transaction;

-- 2
-- List all first and last name of female customer
SELECT Fname, Lname FROM Customer
WHERE Gender = "F";

-- 3
-- List all Card name and Order by asc(card name)
SELECT Issuer_bank_name as `Bank name`, COUNT(Issuer_bank_name) as `Total` FROM Card
GROUP BY Issuer_bank_name;

-- 4
-- List all Notification message that msgid = 1000000
SELECT DISTINCT NOTIF_msg as Message FROM Notification
WHERE NOTIF_id = 1000000;

-- 5
-- List a total number that use Debit card
SELECT COUNT(Debit) as `Debit card` FROM Card;

-- 6
-- List all account that recieve message id = 1000000 and live in Nonthaburi
SELECT Account_name FROM Account
JOIN Notification ON Account.Account_id = Notification.AID
JOIN Address ON Account.CID = Address.CID
WHERE NOTIF_id = 1000000 AND City_name="Nonthaburi";

-- 7
-- List all account (id, name) that Postal_codes = 10110
SELECT Account_name, Fname, Lname FROM Account
JOIN Address ON Account.CID = Address.CID
JOIN Customer ON Account.CID = Customer_id
WHERE Postal_codes = 10110;

-- 8
-- List all account that use JustGrab and pay more than 100.00 baht
SELECT 	Account_name FROM Account
JOIN	Driver ON Account_id = Driver.AID
JOIN	Grab_Service ON DRIVER.Driver_id = Grab_Service.Driver_ID_GS
JOIN	Payment_transaction ON Account_id = Payment_transaction.AID
WHERE 	Car_type = "JustGrab" AND Payment_amount > 100.00;

-- 9
-- List all account who living in Nakhon pathom
SELECT 	Account_name as `Account Name`, CONCAT(Customer.Fname, " ", Customer.Lname) as `Name` FROM Customer
JOIN	Account ON	Customer.Customer_id = Account.CID
JOIN	Address ON	Customer.Customer_id = Address.CID 
WHERE 	Address.City_name = "Nakhon Pathom";

-- 10
-- List all account(id, name) and Cartype that must change the money.
SELECT 	DISTINCT Account_name, Money_change FROM Account
JOIN	Payment_transaction ON Account.Account_id = Payment_transaction.AID
JOIN	Cash ON Cash.Payment_id = Payment_transaction.Payment_id;

-- 11
-- List all first and last name of male customer who have the first letter "S" in his/her firstname
SELECT Fname, Lname
FROM customer
WHERE Gender = "M" AND Fname LIKE "S%";

-- 12
-- List a total number of customer whose phone start with 06
SELECT COUNT(Customer_id)
FROM customer
WHERE Phone LIKE "06%";

-- 13
-- List all account name which have the letter "M" or "N" in his/her account name
SELECT Account_name
FROM account
WHERE Account_name LIKE "%M%" OR Account_name LIKE "%N%";

-- 14
-- List all driver id who have the letter "S" in his/her last name
SELECT Driver_id
FROM driver
WHERE Lname LIKE "%S%";

-- 15
-- List a total number of driver location which is Bangkok
SELECT COUNT(Driver_id)
FROM driver_location
WHERE driver_location = "Bangkok";

-- 16
-- List all first, last name and car type of driver who travel to Bangkok or Nonthaburi
SELECT Fname, Lname, gs.Car_type
FROM driver d
JOIN driver_location dl ON d.driver_id = dl.driver_id
JOIN grab_service gs ON d.driver_id = gs.Driver_ID_GS
WHERE dl.driver_location = "Bangkok" OR dl.driver_location = "Nonthaburi";

-- 17
-- List all car id, first, last name and driver location of driver whose grab service is GrabCar
SELECT Car_id, Fname, Lname, dl.Driver_location
FROM driver d
JOIN grab_service gs ON d.driver_id = gs.Driver_ID_GS
JOIN driver_location dl ON d.driver_id = dl.Driver_id
WHERE gs.car_type = "GrabCar";

-- 18
-- List all customer id, first, last name, city name and account id of customer who live in Pathum Wan
SELECT Customer_id, Fname, Lname, City_name, ac.account_id
FROM customer c
JOIN address a ON c.customer_id = a.CID
JOIN account ac ON c.customer_id = ac.CID
WHERE a.City_name = "Pathum Wan";

-- 19 
-- List all first and last name of customer who paid less than 100 baht
SELECT Fname, Lname
FROM account a
JOIN payment_transaction p ON a.Account_id = p.AID
JOIN customer c ON a.CID = c.customer_id
WHERE p.Payment_amount < 100;

-- 20
-- List all payment amount, driver id and car type for each payment transaction
SELECT d.driver_id, g.Car_type, Payment_amount
FROM payment_transaction p
JOIN grab_service g ON p.Car_id = g.Car_id
JOIN driver d ON g.Driver_ID_GS = d.driver_id
ORDER BY Payment_amount DESC;

-- 21
-- List total of male customer  
SELECT COUNT(Customer_id) AS "Total Male customer"FROM Customer
WHERE Gender = "M" ; 

-- 22
-- List total of female customer
SELECT COUNT(Customer_id) AS "Total Female customer" FROM Customer
WHERE Gender = "F" ; 

-- 23
-- List car id ,type of the service that have "car" in that service
SELECT Car_id , Car_type FROM Grab_Service
WHERE Car_type LIKE "%Car%";

-- 24
-- List date , recommend message and the message that
SELECT NOTLF_time AS Date , NOTLF_type AS Type, NOTIF_MSG AS Message FROM Notification
WHERE NOTLF_type = "Recommend" ;

-- 25
-- List total of credit card that cutomer use 
SELECT COUNT(Credit) AS  "Credit card" FROM Card;

-- 26
-- List all first name , last name , driver location and Car type that driver service
SELECT Fname, Lname , Driver_location ,Car_type From Driver d
Join Driver_location dl ON d.Driver_id = dl.Driver_id
Join Grab_Service GS  ON d.Driver_id = GS.Driver_ID_GS;

-- 27
-- List all first name , last name ,and Car type that customer use
SELECT Fname, Lname , Car_type FROM Customer c
Join Account a ON c.Customer_id = a.CID
Join Grab_Service GS ON a.Account_id = GS.Car_id; 

-- 28
-- List customer first name , last name and bank name that use debit card
SELECT c.Fname, c.Lname , Issuer_bank_name ,Debit FROM Customer c
Join Account a ON c.Customer_id = a.CID
Join Payment_transaction pt ON a.Account_id = pt.AID
Join Card ca ON pt.Payment_id = ca.Payment_id
WHERE Debit = "Y";

-- 29
-- List driver id and name that place they are going to drive customer to home
SELECT Driver_id , CONCAT(d.Fname," ",d.Lname) as "Full name" ,Build_no , City_name FROM Driver d
Join Account a ON d.AID = a.Account_id
Join Customer c ON a.CID = c.Customer_id
Join Address ad ON c.Customer_id = ad.CID;

-- 30
-- List account id ,name and full name of the account who living in Khlong Toei
SELECT 	Account_id ,Account_name as "Account Name", CONCAT(Customer.Fname, " ", Customer.Lname) as "Full Name" FROM Customer
JOIN	Account ON	Customer.Customer_id = Account.CID
JOIN	Address ON	Customer.Customer_id = Address.CID 
WHERE 	Address.City_name = "Khlong Toei";

-- 31
-- List a total number of customer whose phone start with 09
SELECT* FROM customer
WHERE Phone LIKE "09%";

-- 32
-- List all address that city name is Suan luang
SELECT* FROM address
WHERE  City_name = "Suan Luang";

-- 33
-- List all driver who have first name start with letter "P"
SELECT* FROM Driver
WHERE Fname LIKE "P%";

-- 34
-- List all card number that contain number 1 in CVV
SELECT* FROM Card
WHERE CVV LIKE "%1%";

-- 35
-- List all car type that contain "Taxi"  word
SELECT* FROM Grab_Service
WHERE Car_type LIKE "%Taxi%";

-- 36
-- List all customer id, account's name, customer's firstname, and customer's lastname who living in Muang district order by customer id ascending.
SELECT Customer_id, ac.Account_name, Fname, Lname
FROM Customer c
JOIN Account ac ON c.Customer_id = ac.CID
JOIN Address ad ON c.Customer_id = ad.CID
WHERE ad.District ="Muang"
ORDER BY Customer_id ASC;

-- 37
-- List all account's name, customer's firstname, customer's lastname, and city's name where account name equal to "Tannie".
SELECT ac.Account_name, Fname, Lname, ad.City_name
FROM Customer c
JOIN Account ac ON c.Customer_id = ac.CID
JOIN Address ad ON c.Customer_id = ad.CID
WHERE ac.Account_name = "Tannie";

-- 38
-- List all driver's firstname, driver's lastname, and driver's location where car type equal to "JustGrab".
SELECT Fname, Lname, lc.Driver_location
FROM Driver d
JOIN Driver_location lc ON d.Driver_id = lc.Driver_id
JOIN Grab_Service ct ON d.Driver_id = ct.Driver_ID_GS
WHERE ct.Car_type = "JustGrab";

-- 39
-- List all car's ID, driver's firstname, driver's lastname, and car's type where driver's location equal to "Bangkok".
SELECT Car_id, Fname, Lname, ct.Car_type
FROM Driver d
JOIN Driver_location lc ON d.Driver_id = lc.Driver_id
JOIN Grab_Service ct ON d.Driver_id = ct.Driver_ID_GS
WHERE lc.Driver_location = "Bangkok";

-- 40
-- List all account's name, payment amount, driver's ID, and driver's firstname where payment amount less than 200.
SELECT Account_name, pt.Payment_amount, d.Driver_ID, Fname
FROM Account ac
JOIN Driver d ON ac.Account_id = d.AID
JOIN Payment_transaction pt ON ac.Account_id = pt.AID
WHERE pt.Payment_amount < 200;