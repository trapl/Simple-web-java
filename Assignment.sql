USE [master]
GO
/****** Object:  Database [AssignmentJavaWeb]    Script Date: 3/22/2020 8:59:41 PM ******/
CREATE DATABASE [AssignmentJavaWeb]
GO
ALTER DATABASE [AssignmentJavaWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AssignmentJavaWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssignmentJavaWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssignmentJavaWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AssignmentJavaWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssignmentJavaWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssignmentJavaWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssignmentJavaWeb] SET  MULTI_USER 
GO
ALTER DATABASE [AssignmentJavaWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssignmentJavaWeb] SET DB_CHAINING OFF 
GO
USE [AssignmentJavaWeb]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address] [nvarchar](70) NOT NULL,
	[SDT] [nvarchar](50) NULL,
	[ID_Slot] [nvarchar](50) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID_course] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Slot] [int] NULL,
	[Cost] [int] NULL,
	[Info] [nvarchar](200) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID_course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Address]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Address](
	[ID_Course] [nvarchar](50) NULL,
	[Address] [nvarchar](70) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Student]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Student](
	[ID_Student] [int] NULL,
	[ID_Course] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Teacher]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Teacher](
	[ID_Teacher] [nvarchar](50) NULL,
	[ID_Course] [nvarchar](50) NULL,
	[Slot] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Servlet] [nvarchar](50) NOT NULL,
	[Feature] [nvarchar](50) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[Servlet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[ID_Role] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[ID_Role] [nvarchar](50) NULL,
	[Servlet] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[ID_Slot] [nvarchar](50) NOT NULL,
	[Time] [nvarchar](50) NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[ID_Slot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID_Student] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID_Teacher] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID_Teacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher_Account]    Script Date: 3/22/2020 8:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Account](
	[ID_Teacher] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'admin', N'admin')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'teacher1', N'1')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'teacher2', N'2')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'teacher3', N'3')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'teacher4', N'4')
INSERT [dbo].[Address] ([Address], [SDT], [ID_Slot]) VALUES (N'Cụm 8, thôn Vĩnh Ninh, Xã Vĩnh Quỳnh, Huyện Thanh Trì, Hà Nội

', N'0921329391', N'1')
INSERT [dbo].[Address] ([Address], [SDT], [ID_Slot]) VALUES (N'Đội 6 Thôn Ngãi Cầu, Xã An Khánh, Huyện Hoài Đức, Hà Nội
', N'0129293292', N'3')
INSERT [dbo].[Address] ([Address], [SDT], [ID_Slot]) VALUES (N'Số 636 Nguyễn Văn Cừ, Phường Gia Thuỵ, Quận Long Biên, Hà Nội
', N'0922321114', N'2')
INSERT [dbo].[Address] ([Address], [SDT], [ID_Slot]) VALUES (N'Xóm 9, Xã Yên Mỹ, Huyện Thanh Trì, Hà Nội', N'0302200202', N'4')
INSERT [dbo].[Course] ([ID_course], [Name], [Slot], [Cost], [Info], [Status]) VALUES (N'1', N'Java Core', 10, 800000, N'Bạn là người mới bắt đầu với Java? đây là khóa học dành cho bạn. Khóa học này sẽ cung cấp cho bạn những khái niệm cốt lõi và cơ bản nhất của Java.', N'Đóng đơn')
INSERT [dbo].[Course] ([ID_course], [Name], [Slot], [Cost], [Info], [Status]) VALUES (N'2', N'Java Desktop', 12, 900000, N'Khóa học dành cho những bạn đã học qua Java Core, muốn lập trình phần mềm có giao diện tương tác với người dùng.', N'Mở đơn')
INSERT [dbo].[Course] ([ID_course], [Name], [Slot], [Cost], [Info], [Status]) VALUES (N'3', N'Java Web', 15, 1000000, N'Khóa học dành cho những bạn đã học qua Java Core + HTML + Database cơ bản, muốn thiết kế một website cơ bản với qui mô vừa và nhỏ.', N'Mở đơn')
INSERT [dbo].[Course] ([ID_course], [Name], [Slot], [Cost], [Info], [Status]) VALUES (N'4', N'HTML', 7, 600000, N'Khóa học này sẽ cung cấp cho bạn những kiến thức cơ bản, cần thiết nhất để bắt đầu trên con đường trở thành một lập trình viên web chuyên nghiệp.', N'Mở đơn')
INSERT [dbo].[Course] ([ID_course], [Name], [Slot], [Cost], [Info], [Status]) VALUES (N'5', N'CSS/Java Script', 15, 1000000, N'Khóa học này sẽ cung cấp cho bạn những kiến thức cơ bản, cần thiết nhất để bắt đầu trên con đường trở thành một lập trình viên web chuyên nghiệp.', N'Đóng đơn')
INSERT [dbo].[Course] ([ID_course], [Name], [Slot], [Cost], [Info], [Status]) VALUES (N'6', N'tra', 10, 1000000, N'fed', N'Đóng đơn')
INSERT [dbo].[Course_Address] ([ID_Course], [Address]) VALUES (N'1', N'Cụm 8, thôn Vĩnh Ninh, Xã Vĩnh Quỳnh, Huyện Thanh Trì, Hà Nội

')
INSERT [dbo].[Course_Address] ([ID_Course], [Address]) VALUES (N'3', N'Xóm 9, Xã Yên Mỹ, Huyện Thanh Trì, Hà Nội')
INSERT [dbo].[Course_Address] ([ID_Course], [Address]) VALUES (N'2', N'Đội 6 Thôn Ngãi Cầu, Xã An Khánh, Huyện Hoài Đức, Hà Nội
')
INSERT [dbo].[Course_Address] ([ID_Course], [Address]) VALUES (N'4', N'Số 636 Nguyễn Văn Cừ, Phường Gia Thuỵ, Quận Long Biên, Hà Nội
')
INSERT [dbo].[Course_Address] ([ID_Course], [Address]) VALUES (N'5', N'Đội 6 Thôn Ngãi Cầu, Xã An Khánh, Huyện Hoài Đức, Hà Nội
')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (1, N'1')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (2, N'3')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (4, N'1')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (3, N'2')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (5, N'4')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (1, N'2')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (7, N'4')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (6, N'1')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (8, N'3')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (9, N'3')
INSERT [dbo].[Course_Student] ([ID_Student], [ID_Course]) VALUES (11, N'3')
INSERT [dbo].[Course_Teacher] ([ID_Teacher], [ID_Course], [Slot]) VALUES (N'1', N'1', N'4')
INSERT [dbo].[Course_Teacher] ([ID_Teacher], [ID_Course], [Slot]) VALUES (N'2', N'3', N'1')
INSERT [dbo].[Course_Teacher] ([ID_Teacher], [ID_Course], [Slot]) VALUES (N'3', N'2', N'2')
INSERT [dbo].[Course_Teacher] ([ID_Teacher], [ID_Course], [Slot]) VALUES (N'4', N'4', N'3')
INSERT [dbo].[Course_Teacher] ([ID_Teacher], [ID_Course], [Slot]) VALUES (N'2', N'5', N'1')
INSERT [dbo].[Course_Teacher] ([ID_Teacher], [ID_Course], [Slot]) VALUES (N'1', N'6', N'1')
INSERT [dbo].[Feature] ([Servlet], [Feature]) VALUES (N'/AssignmentWeb/deletecourse', N'Delete')
INSERT [dbo].[Feature] ([Servlet], [Feature]) VALUES (N'/AssignmentWeb/insertcourse', N'Insert')
INSERT [dbo].[Feature] ([Servlet], [Feature]) VALUES (N'/AssignmentWeb/searchcourse', N'Search')
INSERT [dbo].[Feature] ([Servlet], [Feature]) VALUES (N'/AssignmentWeb/teaching', N'Teaching')
INSERT [dbo].[Feature] ([Servlet], [Feature]) VALUES (N'/AssignmentWeb/update', N'Update')
INSERT [dbo].[Role] ([ID_Role], [Name]) VALUES (N'1', N'admin')
INSERT [dbo].[Role] ([ID_Role], [Name]) VALUES (N'2', N'teacher')
INSERT [dbo].[Role_Account] ([ID_Role], [Username]) VALUES (N'1', N'admin')
INSERT [dbo].[Role_Account] ([ID_Role], [Username]) VALUES (N'2', N'teacher1')
INSERT [dbo].[Role_Account] ([ID_Role], [Username]) VALUES (N'2', N'teacher2')
INSERT [dbo].[Role_Account] ([ID_Role], [Username]) VALUES (N'2', N'teacher3')
INSERT [dbo].[Role_Account] ([ID_Role], [Username]) VALUES (N'2', N'teacher4')
INSERT [dbo].[Role_Feature] ([ID_Role], [Servlet]) VALUES (N'1', N'/AssignmentWeb/deletecourse')
INSERT [dbo].[Role_Feature] ([ID_Role], [Servlet]) VALUES (N'1', N'/AssignmentWeb/insertcourse')
INSERT [dbo].[Role_Feature] ([ID_Role], [Servlet]) VALUES (N'2', N'/AssignmentWeb/searchcourse')
INSERT [dbo].[Role_Feature] ([ID_Role], [Servlet]) VALUES (N'1', N'/AssignmentWeb/update')
INSERT [dbo].[Role_Feature] ([ID_Role], [Servlet]) VALUES (N'1', N'/AssignmentWeb/searchcourse')
INSERT [dbo].[Role_Feature] ([ID_Role], [Servlet]) VALUES (N'2', N'/AssignmentWeb/teaching')
INSERT [dbo].[Slot] ([ID_Slot], [Time]) VALUES (N'1', N'7:00 - 9:00')
INSERT [dbo].[Slot] ([ID_Slot], [Time]) VALUES (N'2', N'9:30 - 11:30')
INSERT [dbo].[Slot] ([ID_Slot], [Time]) VALUES (N'3', N'13:00 - 15:00')
INSERT [dbo].[Slot] ([ID_Slot], [Time]) VALUES (N'4', N'15:30 - 17:30')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (1, N'minh', N'Nam', CAST(N'1999-05-02' AS Date), N'0393009497', N'duongpl@gmail.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (2, N'Trần Tuấn Quốc', N'Nam', CAST(N'1999-12-12' AS Date), N'0422240202', N'quoctuan@gmail.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (3, N'Lê Văn Xuyên', N'Nam', CAST(N'1999-04-12' AS Date), N'0192492991', N'vanxuyen@gmail.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (4, N'Chu Quỳnh Hương', N'Nữ', CAST(N'2000-06-25' AS Date), N'0120430120', N'quynhhuong@gmail.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (5, N'Nguyễn Mai Thúy', N'Nữ', CAST(N'1999-11-21' AS Date), N'0123431224', N'maithuy@gmail.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (6, N'Trần Dần', N'Nam', CAST(N'1999-12-12' AS Date), N'12', N'12@f.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (7, N'new guy', N'Nam', CAST(N'1999-12-21' AS Date), N'0919119191', N'guy@ff.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (8, N'new guy2', N'Nữ', CAST(N'1999-12-12' AS Date), N'0991991919', N'guy2@ff.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (9, N'new guy3', N'Nam', CAST(N'1999-12-12' AS Date), N'0929939292', N'guy3@ff.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (10, N'new guy4', N'Nữ', CAST(N'1999-12-12' AS Date), N'091919199', N'guy4@ff.com')
INSERT [dbo].[Student] ([ID_Student], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (11, N'new guy5', N'Nam', CAST(N'1999-12-12' AS Date), N'0101010010', N'guy5@ff.com')
INSERT [dbo].[Teacher] ([ID_Teacher], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (N'1', N'Bùi Đình Trọng', N'Nam', CAST(N'1992-12-01' AS Date), N'0912932933', N'dinhtrong@gmail.com')
INSERT [dbo].[Teacher] ([ID_Teacher], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (N'2', N'Trần Văn Nam', N'Nam', CAST(N'1991-04-12' AS Date), N'0912293221', N'vannam@gmail.com')
INSERT [dbo].[Teacher] ([ID_Teacher], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (N'3', N'Nguyễn Phương Thúy', N'Nữ', CAST(N'1993-09-01' AS Date), N'0139329210', N'phuongthuy@gmail.com')
INSERT [dbo].[Teacher] ([ID_Teacher], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (N'4', N'Phan Quốc Trung', N'Nam', CAST(N'1992-06-02' AS Date), N'0919232922', N'quoctrung@gmail.com')
INSERT [dbo].[Teacher] ([ID_Teacher], [Name], [Gender], [DOB], [SDT], [Email]) VALUES (N'5', N'1', N'Nam', CAST(N'1999-12-21' AS Date), N'1', N'12@d.com')
INSERT [dbo].[Teacher_Account] ([ID_Teacher], [Username]) VALUES (N'1', N'teacher1')
INSERT [dbo].[Teacher_Account] ([ID_Teacher], [Username]) VALUES (N'2', N'teacher2')
INSERT [dbo].[Teacher_Account] ([ID_Teacher], [Username]) VALUES (N'3', N'teacher3')
INSERT [dbo].[Teacher_Account] ([ID_Teacher], [Username]) VALUES (N'4', N'teacher4')
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Slot] FOREIGN KEY([ID_Slot])
REFERENCES [dbo].[Slot] ([ID_Slot])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Slot]
GO
ALTER TABLE [dbo].[Course_Address]  WITH CHECK ADD  CONSTRAINT [FK_Course_Address_Address] FOREIGN KEY([Address])
REFERENCES [dbo].[Address] ([Address])
GO
ALTER TABLE [dbo].[Course_Address] CHECK CONSTRAINT [FK_Course_Address_Address]
GO
ALTER TABLE [dbo].[Course_Address]  WITH CHECK ADD  CONSTRAINT [FK_Course_Address_Course] FOREIGN KEY([ID_Course])
REFERENCES [dbo].[Course] ([ID_course])
GO
ALTER TABLE [dbo].[Course_Address] CHECK CONSTRAINT [FK_Course_Address_Course]
GO
ALTER TABLE [dbo].[Course_Student]  WITH CHECK ADD  CONSTRAINT [FK_Course_Student_Course] FOREIGN KEY([ID_Course])
REFERENCES [dbo].[Course] ([ID_course])
GO
ALTER TABLE [dbo].[Course_Student] CHECK CONSTRAINT [FK_Course_Student_Course]
GO
ALTER TABLE [dbo].[Course_Student]  WITH CHECK ADD  CONSTRAINT [FK_Course_Student_Student] FOREIGN KEY([ID_Student])
REFERENCES [dbo].[Student] ([ID_Student])
GO
ALTER TABLE [dbo].[Course_Student] CHECK CONSTRAINT [FK_Course_Student_Student]
GO
ALTER TABLE [dbo].[Course_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher_Course] FOREIGN KEY([ID_Course])
REFERENCES [dbo].[Course] ([ID_course])
GO
ALTER TABLE [dbo].[Course_Teacher] CHECK CONSTRAINT [FK_Course_Teacher_Course]
GO
ALTER TABLE [dbo].[Course_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher_Slot] FOREIGN KEY([Slot])
REFERENCES [dbo].[Slot] ([ID_Slot])
GO
ALTER TABLE [dbo].[Course_Teacher] CHECK CONSTRAINT [FK_Course_Teacher_Slot]
GO
ALTER TABLE [dbo].[Course_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher_Teacher] FOREIGN KEY([ID_Teacher])
REFERENCES [dbo].[Teacher] ([ID_Teacher])
GO
ALTER TABLE [dbo].[Course_Teacher] CHECK CONSTRAINT [FK_Course_Teacher_Teacher]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Role]
GO
ALTER TABLE [dbo].[Teacher_Account]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Account_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Teacher_Account] CHECK CONSTRAINT [FK_Teacher_Account_Account]
GO
ALTER TABLE [dbo].[Teacher_Account]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Account_Teacher] FOREIGN KEY([ID_Teacher])
REFERENCES [dbo].[Teacher] ([ID_Teacher])
GO
ALTER TABLE [dbo].[Teacher_Account] CHECK CONSTRAINT [FK_Teacher_Account_Teacher]
GO
USE [master]
GO
ALTER DATABASE [AssignmentJavaWeb] SET  READ_WRITE 
GO
