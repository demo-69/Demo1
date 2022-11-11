-- Create a new database called 'DEMO'
-- Connect to the 'master' database to run this snippet
USE master
GO

-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'DEMO'
)
CREATE DATABASE DEMO
GO

USE DEMO
GO

-- Create a new table called '[LopHoc]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[LopHoc]', 'U') IS NOT NULL
DROP TABLE [dbo].[LopHoc]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[LopHoc]
(
    [id] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, -- Primary Key column
    [ten] NVARCHAR(50) NOT NULL,
    -- Specify more columns here
);
GO

-- Insert rows into table 'LopHoc' in schema '[dbo]'
INSERT INTO [dbo].[LopHoc]
( -- Columns to insert data into
 ten
)
VALUES
( -- First row: values for the columns in the list above
 'CNTT'
),
( -- Second row: values for the columns in the list above
 'KHMT'
),
-- Add more rows here
('HTTT'),
('UDPM')
GO

-- Create a new table called '[SinhVien]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[SinhVien]', 'U') IS NOT NULL
DROP TABLE [dbo].[SinhVien]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[SinhVien]
(
    [id] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, -- Primary Key column
    [ten] NVARCHAR(50) NOT NULL,
    [lopHoc] INT NOT NULL,
    [monHoc] NVARCHAR(255),
    -- Specify more columns here
    CONSTRAINT fk_SinhVien_LopHoc FOREIGN KEY(lopHoc) REFERENCES LopHoc(id)
);
GO

-- Insert rows into table 'SinhVien' in schema '[dbo]'
INSERT INTO [dbo].[SinhVien]
( -- Columns to insert data into
 ten, lopHoc, monHoc
)
VALUES
( -- First row: values for the columns in the list above
 N'Lê Thị Đào', 1, null
),
( -- Second row: values for the columns in the list above
 N'Nguyễn Văn Me', 2, 'Java, Python'
)
-- Add more rows here
GO

-- Select rows from a Table or View '[LopHoc]' in schema '[dbo]'
SELECT * FROM [dbo].[LopHoc]
GO

-- Select rows from a Table or View '[SinhVien]' in schema '[dbo]'
SELECT * FROM [dbo].[SinhVien]
GO