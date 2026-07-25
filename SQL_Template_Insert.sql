

-- ============================================================================
-- Script: Insert New Customer Record with Debug Preview
-- Database: SalesDB
-- Table: Sales.Customer
-- ============================================================================

DECLARE @Debug INT = 0;  -- Set to 1 for preview mode, 0 to execute insert
DECLARE @NewCustomerID INT;

-- Get the next available CustomerID
SELECT @NewCustomerID = ISNULL(MAX(CustomerID), 0) + 1 
FROM SalesDB.Sales.Customers;

-- ============================================================================
-- PART 1: PREVIEW MODE - Shows the record that will be added
-- ============================================================================
IF @Debug = 1
BEGIN
	PRINT '========== DEBUG MODE: PREVIEW ==========';
	PRINT 'The following record will be added to SalesDB.Sales.Customers:';
	PRINT '';
	
	SELECT 
		@NewCustomerID AS CustomerID,
		'Joe' AS FirstName,
		'Lond' AS LastName,
		'UK' AS Country,
		850 AS Score;
	
	PRINT '';
	PRINT 'To execute the insert, change @Debug to 0 and rerun the script.';
END

-- ============================================================================
-- PART 2: EXECUTE MODE - Adds the new customer record
-- ============================================================================
ELSE IF @Debug = 0
BEGIN
	PRINT '========== EXECUTING INSERT ==========';
	
	INSERT INTO [SalesDB].[Sales].[Customers] (CustomerID, FirstName, LastName, Country, Score)
	VALUES (@NewCustomerID, 'Joe', 'Lond', 'UK', 850);
	
	PRINT 'New customer record successfully added.';
	PRINT 'Rows affected: ' + CAST(@@ROWCOUNT AS VARCHAR(10));
	PRINT 'New CustomerID: ' + CAST(@NewCustomerID AS VARCHAR(10));
END

ELSE
BEGIN
	PRINT 'ERROR: @Debug variable must be set to 0 or 1.';
END
