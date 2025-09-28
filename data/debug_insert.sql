-- Test script to debug INSERT issues
-- Run this first to check if the table exists and basic connectivity works

-- Check if table exists
SHOW TABLES LIKE 'tblstudents';

-- Try a single INSERT to see the exact error
INSERT INTO tblstudents (studentId, lastName, firstName, course) VALUES (9900617550, 'AIROUD', 'GABRIEL', 'L2 CODING');

-- Check if the record was inserted
SELECT * FROM tblstudents WHERE studentId = 9900617550;