-- Create the user

CREATE USER [VMName] FROM EXTERNAL PROVIDER

-- Add roles

ALTER ROLE db_datareader ADD MEMBER [VMName]