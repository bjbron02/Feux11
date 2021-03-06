/*
   Sunday, April 07, 20138:40:09 PM
   User: student7
   Server: tfs.wesleyreisz.com
   Database: student7
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Song
	(
	Song_ID varchar(50) NOT NULL,
	Title varchar(50) NOT NULL,
	Artist varchar(50) NOT NULL,
	Album varchar(50) NOT NULL,
	Genre varchar(50) NOT NULL,
	Album_Art image NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Song ADD CONSTRAINT
	PK_Song PRIMARY KEY CLUSTERED 
	(
	Song_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Song SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Playlist
	(
	Playlist_ID int NOT NULL,
	Playlist_Title varchar(MAX) NOT NULL,
	Song_ID varchar(50) NOT NULL,
	Song_Title varchar(50) NOT NULL,
	Song_Vote int NULL,
	Party_ID int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Playlist ADD CONSTRAINT
	PK_Playlist PRIMARY KEY CLUSTERED 
	(
	Playlist_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Playlist ADD CONSTRAINT
	FK_Playlist_Song FOREIGN KEY
	(
	Song_ID
	) REFERENCES dbo.Song
	(
	Song_ID
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.Playlist SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Party
	(
	Party_ID int NOT NULL,
	Playlist int NOT NULL,
	Party_Title varchar(MAX) NOT NULL,
	Participant_Count int NOT NULL,
	Genre_Limitation varchar(50) NULL,
	Repeat_Contraint int NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Party ADD CONSTRAINT
	PK_Party PRIMARY KEY CLUSTERED 
	(
	Party_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Party ADD CONSTRAINT
	FK_Party_Playlist FOREIGN KEY
	(
	Playlist
	) REFERENCES dbo.Playlist
	(
	Playlist_ID
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.Party SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.[Role Permission]
	(
	Role_Permission_Combo_ID int NOT NULL,
	Permission1 bit NOT NULL,
	Permission2 bit NOT NULL,
	PermissionN int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.[Role Permission] ADD CONSTRAINT
	[PK_Role Permission] PRIMARY KEY CLUSTERED 
	(
	Role_Permission_Combo_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.[Role Permission] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.[Person Role]
	(
	Person_Role_ID int NOT NULL,
	Role_Title varchar(MAX) NOT NULL,
	Role_Permission_Combo_ID int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.[Person Role] ADD CONSTRAINT
	[PK_Person Role] PRIMARY KEY CLUSTERED 
	(
	Person_Role_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.[Person Role] ADD CONSTRAINT
	[FK_Person Role_Role Permission] FOREIGN KEY
	(
	Role_Permission_Combo_ID
	) REFERENCES dbo.[Role Permission]
	(
	Role_Permission_Combo_ID
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.[Person Role] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.[Credential Source Code Table]
	(
	Credential_Source_Code int NOT NULL,
	Credential_Source varchar(50) NOT NULL,
	Credential_Description varchar(MAX) NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.[Credential Source Code Table] ADD CONSTRAINT
	[PK_Credential Source Code Table] PRIMARY KEY CLUSTERED 
	(
	Credential_Source_Code
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.[Credential Source Code Table] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.[User Credentials]
	(
	User_Name varchar(50) NOT NULL,
	Password varchar(50) NOT NULL,
	Security_Question_1 varchar(MAX) NOT NULL,
	Security_Answer_1 varchar(50) NOT NULL,
	Security_Question_2 varchar(MAX) NOT NULL,
	Security_Answer_2 varchar(50) NOT NULL,
	CredentialSource int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.[User Credentials] ADD CONSTRAINT
	[PK_User Credentials] PRIMARY KEY CLUSTERED 
	(
	User_Name
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.[User Credentials] ADD CONSTRAINT
	[FK_User Credentials_Credential Source Code Table] FOREIGN KEY
	(
	CredentialSource
	) REFERENCES dbo.[Credential Source Code Table]
	(
	Credential_Source_Code
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.[User Credentials] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Person
	(
	Person_ID int NOT NULL,
	Last_Name varchar(50) NOT NULL,
	First_Name varchar(50) NOT NULL,
	Role_ID int NOT NULL,
	User_Name varchar(50) NOT NULL,
	Sex bit NULL,
	[E-Mail] varchar(50) NULL,
	Phone int NULL,
	Facebook_Key varchar(50) NULL,
	Twitter_Key varchar(50) NULL,
	Spotify_Key varchar(50) NULL,
	Profile_ID int NOT NULL,
	Party_Owner_ID int NOT NULL,
	Party_Participant int NULL,
	IsActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Person ADD CONSTRAINT
	PK_Person PRIMARY KEY CLUSTERED 
	(
	Person_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Person ADD CONSTRAINT
	[FK_Person_User Credentials] FOREIGN KEY
	(
	User_Name
	) REFERENCES dbo.[User Credentials]
	(
	User_Name
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.Person ADD CONSTRAINT
	[FK_Person_Person Role] FOREIGN KEY
	(
	Role_ID
	) REFERENCES dbo.[Person Role]
	(
	Person_Role_ID
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.Person ADD CONSTRAINT
	FK_Person_Party FOREIGN KEY
	(
	Party_Owner_ID
	) REFERENCES dbo.Party
	(
	Party_ID
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.Person SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Profile
	(
	Person_ID int NOT NULL,
	Profile_ID int NOT NULL,
	Profile_Name varchar(50) NOT NULL,
	Profile_Picture image NULL,
	Bio varchar(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Profile ADD CONSTRAINT
	PK_Profile PRIMARY KEY CLUSTERED 
	(
	Person_ID,
	Profile_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Profile ADD CONSTRAINT
	FK_Profile_Person FOREIGN KEY
	(
	Person_ID
	) REFERENCES dbo.Person
	(
	Person_ID
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.Profile SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
