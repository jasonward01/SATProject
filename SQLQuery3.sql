/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [SAT]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [FK_Students_StudentStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
ALTER TABLE [dbo].[ScheduledClasses] DROP CONSTRAINT IF EXISTS [FK_ScheduledClasses_ScheduledClassStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
ALTER TABLE [dbo].[ScheduledClasses] DROP CONSTRAINT IF EXISTS [FK_ScheduledClasses_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT IF EXISTS [FK_Enrollments_Students]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT IF EXISTS [FK_Enrollments_ScheduledClasses]
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 8/30/2022 6:50:44 PM ******/
DROP TABLE IF EXISTS [dbo].[StudentStatuses]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/30/2022 6:50:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Students]
GO
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 8/30/2022 6:50:44 PM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClassStatuses]
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 8/30/2022 6:50:44 PM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClasses]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 8/30/2022 6:50:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Enrollments]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/30/2022 6:50:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/30/2022 6:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](max) NOT NULL,
	[CreditHours] [tinyint] NOT NULL,
	[Curriculum] [nvarchar](250) NULL,
	[Notes] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 8/30/2022 6:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Enrollments](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[ScheduledClassID] [int] NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 8/30/2022 6:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledClasses](
	[ScheduledClassID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[InstructorName] [nvarchar](40) NOT NULL,
	[Location] [nvarchar](20) NOT NULL,
	[SCSID] [int] NOT NULL,
 CONSTRAINT [PK_ScheduledClasses] PRIMARY KEY CLUSTERED 
(
	[ScheduledClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 8/30/2022 6:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClassStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledClassStatuses](
	[SCSID] [int] IDENTITY(1,1) NOT NULL,
	[SCSName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ScheduledClassStatuses] PRIMARY KEY CLUSTERED 
(
	[SCSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/30/2022 6:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Major] [nvarchar](30) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](25) NULL,
	[State] [char](2) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[Phone] [nvarchar](13) NULL,
	[Email] [nvarchar](60) NOT NULL,
	[PhotoUrl] [nvarchar](100) NULL,
	[SSID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 8/30/2022 6:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudentStatuses](
	[SSID] [int] IDENTITY(1,1) NOT NULL,
	[SSName] [nvarchar](30) NOT NULL,
	[SSDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_StudentStatuses] PRIMARY KEY CLUSTERED 
(
	[SSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 
GO
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (2, N'Blockchain Design', N'Students are tasked with arranging literally blocks into a straight line. ', 3, N'Organizational Skills', N'This is a highly advanced course operating on the cutting edge of preschool and kindergarten tier technology. Periodically review for effectiveness and knowledge-retention.', 1)
GO
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (5, N'Paperfolding Theory', N'Students learn how to fold paper into shapes.', 5, N'Fine Motor Sharpening', N'Continue to develop startegies to minimize the risk of papercuts.', 1)
GO
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollments] ON 
GO
INSERT [dbo].[Enrollments] ([EnrollmentID], [StudentID], [ScheduledClassID], [EnrollmentDate]) VALUES (10, 9, 8, CAST(N'2022-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Enrollments] OFF
GO
SET IDENTITY_INSERT [dbo].[ScheduledClasses] ON 
GO
INSERT [dbo].[ScheduledClasses] ([ScheduledClassID], [CourseID], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (8, 2, CAST(N'2022-01-01' AS Date), CAST(N'2022-06-06' AS Date), N'Brian Ryan', N'Auditorium 1', 1)
GO
INSERT [dbo].[ScheduledClasses] ([ScheduledClassID], [CourseID], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (11, 5, CAST(N'2022-01-01' AS Date), CAST(N'2022-06-06' AS Date), N'Ryan Brian', N'Auditorium 2', 2)
GO
SET IDENTITY_INSERT [dbo].[ScheduledClasses] OFF
GO
SET IDENTITY_INSERT [dbo].[ScheduledClassStatuses] ON 
GO
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (1, N'In Progress')
GO
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (2, N'Open')
GO
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (3, N'Closed')
GO
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (4, N'Ended')
GO
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (5, N'Cancelled')
GO
SET IDENTITY_INSERT [dbo].[ScheduledClassStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (9, N'Tommy', N'Anderson', NULL, NULL, NULL, NULL, NULL, NULL, N'maybeanemail@gmail.com', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentStatuses] ON 
GO
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (1, N'Applied', N'Student''s application is pending reviewal')
GO
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (2, N'Deferred', N'Student''s application reviewal has been postponed')
GO
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (3, N'Accepted', N'Student''s applcation reviewed and accepted, ready to enroll')
GO
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (4, N'Active', N'Student is actively enrolled in classes')
GO
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (5, N'Leave of Absence', N'Student is enrolled but on temporary hiatus')
GO
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (6, N'Graduated ', N'Student has completed all necessary credits and received degree, no longer active')
GO
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (7, N'Withdrawn', N'Student has withdrawn from courses, no longer active')
GO
SET IDENTITY_INSERT [dbo].[StudentStatuses] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_ScheduledClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_ScheduledClasses] FOREIGN KEY([ScheduledClassID])
REFERENCES [dbo].[ScheduledClasses] ([ScheduledClassID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_ScheduledClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_ScheduledClasses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Students]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledClasses_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses] CHECK CONSTRAINT [FK_ScheduledClasses_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_ScheduledClassStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledClasses_ScheduledClassStatuses] FOREIGN KEY([SCSID])
REFERENCES [dbo].[ScheduledClassStatuses] ([SCSID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_ScheduledClassStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses] CHECK CONSTRAINT [FK_ScheduledClasses_ScheduledClassStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_StudentStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_StudentStatuses] FOREIGN KEY([SSID])
REFERENCES [dbo].[StudentStatuses] ([SSID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_StudentStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_StudentStatuses]
GO
