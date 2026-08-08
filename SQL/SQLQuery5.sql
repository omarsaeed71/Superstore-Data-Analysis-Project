CREATE TABLE DWH.Dim_Date (
    Date_Key INT PRIMARY KEY,
    Full_Date DATE,
    Day_Number INT,
    Month_Number INT,
    Month_Name NVARCHAR(20),
    Quarter_Number INT,
    Year_Number INT
);



INSERT INTO DWH.Dim_Date
(
    Date_Key,
    Full_Date,
    Day_Number,
    Month_Number,
    Month_Name,
    Quarter_Number,
    Year_Number
)



SELECT DISTINCT 
    CONVERT(INT, FORMAT(DateValue,'yyyyMMdd')) AS Date_Key,
    DateValue AS Full_Date,
    DAY(DateValue) AS Day_Number,
    MONTH(DateValue) AS Month_Number,
    DATENAME(MONTH, DateValue) AS Month_Name,
    DATEPART(QUARTER, DateValue) AS Quarter_Number,
    YEAR(DateValue) AS Year_Number
FROM
(
    SELECT Order_Date AS DateValue
    FROM [STG].[cleaned_train1]

    UNION

    SELECT Ship_Date
    FROM [STG].[cleaned_train1]
) D;



CREATE TABLE DWH.Dim_Customer (
    Customer_Key INT IDENTITY(1,1) PRIMARY KEY,
    Customer_Name NVARCHAR(50),
    Segment NVARCHAR(50)
);


CREATE TABLE DWH.Dim_Product (
    Product_Key INT IDENTITY(1,1) PRIMARY KEY,
    Product_Name NVARCHAR(50),
    Category NVARCHAR(50),
    Sub_Category NVARCHAR(50)
);


CREATE TABLE DWH.Dim_Location (
    Location_Key INT IDENTITY(1,1) PRIMARY KEY,
    Country NVARCHAR(50),
    State NVARCHAR(50),
    City NVARCHAR(50),
    Postal_Code NVARCHAR(50),
    Region NVARCHAR(50)
);


CREATE TABLE DWH.Dim_Ship_Mode (
    Ship_Mode_Key INT IDENTITY(1,1) PRIMARY KEY,
    Ship_Mode NVARCHAR(50)
);



