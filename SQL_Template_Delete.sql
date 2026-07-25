

-- ============================================================================
-- Script: Delete Customer Record with Debug Preview
-- Database: SalesDB
-- Table: Sales.Customer
-- ============================================================================

DECLARE @Debug INT = 0;  -- Set to 1 for preview mode, 0 to execute insert


-- ============================================================================
-- PART 1: PREVIEW MODE - Shows the record that will be deleted
-- ============================================================================
IF @Debug = 1
BEGIN
	PRINT '========== DEBUG MODE: PREVIEW ==========';
	PRINT 'The following record will be deleted to SalesDB.Sales.Customers:';
	PRINT '';
	
	SELECT *
	FROM [SalesDB].[Sales].[Customers]
	WHERE CustomerID = 6
		
	
	PRINT '';
	PRINT 'To execute the insert, change @Debug to 0 and rerun the script.';
END

-- ============================================================================
-- PART 2: EXECUTE MODE - Adds the new customer record
-- ============================================================================
ELSE IF @Debug = 0
BEGIN
	PRINT '========== EXECUTING DELETE ==========';
	
	DELETE FROM [SalesDB].[Sales].[Customers]
	WHERE CustomerID = 6
	
	PRINT 'Customer record successfully deleted.';
	PRINT 'Rows affected: ' + CAST(@@ROWCOUNT AS VARCHAR(10));
	
END

ELSE
BEGIN
	PRINT 'ERROR: @Debug variable must be set to 0 or 1.';
END
