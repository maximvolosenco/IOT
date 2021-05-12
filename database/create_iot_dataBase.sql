CREATE DATABASE IOTDataBase;

CREATE TABLE dbo.UserInfo(
	UserId INT IDENTITY(1,1) PRIMARY KEY,	
	Nickname VARCHAR(255),
	UserLogin VARCHAR(255) NOT NULL,
	UserPassword VARCHAR(255) NOT NULL,
	Photo IMAGE
)

CREATE TABLE dbo.LocationInfo(
	LocationId INT IDENTITY(1,1) PRIMARY KEY,	
	StreetName VARCHAR(255),
	QuadrantNumber INT,
)
CREATE TABLE dbo.SignInfo(
	UserId INT FOREIGN KEY REFERENCES dbo.UserInfo(UserId),
	SignName VARCHAR(255) NOT NULL,
	SignPhoto IMAGE NOT NULL,
	SignStatus INT DEFAULT 0,
	Comments VARCHAR(255),
	LocationId INT FOREIGN KEY REFERENCES dbo.LocationInfo(LocationId),
)

INSERT INTO UserInfo (UserLogin, UserPassword)
VALUES ('user', '123')



INSERT INTO LocationInfo (StreetName, QuadrantNumber)
VALUES ('Street1', 3)
	  ,('Street1', 7)
	  ,('Street1', 11)
	  ,('Street1', 15)
	  ,('Street1', 19)
	  ,('Street1', 23)
	  ,('Street2', 12)
	  ,('Street2', 13)	  
	  ,('Street2', 14)
	  ,('Street2', 15)
	  ,('Street2', 16)
	  ,('Street2', 17)
	  ,('Street2', 18)
		
--INSERT INTO SignInfo(UserId, SignName, SignPhoto, LocationId, SignStatus)
--VALUES (1, '')


