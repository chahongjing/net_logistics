USE [Logistics]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[UserGuid] [uniqueidentifier] NOT NULL,
	[UserCode] [nvarchar](20) NULL,
	[UserName] [nvarchar](20) NULL,
	[Password] [nvarchar](32) NULL,
	[Sex] [bit] NULL,
	[Birthday] [datetime] NULL,
	[Photo] [nvarchar](200) NULL,
	[CompanyGuid] [uniqueidentifier] NULL,
	[DepartmentGuid] [uniqueidentifier] NULL,
	[IsDisabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'UserGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'UserCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'CompanyGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'DepartmentGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'IsDisabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo'
GO
INSERT [dbo].[UserInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UserGuid], [UserCode], [UserName], [Password], [Sex], [Birthday], [Photo], [CompanyGuid], [DepartmentGuid], [IsDisabled]) VALUES (NULL, NULL, NULL, NULL, N'ad162ef9-9063-4baa-a12d-6b458796a4de', N'admin', N'系统管理员', N'1', 0, CAST(0x0000809300000000 AS DateTime), N'/Image/Photo/8593224df95a4e8c985e7c0583cf8849', N'b72eb09e-03b2-44ea-9862-cd8a4b0d30be', N'2cf92a95-4fba-4d82-80d4-95f2b847fd3f', 0)
INSERT [dbo].[UserInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UserGuid], [UserCode], [UserName], [Password], [Sex], [Birthday], [Photo], [CompanyGuid], [DepartmentGuid], [IsDisabled]) VALUES (NULL, NULL, NULL, NULL, N'7924604e-2eae-4d25-9260-b93ef689f4b4', N'zjy', N'曾军毅', N'2', 1, CAST(0x0000809300000000 AS DateTime), N'/Image/Photo/9121d82b4d404469a58c69a08ffb3a2f.png', N'cf18f48b-f06e-4842-97d2-b00dd4b97a78', N'ae33dd32-eb04-48d8-a85f-36917c1f38cd', NULL)
INSERT [dbo].[UserInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UserGuid], [UserCode], [UserName], [Password], [Sex], [Birthday], [Photo], [CompanyGuid], [DepartmentGuid], [IsDisabled]) VALUES (NULL, NULL, NULL, NULL, N'37fe8657-cb7a-4726-94f9-dfdf508c153a', N'xxc', N'许小翠', N'1', 0, CAST(0x0000A4EA00000000 AS DateTime), NULL, N'cf18f48b-f06e-4842-97d2-b00dd4b97a78', NULL, NULL)
/****** Object:  Table [dbo].[SystemInfo]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemInfo](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[SystemGuid] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Name] [nvarchar](20) NULL,
	[Remark] [nvarchar](200) NULL,
	[Icon] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SystemGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo', @level2type=N'COLUMN',@level2name=N'SystemGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemInfo'
GO
INSERT [dbo].[SystemInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SystemGuid], [Code], [Name], [Remark], [Icon]) VALUES (NULL, NULL, NULL, NULL, N'b32cb0be-f79c-4ee1-8685-8c4e026ea937', N'System', N'后台管理系统', N'后台管理系统', N'1')
INSERT [dbo].[SystemInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SystemGuid], [Code], [Name], [Remark], [Icon]) VALUES (NULL, NULL, NULL, NULL, N'5324bd64-a4bc-4132-bf5b-d782cd99d8b3', N'无', N'新系统', N'夺', N'在')
/****** Object:  Table [dbo].[SiteVisit]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteVisit](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[IP] [nvarchar](50) NULL,
	[Broswer] [nvarchar](50) NULL,
	[System] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteVisit', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteVisit', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteVisit', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteVisit', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteVisit', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteVisit', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteVisit', @level2type=N'COLUMN',@level2name=N'Broswer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作系统' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteVisit', @level2type=N'COLUMN',@level2name=N'System'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点访问表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SiteVisit'
GO
/****** Object:  Table [dbo].[RoleToPermission]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleToPermission](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[RoleToPermissionGuid] [uniqueidentifier] NOT NULL,
	[RoleGuid] [uniqueidentifier] NULL,
	[ActionGuid] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleToPermissionGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToPermission', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToPermission', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToPermission', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToPermission', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToPermission', @level2type=N'COLUMN',@level2name=N'RoleToPermissionGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToPermission', @level2type=N'COLUMN',@level2name=N'RoleGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务数据ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToPermission', @level2type=N'COLUMN',@level2name=N'ActionGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色权限关系表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToPermission'
GO
INSERT [dbo].[RoleToPermission] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToPermissionGuid], [RoleGuid], [ActionGuid]) VALUES (NULL, NULL, NULL, NULL, N'b4a44ca9-0ec7-479a-a448-6a1e92276dd1', N'95dc7019-2c22-40d3-b915-adc7f506319e', N'4a336067-7ac4-4d6d-975e-2be55a2ecfd7')
INSERT [dbo].[RoleToPermission] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToPermissionGuid], [RoleGuid], [ActionGuid]) VALUES (NULL, NULL, NULL, NULL, N'e259a557-786b-4125-a0d8-771d9b590996', N'578303d3-1cfb-424c-b06e-b6c04b6e202f', N'3a44761e-2d8d-4adb-8720-49b81486b04e')
INSERT [dbo].[RoleToPermission] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToPermissionGuid], [RoleGuid], [ActionGuid]) VALUES (NULL, NULL, NULL, NULL, N'904159b1-cb6e-46f3-be37-7ca8e4ecc57d', N'034e88a8-5fb3-4b00-93f7-5caceb034897', N'3a44761e-2d8d-4adb-8720-49b81486b04e')
INSERT [dbo].[RoleToPermission] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToPermissionGuid], [RoleGuid], [ActionGuid]) VALUES (NULL, NULL, NULL, NULL, N'35e86223-ba5a-4d17-b074-7cc0ab46da49', N'034e88a8-5fb3-4b00-93f7-5caceb034897', N'644f77b4-7742-4048-a409-81b5ed7cf32d')
INSERT [dbo].[RoleToPermission] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToPermissionGuid], [RoleGuid], [ActionGuid]) VALUES (NULL, NULL, NULL, NULL, N'03041264-79e8-48b4-b628-b00563703f1d', N'034e88a8-5fb3-4b00-93f7-5caceb034897', N'4a336067-7ac4-4d6d-975e-2be55a2ecfd7')
INSERT [dbo].[RoleToPermission] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToPermissionGuid], [RoleGuid], [ActionGuid]) VALUES (NULL, NULL, NULL, NULL, N'acca9915-6fbc-42c0-ae35-c78ead417d01', N'034e88a8-5fb3-4b00-93f7-5caceb034897', N'c2fe5b31-c9ba-4771-99cb-c948bf06a364')
INSERT [dbo].[RoleToPermission] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToPermissionGuid], [RoleGuid], [ActionGuid]) VALUES (NULL, NULL, NULL, NULL, N'e98431a5-4158-4846-b392-e837c66a492a', N'578303d3-1cfb-424c-b06e-b6c04b6e202f', N'c2fe5b31-c9ba-4771-99cb-c948bf06a364')
INSERT [dbo].[RoleToPermission] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToPermissionGuid], [RoleGuid], [ActionGuid]) VALUES (NULL, NULL, NULL, NULL, N'a5dc857f-ce11-424b-85ff-f4a6fb305ef9', N'95dc7019-2c22-40d3-b915-adc7f506319e', N'c2fe5b31-c9ba-4771-99cb-c948bf06a364')
/****** Object:  Table [dbo].[RoleToBusiness]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleToBusiness](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[RoleToBusinessGuid] [uniqueidentifier] NOT NULL,
	[RoleGuid] [uniqueidentifier] NULL,
	[BusinessGuid] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleToBusinessGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToBusiness', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToBusiness', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToBusiness', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToBusiness', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToBusiness', @level2type=N'COLUMN',@level2name=N'RoleToBusinessGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToBusiness', @level2type=N'COLUMN',@level2name=N'RoleGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务数据ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToBusiness', @level2type=N'COLUMN',@level2name=N'BusinessGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色业务对象关系表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleToBusiness'
GO
INSERT [dbo].[RoleToBusiness] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToBusinessGuid], [RoleGuid], [BusinessGuid]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A486016B3540 AS DateTime), NULL, NULL, N'bfe827a3-e034-484c-b21e-05168a87e1fa', N'034e88a8-5fb3-4b00-93f7-5caceb034897', N'ad162ef9-9063-4baa-a12d-6b458796a4de')
INSERT [dbo].[RoleToBusiness] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToBusinessGuid], [RoleGuid], [BusinessGuid]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A486016C3134 AS DateTime), NULL, NULL, N'0e94e9aa-31d0-487b-a29c-814aea3cf242', N'95dc7019-2c22-40d3-b915-adc7f506319e', N'7924604e-2eae-4d25-9260-b93ef689f4b4')
INSERT [dbo].[RoleToBusiness] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleToBusinessGuid], [RoleGuid], [BusinessGuid]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A486016B2AB4 AS DateTime), NULL, NULL, N'8ee2be4e-2154-45be-b31f-d4a3282f140a', N'95dc7019-2c22-40d3-b915-adc7f506319e', N'a0bcd15c-9f84-4bf8-a30c-bbf5f7cc65a3')
/****** Object:  Table [dbo].[RoleInfo]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleInfo](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[RoleGuid] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](100) NULL,
	[Remark] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleInfo', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleInfo', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleInfo', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleInfo', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleInfo', @level2type=N'COLUMN',@level2name=N'RoleGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleInfo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleInfo', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoleInfo'
GO
INSERT [dbo].[RoleInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleGuid], [Name], [Code], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'034e88a8-5fb3-4b00-93f7-5caceb034897', N'系统管理员', N'1', N'12')
INSERT [dbo].[RoleInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleGuid], [Name], [Code], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'95dc7019-2c22-40d3-b915-adc7f506319e', N'一般角色', N'23', N'42')
INSERT [dbo].[RoleInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [RoleGuid], [Name], [Code], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'578303d3-1cfb-424c-b06e-b6c04b6e202f', N'管理员', N'2', N'')
/****** Object:  Table [dbo].[ProcessStep]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessStep](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NULL,
	[StepID] [uniqueidentifier] NULL,
	[StepName] [nvarchar](100) NULL,
	[EstimateDate] [datetime] NULL,
	[FinishDate] [datetime] NULL,
	[Memo] [nvarchar](1000) NULL,
	[Seq] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'f398e491-fce6-40d8-a33d-0261585aa7de', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'提示客户将通关资料在货物到达仓库前寄送到通关公司', CAST(0x0000A50700000000 AS DateTime), NULL, N'', 13)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'09fc63fb-5555-4b89-a5e4-054181989f55', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'确定清关预计时间，通知客户网付，汇报其他意外情况', CAST(0x0000A4F100000000 AS DateTime), NULL, N'', 3)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CBD540 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'fa15491c-3891-4cc5-993b-0ccdb8f9f95d', N'15aa3f24-964d-43e5-9329-148e81b8baf9', NULL, N'确定行李放行日期', CAST(0x0000A4F700000000 AS DateTime), CAST(0x0000A4F100000000 AS DateTime), N'', 8)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'7fb6ca21-0564-4b1d-b936-0ed471747009', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'确定货量、包装要求及其他特殊要求、据此提交费用预算', CAST(0x0000A4F900000000 AS DateTime), NULL, N'', 11)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'09d6e62f-b9ec-4ec4-8dda-0f19e3b69d33', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'和代理店对账，和客户对账', CAST(0x0000A4F700000000 AS DateTime), NULL, N'', 9)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'314abf92-8e24-4560-a124-10664677f212', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'接收PRE-alert，通知报关公司，通知客户准备资料', CAST(0x0000A4F600000000 AS DateTime), NULL, N'', 8)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'57728aad-3e30-421d-87da-1a53ed55c010', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'确认配送完毕时间，向客户汇报', CAST(0x0000A4F200000000 AS DateTime), NULL, N'', 6)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'85b2d51e-db02-440e-8a15-283ff9664556', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'和代理店对账，和客户对账', CAST(0x0000A4E300000000 AS DateTime), CAST(0x0000A4E100000000 AS DateTime), N'', 1)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CBD540 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'602c2043-0511-46ac-89a9-2f35d6d5c71d', N'15aa3f24-964d-43e5-9329-148e81b8baf9', NULL, N'整理存档资料，装订成册', CAST(0x0000A4F600000000 AS DateTime), CAST(0x0000A4FF00000000 AS DateTime), N'', 7)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CBD540 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'd35db788-b5d4-4380-b24b-315e35f93488', N'15aa3f24-964d-43e5-9329-148e81b8baf9', NULL, N'提示客户向报关行提交资料，查看资料是否完整', CAST(0x0000A4F200000000 AS DateTime), CAST(0x0000A4EB00000000 AS DateTime), N'', 3)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'822eed30-7c22-40db-9b90-3445076155d3', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'整理存档资料，装订成册。', CAST(0x0000A4F400000000 AS DateTime), CAST(0x0000A50000000000 AS DateTime), N'', 6)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'0d02c099-97ef-4086-b111-35953b881c16', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'安排包装、提货、配送至空运出口仓库', CAST(0x0000A4EB00000000 AS DateTime), CAST(0x0000A4EE00000000 AS DateTime), N'', 5)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'd2fc18f2-2d4e-4415-b0dc-360c07a00613', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'和代理店对账，和客户对账', CAST(0x0000A4F200000000 AS DateTime), NULL, N'', 7)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'83e1fb62-1463-4aaa-bc0a-3d876f5a54ed', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'提交报价', CAST(0x0000A4EF00000000 AS DateTime), CAST(0x0000A4F900000000 AS DateTime), N'', 1)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'ec98b043-779f-465b-abae-481f4a2937d1', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'配送，签收完毕', CAST(0x0000A4F500000000 AS DateTime), NULL, N'', 7)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'6ebc0eb2-9957-432e-b3a4-4b13c0119351', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'结算：业务一览表', CAST(0x0000A4E900000000 AS DateTime), CAST(0x0000A4E900000000 AS DateTime), N'', 3)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'bcf92135-92b8-4bdb-86b7-4ed9b140eb31', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'得到MABL/HABL确定预计的日程，汇报给客户', CAST(0x0000A4F900000000 AS DateTime), NULL, N'', 11)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8017D3510 AS DateTime), NULL, NULL, N'187ef707-09e2-4804-9157-5887ea3acabf', N'86b756d8-e22b-4267-891b-286e97c59bcd', NULL, N'1', CAST(0x0000A4F900000000 AS DateTime), CAST(0x0000A4F900000000 AS DateTime), N'', 1)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'150f9711-c997-4e04-9947-5d1b01ff2120', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'结算：业务一览表', CAST(0x0000A4EF00000000 AS DateTime), NULL, N'', 1)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'aa243431-9a58-44a6-8257-5d38cc9f150b', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'给代理店提交报关委托书、保险购买申请书', CAST(0x0000A4F400000000 AS DateTime), NULL, N'', 7)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'e27e705f-76b1-4d67-a624-683f906c909d', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'确定货量、包装要求及其他特殊要求、据此提交费用预算', CAST(0x0000A4F100000000 AS DateTime), CAST(0x0000A4EE00000000 AS DateTime), N'', 6)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CBD540 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'e2c63122-96cb-467a-a4f0-6910900dfe51', N'15aa3f24-964d-43e5-9329-148e81b8baf9', NULL, N'配送、拆包装、说明保险赔付问题', CAST(0x0000A4F000000000 AS DateTime), CAST(0x0000A4E400000000 AS DateTime), N'', 1)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB4278 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'ca4bc7f5-b8e2-40c7-829e-69165a7b867b', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'向代理店发送出口通关签字资料及订舱委托书', CAST(0x0000A4F900000000 AS DateTime), CAST(0x0000A4F900000000 AS DateTime), N'', 11)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'388b5eec-56c1-44bd-a691-6ace09d8c04f', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'给代理店提交报关委托书、保险购买申请书', CAST(0x0000A4EB00000000 AS DateTime), NULL, N'', 3)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'cf4401d9-168c-40c5-81b8-6b63902c10d2', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'得到客户搬家的业务咨询，介绍搬家流程，听取客户需求', CAST(0x0000A4F800000000 AS DateTime), CAST(0x0000A50000000000 AS DateTime), N'', 10)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'481f2750-a9d4-4a85-aae0-7965dad967f5', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'结算：业务一览表、代理店对账', CAST(0x0000A4F600000000 AS DateTime), CAST(0x0000A4F900000000 AS DateTime), N'', 8)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'e1f452ac-0d4a-4338-8475-7ad2300568b6', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'开发票、向日本发送debit note，收款及代理店付款', CAST(0x0000A4F400000000 AS DateTime), NULL, N'', 6)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'c00e5839-1290-46ec-a43f-7ae576a78711', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'确定通关情况及订舱情况', CAST(0x0000A4FF00000000 AS DateTime), NULL, N'', 12)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'ec5d8622-281c-43a6-8193-7e65efede099', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'开发票、收款及代理店付款', CAST(0x0000A4E800000000 AS DateTime), NULL, N'', 2)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CBD540 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'b8db8638-3c68-4353-9ffe-8886cb9a3b84', N'15aa3f24-964d-43e5-9329-148e81b8baf9', NULL, N'确定仓库地址及联系人、预计到达时间', CAST(0x0000A4F300000000 AS DateTime), CAST(0x0000A4F900000000 AS DateTime), N'', 4)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'6c6deb35-c277-4486-b068-8be65999c746', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'跟踪航班情况，跟踪目的地的清关情况', CAST(0x0000A4F600000000 AS DateTime), NULL, N'', 9)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'816800a9-e026-4f9e-a93f-903df23ffdd5', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'将“BL+出口通关资料”发送给日本进口搬家负责人', CAST(0x0000A4F700000000 AS DateTime), CAST(0x0000A50000000000 AS DateTime), N'', 9)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'82c09355-2c77-4d10-a639-91444d24daa1', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'上门查看货量，确定货量，向客户解释搬家要点', CAST(0x0000A4F500000000 AS DateTime), CAST(0x0000A4F800000000 AS DateTime), N'', 7)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDB90 AS DateTime), N'09966359-f269-4691-abe7-9467fa835adf', N'2516b645-5f41-4b58-b886-f01068595b8a', NULL, N'货物到达前确认资料是否完整无误的寄送到通关公司', CAST(0x0000A4F100000000 AS DateTime), NULL, N'', 4)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'd8605916-a9d0-4c42-b6ad-9851169c4e2d', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'确定通关情况及订舱情况', CAST(0x0000A4F800000000 AS DateTime), NULL, N'', 9)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'39a3f2b1-f2dc-4b9d-91c2-9e897b766c6e', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'代理店发送BL', CAST(0x0000A4F100000000 AS DateTime), CAST(0x0000A4F100000000 AS DateTime), N'', 3)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'83ed1a85-a3a4-4535-9116-a340656db93f', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'配送纸箱、打包、提货、填写订舱资料', CAST(0x0000A4F200000000 AS DateTime), CAST(0x0000A4EA00000000 AS DateTime), N'', 4)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'2b66a923-c3cc-438a-8983-acd45cb8730f', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'整理存档资料、装订成册', CAST(0x0000A4E900000000 AS DateTime), CAST(0x0000A4E900000000 AS DateTime), N'', 4)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'91f83bf4-107a-434f-a745-b15104cf8889', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'货物到达前确认资料是否完整无误的寄送到通关公司', CAST(0x0000A4F200000000 AS DateTime), NULL, N'', 4)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDB90 AS DateTime), N'693055cc-40f9-49a5-aa35-b20dc41a83b6', N'2516b645-5f41-4b58-b886-f01068595b8a', NULL, N'确定清关预计时间，通知客户网付，汇报其他意外情况', CAST(0x0000A4F500000000 AS DateTime), NULL, N'', 8)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'f5ab7fb4-0244-4801-946b-b76fac25a0b7', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'整理存档资料，装订成册。', CAST(0x0000A4F300000000 AS DateTime), NULL, N'', 5)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'ff36e56e-1206-4cc9-ad97-b8be3549c732', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'成交，确定提货时间', CAST(0x0000A50700000000 AS DateTime), NULL, N'', 13)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'0995f08a-c69b-45fd-83a1-ba301be69679', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'整理存档资料、装订成册', CAST(0x0000A4EB00000000 AS DateTime), CAST(0x0000A4EC00000000 AS DateTime), N'', 2)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDA64 AS DateTime), N'f85aaef7-84ca-4608-b36f-bc582d0e1191', N'2516b645-5f41-4b58-b886-f01068595b8a', NULL, N'整理存档资料，装订成册。', CAST(0x0000A4EF00000000 AS DateTime), NULL, N'', 2)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'ed6f30e7-e125-4a6e-af1e-bf746670a5ea', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'协助客户准备通关资料：PL.INV.CONTRACT 等', CAST(0x0000A4F800000000 AS DateTime), NULL, N'', 10)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CBD540 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'dc0e1409-d6bf-47aa-9dfd-c27fc7d0163f', N'15aa3f24-964d-43e5-9329-148e81b8baf9', NULL, N'确定配送时间', CAST(0x0000A4F500000000 AS DateTime), CAST(0x0000A4F100000000 AS DateTime), N'', 6)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'0af46ce0-b611-483f-a422-c3fe19234e2f', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'安排包装、提货、配送至空运出口仓库', CAST(0x0000A4F200000000 AS DateTime), NULL, N'', 8)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'7b518bd2-35f9-4e03-b75a-c70e3a332a07', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'确定查看货量的日期', CAST(0x0000A4F300000000 AS DateTime), CAST(0x0000A4EB00000000 AS DateTime), N'', 5)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CBD540 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'8e3c5328-0072-4c93-b8f5-ca7feaa402dc', N'15aa3f24-964d-43e5-9329-148e81b8baf9', NULL, N'开发票、向日本发送debit note，收款及代理店付款', CAST(0x0000A4F100000000 AS DateTime), CAST(0x0000A4F200000000 AS DateTime), N'', 2)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDB90 AS DateTime), N'7e4c369e-5915-40d9-9919-ccc16af62cdf', N'2516b645-5f41-4b58-b886-f01068595b8a', NULL, N'清关完毕，确认配送时间', CAST(0x0000A4F200000000 AS DateTime), CAST(0x0000A4EF00000000 AS DateTime), N'', 5)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CBD540 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'5b01346e-6754-45e5-bb27-cd3b4187d66a', N'15aa3f24-964d-43e5-9329-148e81b8baf9', NULL, N'结算：业务一览表、代理店对账', CAST(0x0000A4F400000000 AS DateTime), CAST(0x0000A4F900000000 AS DateTime), N'', 5)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'0d816c6a-d761-4377-93ea-d0c6beb0f093', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'跟踪航班情况，跟踪目的地的清关情况', CAST(0x0000A50000000000 AS DateTime), NULL, N'', 12)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CAF0BC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'da261e05-4b01-4bba-89f7-d1e225b3dd7f', N'58be0a9d-052c-433a-a448-f052fc1d81db', NULL, N'清关完毕，确认配送时间', CAST(0x0000A4F000000000 AS DateTime), NULL, N'', 2)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'63b09fa0-af1d-4c7b-acc1-d40e72240464', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'结算：业务一览表', CAST(0x0000A4F200000000 AS DateTime), NULL, N'', 4)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'7b8441e4-9aaa-4890-b58f-d984bb25e613', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'提示客户将通关资料在货物到达仓库前寄送到通关公司', CAST(0x0000A4F200000000 AS DateTime), NULL, N'', 5)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'c31108aa-eef2-4707-906c-dbe6f67ff8ec', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'确认配送完毕时间，向客户汇报', CAST(0x0000A4F700000000 AS DateTime), NULL, N'', 10)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDA64 AS DateTime), N'2974ee1b-2be9-48a6-a49a-ea1ceb73c862', N'2516b645-5f41-4b58-b886-f01068595b8a', NULL, N'接收PRE-alert，通知报关公司，通知客户准备资料', CAST(0x0000A4F000000000 AS DateTime), CAST(0x0000A4EF00000000 AS DateTime), N'', 3)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDB90 AS DateTime), N'f4e409e2-c9c9-4b72-a9a8-ef3a70dbaf9d', N'2516b645-5f41-4b58-b886-f01068595b8a', NULL, N'结算：业务一览表', CAST(0x0000A4F600000000 AS DateTime), NULL, N'', 9)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CBD540 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'8ba8f2d2-d737-47a2-8273-f049a725c18b', N'15aa3f24-964d-43e5-9329-148e81b8baf9', NULL, N'确认是否到达中国', CAST(0x0000A4F800000000 AS DateTime), CAST(0x0000A4F200000000 AS DateTime), N'', 9)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB414C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'1a4b6bb5-03c3-4e09-b3ad-f10f6d41bac6', N'8596d570-f822-46c9-89e3-2055706e93ca', NULL, N'确定是否成交，若成交，则确定搬家日期和是否需要提前配送纸箱', CAST(0x0000A4F000000000 AS DateTime), CAST(0x0000A4F200000000 AS DateTime), N'', 2)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDB90 AS DateTime), N'873794bc-fb68-485d-ade4-f3723978bda7', N'2516b645-5f41-4b58-b886-f01068595b8a', NULL, N'和代理店对账，和客户对账', CAST(0x0000A4F400000000 AS DateTime), NULL, N'', 7)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDA64 AS DateTime), N'dff1da49-1e79-4f34-bf84-f7e065b10ae9', N'2516b645-5f41-4b58-b886-f01068595b8a', NULL, N'开发票、向日本发送debit note，收款及代理店付款', CAST(0x0000A4EE00000000 AS DateTime), NULL, N'', 1)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDB90 AS DateTime), N'5c464238-3150-4ddc-ba69-fa792195daab', N'2516b645-5f41-4b58-b886-f01068595b8a', NULL, N'配送，签收完毕', CAST(0x0000A4F300000000 AS DateTime), NULL, N'', 6)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), NULL, NULL, N'c81159ac-0f96-49b8-806e-fa905e14540a', N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', NULL, N'成交，确定提货时间', CAST(0x0000A4F500000000 AS DateTime), NULL, N'', 8)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'39ddb620-6b67-4b8c-869a-fc27d39cb139', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'开发票、收款及代理店付款', CAST(0x0000A4EA00000000 AS DateTime), CAST(0x0000A4EA00000000 AS DateTime), N'', 1)
INSERT [dbo].[ProcessStep] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [CustomerID], [StepID], [StepName], [EstimateDate], [FinishDate], [Memo], [Seq]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), NULL, NULL, N'657a48fd-e800-4072-851c-ff54aef27f98', N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', NULL, N'得到MABL/HABL确定预计的日程，汇报给客户', CAST(0x0000A4F900000000 AS DateTime), NULL, N'', 10)
/****** Object:  Table [dbo].[PriceList]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceList](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[ListID] [uniqueidentifier] NOT NULL,
	[LuggageAmount] [money] NULL,
	[Type] [nvarchar](10) NULL,
	[StartPlace] [nvarchar](200) NULL,
	[DestinationPlace] [nvarchar](200) NULL,
	[InterimPlace] [nvarchar](200) NULL,
	[CostOne] [money] NULL,
	[CostTwo] [money] NULL,
	[CostThree] [money] NULL,
	[Memo] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PriceList] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ListID], [LuggageAmount], [Type], [StartPlace], [DestinationPlace], [InterimPlace], [CostOne], [CostTwo], [CostThree], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E801717D10 AS DateTime), NULL, NULL, N'f991974e-370f-489d-afd4-505823a3f09a', 2.0000, N'KG', N'美国', N'中国', N'', NULL, NULL, NULL, N'')
INSERT [dbo].[PriceList] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ListID], [LuggageAmount], [Type], [StartPlace], [DestinationPlace], [InterimPlace], [CostOne], [CostTwo], [CostThree], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E80127E72C AS DateTime), NULL, NULL, N'f419d5ac-3edd-4adc-8970-607687e6d8b2', 3.0000, N'M³', N'武汉', N'东京', N'上海', 1000.0000, 2000.0000, 3000.0000, N'')
INSERT [dbo].[PriceList] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ListID], [LuggageAmount], [Type], [StartPlace], [DestinationPlace], [InterimPlace], [CostOne], [CostTwo], [CostThree], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E801718C4C AS DateTime), NULL, NULL, N'ef5a70f8-b883-435d-92a7-63ee6604d9ad', 2.0000, N'KG', N'香港', N'泰国', N'', NULL, NULL, NULL, N'')
INSERT [dbo].[PriceList] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ListID], [LuggageAmount], [Type], [StartPlace], [DestinationPlace], [InterimPlace], [CostOne], [CostTwo], [CostThree], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012822F0 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012D00A4 AS DateTime), N'd432c5d2-e33c-4e8a-bfd3-8e6e3d1308de', 2.0000, N'KG', N'广州', N'东京', N'', 4700.0000, NULL, NULL, N'')
INSERT [dbo].[PriceList] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ListID], [LuggageAmount], [Type], [StartPlace], [DestinationPlace], [InterimPlace], [CostOne], [CostTwo], [CostThree], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E47398 AS DateTime), NULL, NULL, N'01a5eee7-5038-4468-b13d-934824bccad1', 4.0000, N'M³', N'武汉', N'东京', N'上海', 3203.0000, 342.0000, 324.0000, N'发')
INSERT [dbo].[PriceList] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ListID], [LuggageAmount], [Type], [StartPlace], [DestinationPlace], [InterimPlace], [CostOne], [CostTwo], [CostThree], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5455C AS DateTime), NULL, NULL, N'2bd5b5d1-34ca-4c3d-9c8c-b9ce5269a584', 5.0000, N'M³', N'武汉', N'东京', N'上海', 21.0000, 321.0000, 434.0000, N'')
INSERT [dbo].[PriceList] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ListID], [LuggageAmount], [Type], [StartPlace], [DestinationPlace], [InterimPlace], [CostOne], [CostTwo], [CostThree], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E801280A54 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012D0EB4 AS DateTime), N'b0037c7b-7119-467e-9432-cd60f1183869', 1.0000, N'KG', N'广州', N'东京', N'', 4500.0000, NULL, NULL, N'')
/****** Object:  Table [dbo].[Organization]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[UnitGuid] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](200) NULL,
	[ParentCode] [nvarchar](200) NULL,
	[ParentGuid] [uniqueidentifier] NULL,
	[IsDisabled] [bit] NULL,
	[Icon] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'UnitGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'ParentCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级Guid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'ParentGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'IsDisabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织架构表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization'
GO
INSERT [dbo].[Organization] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UnitGuid], [Name], [Code], [ParentCode], [ParentGuid], [IsDisabled], [Icon]) VALUES (NULL, NULL, NULL, NULL, N'ae33dd32-eb04-48d8-a85f-36917c1f38cd', N'虹桥部门', N'hqbm', N'shgs', N'8d65e267-b528-464f-ae86-da677bce2dca', 0, N'fa fa-building blue')
INSERT [dbo].[Organization] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UnitGuid], [Name], [Code], [ParentCode], [ParentGuid], [IsDisabled], [Icon]) VALUES (NULL, NULL, NULL, NULL, N'fdde86ed-0f0b-42c4-a255-8ac9b65f6595', N'花样百出要', N'efdasdf', N'bjgs', N'a0bcd15c-9f84-4bf8-a30c-bbf5f7cc65a3', NULL, N'fa fa-building blue')
INSERT [dbo].[Organization] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UnitGuid], [Name], [Code], [ParentCode], [ParentGuid], [IsDisabled], [Icon]) VALUES (NULL, NULL, NULL, NULL, N'2cf92a95-4fba-4d82-80d4-95f2b847fd3f', N'洪山部门', N'hsbm', N'whgs', N'b72eb09e-03b2-44ea-9862-cd8a4b0d30be', 0, N'fa fa-university blue')
INSERT [dbo].[Organization] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UnitGuid], [Name], [Code], [ParentCode], [ParentGuid], [IsDisabled], [Icon]) VALUES (NULL, NULL, NULL, NULL, N'cf18f48b-f06e-4842-97d2-b00dd4b97a78', N'北京公司', N'bjgs', NULL, NULL, 0, N'')
INSERT [dbo].[Organization] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UnitGuid], [Name], [Code], [ParentCode], [ParentGuid], [IsDisabled], [Icon]) VALUES (NULL, NULL, NULL, NULL, N'a0bcd15c-9f84-4bf8-a30c-bbf5f7cc65a3', N'西单部门', N'xdbm', N'bjgs', N'cf18f48b-f06e-4842-97d2-b00dd4b97a78', 0, N'fa fa-university blue')
INSERT [dbo].[Organization] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UnitGuid], [Name], [Code], [ParentCode], [ParentGuid], [IsDisabled], [Icon]) VALUES (NULL, NULL, NULL, NULL, N'b72eb09e-03b2-44ea-9862-cd8a4b0d30be', N'武汉公司', N'whgs', NULL, NULL, 0, N'')
INSERT [dbo].[Organization] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [UnitGuid], [Name], [Code], [ParentCode], [ParentGuid], [IsDisabled], [Icon]) VALUES (NULL, NULL, NULL, NULL, N'8d65e267-b528-464f-ae86-da677bce2dca', N'上海公司', N'shgs', NULL, NULL, 0, N'')
/****** Object:  Table [dbo].[Menu]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[MenuGuid] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Url] [nvarchar](100) NULL,
	[ParentGuid] [uniqueidentifier] NULL,
	[Icon] [nvarchar](50) NULL,
	[OrderCode] [int] NULL,
	[IsSystem] [bit] NULL,
	[Remark] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'MenuGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ParentGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'OrderCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'IsSystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单导航表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu'
GO
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E70098B110 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E700998658 AS DateTime), N'3b930549-4e07-400d-bcbc-094bde474b8d', N'客户系统', N'1', NULL, N'fa fa-pencil-square-o blue', 1, 0, N'')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E70129C2F4 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7012AFAAC AS DateTime), N'c052bda3-d662-421c-a82f-24d0b7a402ee', N'报价列表', N'/System/PriceList.aspx', N'08008975-fff1-4f01-a3be-7bc8795f14b4', N'fa fa-money', 12, 0, N'报价列表')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (NULL, NULL, N'ad162ef9-9063-4baa-a12d-6b458796a4de', CAST(0x0000A47200ECC868 AS DateTime), N'c3cd31c6-fde6-4155-a3ac-31dd21da4e47', N'后台管理', N'/System/OrganizationList.aspx', NULL, N'fa fa-cogs blue', 99, 1, N'')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7009B6CAC AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00F98364 AS DateTime), N'aa5e7b3c-730c-4e8b-b7fd-4db380e08d75', N'月度统计列表', N'/System/CustomerMonthList.aspx', N'3b930549-4e07-400d-bcbc-094bde474b8d', N'fa fa-ship blue', 6, 0, N'处理中列表')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7009B43A8 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00F97680 AS DateTime), N'1b54ba19-754a-433c-b5f0-5239a14210fd', N'提醒列表', N'/System/CustomerAlertList.aspx', N'3b930549-4e07-400d-bcbc-094bde474b8d', N'fa fa-bell red', 4, 0, N'提醒列表')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (NULL, NULL, N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7008F1FD8 AS DateTime), N'6543bd8a-940e-45b2-899a-5b0e3f6e2f91', N'用户管理', N'/System/UserList.aspx', N'08008975-fff1-4f01-a3be-7bc8795f14b4', N'fa fa-user purple', 1, 1, N'')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7008F04E4 AS DateTime), NULL, NULL, N'542e2a67-37f8-4d8e-b334-5c0b60b83bd9', N'公司性质', N'/System/KeyValuePList.aspx?groupCode=CompanyCharacter', N'08008975-fff1-4f01-a3be-7bc8795f14b4', N'fa fa-joomla', 8, 0, N'公司性质')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7009B58C0 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00F99048 AS DateTime), N'8dd25ff8-e702-46da-9a70-72c76d3e55ae', N'客户统计列表', N'/System/CustomerStatisticList.aspx', N'3b930549-4e07-400d-bcbc-094bde474b8d', N'fa fa-check-circle-o green', 5, 0, N'已完成列表')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (NULL, NULL, N'ad162ef9-9063-4baa-a12d-6b458796a4de', CAST(0x0000A47200ECB92C AS DateTime), N'08008975-fff1-4f01-a3be-7bc8795f14b4', N'系统管理', N'/System/OrganizationList.aspx', NULL, N'fa fa-cog blue', 98, 1, N'')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E70090EEBC AS DateTime), NULL, NULL, N'c35b93ad-263e-4eef-8814-85e8311d8b45', N'支付方式', N'/System/KeyValuePList.aspx?groupCode=PayType', N'08008975-fff1-4f01-a3be-7bc8795f14b4', N'fa fa-credit-card', 9, 0, N'支付方式')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7009AB258 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E700D72170 AS DateTime), N'e16e9b9f-e275-4a25-ba44-9ec9810fdde7', N'代理店列表', N'/System/AgentCompanyList.aspx', N'3b930549-4e07-400d-bcbc-094bde474b8d', N'fa fa-motorcycle', 3, 0, N'代理店列表')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E700948C84 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E70099F5AC AS DateTime), N'dae215f3-e7ba-456d-b20f-a4980199b0b0', N'计量单位', N'/System/KeyValuePList.aspx?groupCode=UnitType', N'08008975-fff1-4f01-a3be-7bc8795f14b4', N'fa fa-flask', 11, 0, N'计量单位')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (NULL, NULL, N'ad162ef9-9063-4baa-a12d-6b458796a4de', CAST(0x0000A47200EE4544 AS DateTime), N'e634ec91-5f81-459c-8784-af4b0897ae7c', N'导航', N'/System/NavigationList.aspx', N'c3cd31c6-fde6-4155-a3ac-31dd21da4e47', N'fa fa-plane blue', 1, 1, N'')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E700938028 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7011198A0 AS DateTime), N'5c47c36b-0892-4011-9f07-b4f369395f2b', N'业务类型', N'/System/BusinessTypeList.aspx', N'08008975-fff1-4f01-a3be-7bc8795f14b4', N'fa fa-hospital-o', 10, 0, N'业务类型')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7009A4688 AS DateTime), NULL, NULL, N'2165f095-05b6-4e2e-a667-bdeb221d9e53', N'公司列表', N'/System/CompanyList.aspx', N'3b930549-4e07-400d-bcbc-094bde474b8d', N'fa fa-university', 2, 0, N'公司列表')
INSERT [dbo].[Menu] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [MenuGuid], [Name], [Url], [ParentGuid], [Icon], [OrderCode], [IsSystem], [Remark]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E700994F44 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E7009AC518 AS DateTime), N'7752fbed-adc6-482e-b4a1-c05c59d45f00', N'客户列表', N'/System/CustomerList.aspx', N'3b930549-4e07-400d-bcbc-094bde474b8d', N'fa fa-user-secret', 1, 0, N'客户列表')
/****** Object:  Table [dbo].[KeyValuePair]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyValuePair](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](10) NULL,
	[Group] [nvarchar](50) NULL,
	[Remark] [nvarchar](200) NULL,
	[ParentGuid] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair', @level2type=N'COLUMN',@level2name=N'ParentGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'键值对表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeyValuePair'
GO
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'522afac9-00f6-484d-8da2-0497ae2d81a2', N'0004', N'支付宝', N'PayType', N'', NULL)
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'6525a1db-fad4-447f-a9cc-18dbcba88834', N'0002', N'民营企业', N'CompanyCharacter', N'民营企业', NULL)
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'd6352e6b-482c-4257-b8e9-3a3bf29089fc', N'0003', N'国企', N'CompanyCharacter', N'', NULL)
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'e47ae6fd-6e73-4072-87b1-3f0bdb0dc2c5', N'0003', N'红包', N'PayType', N'', NULL)
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'35d8a9a7-de5c-423f-a56d-650d0a4c599d', N'0001', N'M³', N'UnitType', N'体积', NULL)
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'acddaa9e-e67c-4f76-b04f-8149f54e8147', N'0001', N'国内支付', N'PayType', N'', NULL)
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'981bc3f4-3e03-49e2-95e4-8e5b302ac671', N'0002', N'KG', N'UnitType', N'重量', NULL)
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'46a4a1a5-0cf2-42fd-b056-9a70700671a5', N'0005', N'微信', N'PayType', N'', NULL)
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'ace3460d-2bad-4ada-850c-be5d1dbcf359', N'0002', N'跨国支付', N'PayType', N'', NULL)
INSERT [dbo].[KeyValuePair] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ID], [Code], [Name], [Group], [Remark], [ParentGuid]) VALUES (NULL, NULL, NULL, NULL, N'f8769a13-fde9-401c-9429-df9f0e4b4c54', N'0001', N'制造型企业', N'CompanyCharacter', N'制造型企业', NULL)
/****** Object:  Table [dbo].[FunctionInfo]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionInfo](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[FunctionGuid] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) NULL,
	[Name] [nvarchar](20) NULL,
	[SystemGuid] [uniqueidentifier] NULL,
	[Remark] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[FunctionGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo', @level2type=N'COLUMN',@level2name=N'FunctionGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo', @level2type=N'COLUMN',@level2name=N'SystemGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FunctionInfo'
GO
INSERT [dbo].[FunctionInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [FunctionGuid], [Code], [Name], [SystemGuid], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'd41bd1f7-516c-43f6-ad9c-1463350a4e2b', N'2', N'前台页面建模模块', N'b32cb0be-f79c-4ee1-8685-8c4e026ea937', N'后台管理')
INSERT [dbo].[FunctionInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [FunctionGuid], [Code], [Name], [SystemGuid], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'c6c6d1f0-4d41-4f6d-b359-173345a10905', N'1', N'后台模块', N'b32cb0be-f79c-4ee1-8685-8c4e026ea937', N'系统管理')
INSERT [dbo].[FunctionInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [FunctionGuid], [Code], [Name], [SystemGuid], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'6bc38b1c-48b2-46a4-a137-2efafd060639', N'23', N'我的模块', N'5324bd64-a4bc-4132-bf5b-d782cd99d8b3', N'd')
INSERT [dbo].[FunctionInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [FunctionGuid], [Code], [Name], [SystemGuid], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'a1d8bdbf-e918-45fd-93d2-8c708cb80e28', N'式34', N'请不要动系统模块', N'5324bd64-a4bc-4132-bf5b-d782cd99d8b3', N'34')
/****** Object:  Table [dbo].[Customer]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CompanyID] [uniqueidentifier] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[DeliveryAddress] [nvarchar](200) NULL,
	[LuggageAmount] [int] NULL,
	[LuggageUnit] [nvarchar](50) NULL,
	[Job] [nvarchar](50) NULL,
	[BirthDay] [datetime] NULL,
	[StartAddress] [nvarchar](200) NULL,
	[StartPlace] [nvarchar](200) NULL,
	[DestinationPlace] [nvarchar](200) NULL,
	[InterimPlace] [nvarchar](200) NULL,
	[AgentOne] [uniqueidentifier] NULL,
	[AgentOneCost] [money] NULL,
	[AgentOnePayment] [money] NULL,
	[AgentTwo] [uniqueidentifier] NULL,
	[AgentTwoCost] [money] NULL,
	[AgentTwoPayment] [money] NULL,
	[AgentThree] [uniqueidentifier] NULL,
	[AgentThreeCost] [money] NULL,
	[AgentThreePayment] [money] NULL,
	[BidCost] [money] NULL,
	[SaleAmount] [money] NULL,
	[FactCost] [money] NULL,
	[Profit] [money] NULL,
	[IsDamaged] [bit] NULL,
	[HasFutureBusiness] [bit] NULL,
	[Comment] [nvarchar](50) NULL,
	[BusinessType] [uniqueidentifier] NULL,
	[Memo] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CustomerID], [Name], [CompanyID], [Phone], [Email], [DeliveryAddress], [LuggageAmount], [LuggageUnit], [Job], [BirthDay], [StartAddress], [StartPlace], [DestinationPlace], [InterimPlace], [AgentOne], [AgentOneCost], [AgentOnePayment], [AgentTwo], [AgentTwoCost], [AgentTwoPayment], [AgentThree], [AgentThreeCost], [AgentThreePayment], [BidCost], [SaleAmount], [FactCost], [Profit], [IsDamaged], [HasFutureBusiness], [Comment], [BusinessType], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00CB5584 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DC5960 AS DateTime), N'15aa3f24-964d-43e5-9329-148e81b8baf9', N'123', N'e14d6b9b-a50c-4195-a37e-faad82dde1b5', N'', N'', N'', 3, N'M³', N'', NULL, N'', N'武汉', N'东京', N'上海', NULL, 1000.0000, 0.0000, NULL, 2000.0000, 0.0000, NULL, 3000.0000, 0.0000, 6000.0000, 0.0000, 0.0000, 0.0000, NULL, 1, N'优', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'')
INSERT [dbo].[Customer] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CustomerID], [Name], [CompanyID], [Phone], [Email], [DeliveryAddress], [LuggageAmount], [LuggageUnit], [Job], [BirthDay], [StartAddress], [StartPlace], [DestinationPlace], [InterimPlace], [AgentOne], [AgentOneCost], [AgentOnePayment], [AgentTwo], [AgentTwoCost], [AgentTwoPayment], [AgentThree], [AgentThreeCost], [AgentThreePayment], [BidCost], [SaleAmount], [FactCost], [Profit], [IsDamaged], [HasFutureBusiness], [Comment], [BusinessType], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DB4278 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DCA7E4 AS DateTime), N'8596d570-f822-46c9-89e3-2055706e93ca', N'12', N'97f83f10-3150-4254-848e-6829e67e87e7', N'', N'', N'', 3, N'M³', N'', NULL, N'', N'武汉', N'东京', N'上海', NULL, 1000.0000, 0.0000, NULL, 2000.0000, 0.0000, NULL, 3000.0000, 0.0000, 6000.0000, 0.0000, 0.0000, 0.0000, NULL, 1, N'优', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'')
INSERT [dbo].[Customer] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CustomerID], [Name], [CompanyID], [Phone], [Email], [DeliveryAddress], [LuggageAmount], [LuggageUnit], [Job], [BirthDay], [StartAddress], [StartPlace], [DestinationPlace], [InterimPlace], [AgentOne], [AgentOneCost], [AgentOnePayment], [AgentTwo], [AgentTwoCost], [AgentTwoPayment], [AgentThree], [AgentThreeCost], [AgentThreePayment], [BidCost], [SaleAmount], [FactCost], [Profit], [IsDamaged], [HasFutureBusiness], [Comment], [BusinessType], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00E5BBB8 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE011B3464 AS DateTime), N'4a9e24e0-fa8c-44cf-9136-64041b4800b4', N'北美客户', N'97f83f10-3150-4254-848e-6829e67e87e7', N'123', N'213', N'123', NULL, N'M³', N'142', CAST(0x0000A4EE00000000 AS DateTime), N'124', N'武汉', N'东京', N'上海', NULL, 21.0000, 120.0000, NULL, 321.0000, 322.0000, NULL, 434.0000, 231.0000, 776.0000, 2000.0000, 673.0000, 1327.0000, 1, NULL, N'良', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'')
INSERT [dbo].[Customer] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CustomerID], [Name], [CompanyID], [Phone], [Email], [DeliveryAddress], [LuggageAmount], [LuggageUnit], [Job], [BirthDay], [StartAddress], [StartPlace], [DestinationPlace], [InterimPlace], [AgentOne], [AgentOneCost], [AgentOnePayment], [AgentTwo], [AgentTwoCost], [AgentTwoPayment], [AgentThree], [AgentThreeCost], [AgentThreePayment], [BidCost], [SaleAmount], [FactCost], [Profit], [IsDamaged], [HasFutureBusiness], [Comment], [BusinessType], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012A2C6C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE012F771C AS DateTime), N'62bfe8a6-1ef3-4722-aedd-c3c27bdbe4b6', N'客户', N'7b681e0b-9513-4b67-80ad-f4f63ea90847', N'171723', N'abc@qq.com', N'光谷软件园', 12, N'KG', N'软件开发', CAST(0x0000A4EB00000000 AS DateTime), N'武汉', N'武汉', N'东京', N'上海', N'b25c68b4-9e43-4ead-93bd-a47afd60fbe2', 1000.0000, 1100.0000, N'4f2d54b0-2a0d-426c-8e37-20da470e5003', 2000.0000, 2200.0000, N'36a251c8-dee9-4bbd-8d0b-615ef1578850', 3000.0000, 2900.0000, 6000.0000, 9000.0000, 6200.0000, 2800.0000, 0, 1, N'良', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'543')
INSERT [dbo].[Customer] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CustomerID], [Name], [CompanyID], [Phone], [Email], [DeliveryAddress], [LuggageAmount], [LuggageUnit], [Job], [BirthDay], [StartAddress], [StartPlace], [DestinationPlace], [InterimPlace], [AgentOne], [AgentOneCost], [AgentOnePayment], [AgentTwo], [AgentTwoCost], [AgentTwoPayment], [AgentThree], [AgentThreeCost], [AgentThreePayment], [BidCost], [SaleAmount], [FactCost], [Profit], [IsDamaged], [HasFutureBusiness], [Comment], [BusinessType], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EE00FC2088 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00DEDB90 AS DateTime), N'2516b645-5f41-4b58-b886-f01068595b8a', N'中国客户', N'd79d030d-a328-41e7-9df4-69cac6ed866a', N'af', N'fda', N'村', 0, N'M³', N'伯', CAST(0x0000A4F400000000 AS DateTime), N'423', N'武汉', N'东京', N'上海', N'3e86fe14-cf69-4cd5-8141-d03edb608cb2', 21.0000, 1212.0000, N'3e86fe14-cf69-4cd5-8141-d03edb608cb2', 321.0000, 1232.0000, N'3e86fe14-cf69-4cd5-8141-d03edb608cb2', 434.0000, 23.0000, 776.0000, 12313.0000, 2467.0000, 9846.0000, NULL, NULL, N'差', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'大地期权')
INSERT [dbo].[Customer] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CustomerID], [Name], [CompanyID], [Phone], [Email], [DeliveryAddress], [LuggageAmount], [LuggageUnit], [Job], [BirthDay], [StartAddress], [StartPlace], [DestinationPlace], [InterimPlace], [AgentOne], [AgentOneCost], [AgentOnePayment], [AgentTwo], [AgentTwoCost], [AgentTwoPayment], [AgentThree], [AgentThreeCost], [AgentThreePayment], [BidCost], [SaleAmount], [FactCost], [Profit], [IsDamaged], [HasFutureBusiness], [Comment], [BusinessType], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00C6582C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00E05038 AS DateTime), N'58be0a9d-052c-433a-a448-f052fc1d81db', N'1', N'97f83f10-3150-4254-848e-6829e67e87e7', N'', N'', N'', 0, N'M³', N'', NULL, N'', N'武汉', N'东京', N'上海', NULL, 1000.0000, 213.0000, NULL, 2000.0000, 123.0000, NULL, 3000.0000, 13.0000, 6000.0000, 12332.0000, 349.0000, 11983.0000, NULL, 1, N'优', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'')
/****** Object:  Table [dbo].[Company]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[CompanyID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Logo] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Character] [nvarchar](50) NULL,
	[PayType] [nvarchar](50) NULL,
	[IdentifyCode] [nvarchar](100) NULL,
	[BankCardNumber] [nvarchar](100) NULL,
	[BankName] [nvarchar](100) NULL,
	[Contact] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](50) NULL,
	[AirLuggageLimit] [int] NULL,
	[ShippingLuggageLimit] [int] NULL,
	[Japanese] [int] NULL,
	[MainBusiness] [nvarchar](500) NULL,
	[Memo] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E801611E70 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00BF886C AS DateTime), N'5086eb8c-c760-47c0-86d9-2cfb38e0dece', N'13', NULL, N'1231', N'0001', N'0001', N'', N'', N'', N'131231', N'', N'', NULL, NULL, 0, N'', N'')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8016121F4 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00BF84E8 AS DateTime), N'2c4fd756-0bbd-44be-9d2e-5a4d1e2dcaa5', N'123', NULL, N'1312', N'0001', N'0001', N'', N'', N'', N'13123', N'', N'', NULL, NULL, 0, N'', N'')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8016126A4 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A56A0179C95A AS DateTime), N'97f83f10-3150-4254-848e-6829e67e87e7', N'13', NULL, N'132', N'0001', N'0001', N'', N'', N'', N'1231321', N'', N'', NULL, NULL, 0, N'', N'')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8016135E0 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00BF90A0 AS DateTime), N'd79d030d-a328-41e7-9df4-69cac6ed866a', N'132', NULL, N'123', N'0001', N'0001', N'', N'', N'', N'132', N'', N'', NULL, NULL, 0, N'', N'')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E80161325C AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00BF9424 AS DateTime), N'1b588622-652f-4659-8e9b-9685c4af7638', N'13', NULL, N'123', N'0001', N'0001', N'', N'', N'', N'123123', N'', N'', NULL, NULL, 0, N'', N'')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E801292E20 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00BF9B2C AS DateTime), N'895e6dde-37b8-4601-bfd7-a841bc707a68', N'北京公司', N'b7bd6c599b234126b9d1cfa171930d10.jpg', N'北京', N'0003', N'0003', N'瓢sdf标识', N'3白3白3', N'24234', N'234', N'234234', N'234', 22, 32, 11, N'323', N'2323')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E801292E20 AS DateTime), NULL, NULL, N'85aa59a8-d467-4311-9054-e1a62ed48e4a', N'武汉公司', N'b7bd6c599b234126b9d1cfa171930d10.jpg', N'北京', N'0003', N'0003', N'瓢sdf标识', N'3白3白3', N'24234', N'234', N'234234', N'234', 22, 32, 11, N'323', N'2323')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E801292E20 AS DateTime), NULL, NULL, N'7b681e0b-9513-4b67-80ad-f4f63ea90847', N'上海公司', N'b7bd6c599b234126b9d1cfa171930d10.jpg', N'北京', N'0003', N'0003', N'瓢sdf标识', N'3白3白3', N'24234', N'234', N'234234', N'234', 22, 32, 11, N'323', N'2323')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8016119C0 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00BF967C AS DateTime), N'c865f2b8-e760-40a3-b908-f5415902ab92', N'2131312', NULL, N'131231', N'0001', N'0001', N'', N'', N'', N'132132', N'', N'', NULL, NULL, 0, N'', N'')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E801496820 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00BF8038 AS DateTime), N'e0c815ba-0b82-4667-9f31-fa1bd6de0d53', N'1', NULL, N'2', N'0001', N'0001', N'', N'', N'', N'3', N'', N'323', 2, NULL, 0, N'', N'')
INSERT [dbo].[Company] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [CompanyID], [Name], [Logo], [Address], [Character], [PayType], [IdentifyCode], [BankCardNumber], [BankName], [Contact], [Email], [Mobile], [AirLuggageLimit], [ShippingLuggageLimit], [Japanese], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E801612A28 AS DateTime), N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4EF00BF8AC4 AS DateTime), N'e14d6b9b-a50c-4195-a37e-faad82dde1b5', N'13', NULL, N'1231', N'0001', N'0001', N'', N'', N'', N'321231', N'', N'', NULL, NULL, 0, N'', N'')
/****** Object:  Table [dbo].[BusinessType]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessType](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[TypeID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[ParentID] [uniqueidentifier] NULL,
	[Name] [nvarchar](100) NULL,
	[Material] [nvarchar](1000) NULL,
	[Time] [nvarchar](50) NULL,
	[Memo] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'50bb3e9e-23aa-412d-8c63-0378c272d98c', N'1.3.3', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'提示客户需要准备的资料，上门取通关所需资料', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'1b8b8568-791c-415d-bb82-063275e61336', N'2.3.8', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'结算：业务一览表', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'3cd921f9-ae23-4a83-86ab-06e3e9ad8f8f', N'2.2.12', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'开发票、收款及代理店付款', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'bbf029ee-1bae-4b7c-8398-0b5a5842d085', N'1.2.5', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'确定是否成交，若成交，则确定搬家日期和是否需要提前配送纸箱', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'2.3', NULL, N'货运海运进口', N'货物到达上海前
1. MBL（上海雅玛多公章）
2. 提货保函（上海雅玛多公章）
3. exw条件下 运费（上海雅玛多公章）
1~3寄给锦海捷亚fanny

1．发票、箱单、合同（收货人盖章原件各一份）
2. 报关委托书（公章+法人章一份）
3. 报检委托书（公章）
4. 申报要素（公章）', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'420ab064-e84b-4437-beae-0ceb2653fe68', N'1.2.10', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'结算：业务一览表、代理店对账', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E6404 AS DateTime), NULL, NULL, N'97833a59-6a84-4e54-bbdd-0f47c7fa4b4e', N'2.6', NULL, N'测试数据', N'', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'6d04c502-bd1e-47c0-b2dc-0f8155241ccf', N'2.5.1', N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'接到客户咨询电话，确定托运详细信息', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'a08da9da-15d4-4c08-b346-1585d7c03361', N'2.4.4', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'给代理店提交报关委托书、保险购买申请书', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'5c40ec68-5d40-4642-8478-15b55beb0432', N'2.5.8', N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'开发票、收款及代理店付款', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'64d40106-f735-49bf-a301-16b680c6de67', N'2.1.8', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'开发票、向日本发送debit note，收款及代理店付款', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'5b41c310-9fd4-4542-9557-173f8c4a8497', N'2.1.9', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'整理存档资料，装订成册。', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'd65bfbc9-82ed-4432-b0f9-1e93cc2d60d0', N'2.5.9', N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'整理存档资料、装订成册', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'1.1', NULL, N'搬家空运进口', N'1．パスポートコピー（扫描件可）
2．居留許可コピー（扫描件可）
3．就業証コピー（扫描件可）
4．《中国人民共和国海关进出境旅客行李物品申报单》（红色）
寄送地址：上海市江宁路1145号2-404
崔家正 136-0171-5926

開梱道具：ナイフ、ねじ回し等々（総じて、工具といいます）
5．配達シート
', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'3cdba3dc-a9c8-42e4-ac9d-26064481d4b2', N'1.5.4', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'提交报价', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'8ff5272e-4e59-48bf-8a11-2748bcbd2967', N'2.4.13', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'整理存档资料、装订成册', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'f55ba029-133c-47e7-abc7-2911766df56e', N'1.4', NULL, N'搬家海运出口', N'1. 引越受付表
2．下見表
3．引越案内書1&2
4．海上保険同意書
5．海外引越申込書
6．別送品申告書
7．番号シール
8．PL
9．航空便玄関渡しシール
10．パスポートコピー
11．就業証／専家証コピー
12．E－TICKET
', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'2e469c5e-ba6a-43eb-bee4-2926e22bcbbe', N'1.1.6', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'配送、拆包装、说明保险赔付问题', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'42f6eb1b-8b35-46df-9842-294af2fe545c', N'2.5.4', N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'提货，准备签收单，确认是否需要到场监督', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'e9da98f6-27dd-49a3-8b89-2ecaae3b8162', N'1.3.1', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'确认就业证&居留许可的预计发行日期', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'1.3', NULL, N'搬家海运进口', N'1起运地发送的资料，
2护照照片页、3入境章、4签证页
5就业证照片页、6有效期页、7编码页复印件（签字，2套）
8护照/就业证原件、
9提单、10提货单、11报关委托书
12非木质包装证明、
13出入境检验检疫海运集装箱私人行李物品申报单、
14物品清单、
15中华人民共和国私人物品入境申报表&附表（签字，一套）
16．《中国人民共和国海关进出境旅客行李物品申报单》（红色）
17．配達シート、開梱工具', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'09f2d496-74ea-4d17-8b8b-323a08049140', N'1.4.4', N'f55ba029-133c-47e7-abc7-2911766df56e', N'提交报价', NULL, N'0', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'99a63141-7a77-4b94-8b9a-324f64badd4c', N'1.1.8', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'开发票、向日本发送debit note，收款及代理店付款', NULL, N'3', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'e6f25c1b-0174-4ef2-9aae-32dd73d77486', N'2.2.11', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'结算：业务一览表', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'036a16b0-f26f-44e8-a394-3551efcfb33b', N'1.2.11', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'整理存档资料，装订成册。', NULL, N'2', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'1.2', NULL, N'搬家空运出口', N'1. 引越受付表
2．下見表
3．引越案内書1&2
4．海上保険同意書
5．海外引越申込書
6．別送品申告書
7．番号シール
8．PL
9．航空便玄関渡しシール
10．パスポートコピー
11．就業証／専家証コピー
12．E－TICKET
', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'10d4386f-ae7a-494d-8989-374d80fa098b', N'2.3.5', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'清关完毕，确认配送时间', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'4f222e4d-be28-4172-90c8-3ac07cb8ffa0', N'2.1.1', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'接收PRE-alert，通知报关公司，通知客户准备资料', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'f11d4bbd-0e18-4cd2-9367-3f4b5e65dde9', N'2.4.5', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'安排包装、提货、配送至空运出口仓库', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'8c8848c4-84e0-4458-a1a0-40ec0dc9d41e', N'2.3.4', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'确定清关预计时间，通知客户网付，汇报其他意外情况', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'02f04903-3dc4-4207-b275-472a5fdf857c', N'2.5.7', N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'结算：业务一览表', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'9da29710-3017-4040-9a8d-484539f2a365', N'1.5.5', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'确定是否成交，若成交，则确定搬家日期和是否需要提前配送纸箱', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'ef3e4691-954f-4685-9896-4daf79ed4013', N'1.1.2', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'提示客户向报关行提交资料，查看资料是否完整', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'a4a1e325-6e0f-49a7-8485-523293f12e11', N'1.5.3', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'上门查看货量，确定货量，向客户解释搬家要点', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'9b9e50b3-4430-446d-b28f-52f7cf5c6071', N'1.1.4', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'确定仓库地址及联系人、预计到达时间', NULL, N'3', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'de5ba08e-63db-4c79-b807-5365a876e08a', N'2.2.13', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'整理存档资料、装订成册', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'df560e63-2d59-4a50-a57e-53a7bc2ab21b', N'1.3.6', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'确定仓库地址及联系人、预计到达时间', NULL, N'4', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'2.1', NULL, N'货运空运进口', N'1．发票、箱单、合同（收货人盖章原件各一份）
2. 报关委托书（公章+法人章一份）
3. 报检委托书（公章）
4. 申报要素（公章）
5. airwaybill（公章）

寄送地址：湖北省武汉市东西湖区常青北路花园三村102号47-3  陈芳  027-85824800', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'850c1370-d889-4ed5-94ed-556ceeeb86f1', N'2.2.6', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'确定通关情况及订舱情况', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'8353e65a-239e-4d20-93ef-573949b4d8f4', N'2.1.2', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'货物到达前确认资料是否完整无误的寄送到通关公司', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'7242ac12-137f-40e2-ba97-5bc4dbb7169d', N'2.3.3', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'货物到达前确认资料是否完整无误的寄送到通关公司', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'7a2b591b-bdba-4d76-ab7c-5d454223ef05', N'2.4.10', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'和代理店对账，和客户对账', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'60c0054c-6857-4cd0-ab25-5e87499ddf7d', N'1.2.6', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'配送纸箱、打包、提货、填写订舱资料', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'764ef1e9-d4ee-4a9d-a80b-5fd6e3cfb434', N'2.4.9', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'确认配送完毕时间，向客户汇报', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'739cae84-6455-4e33-8a0e-6004b075aa05', N'2.3.10', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'整理存档资料，装订成册。', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'76e5b5bd-a078-4b05-a695-63f010b8e4bf', N'1.4.5', N'f55ba029-133c-47e7-abc7-2911766df56e', N'确定是否成交，若成交，则确定搬家日期和是否需要提前配送纸箱', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'bf89fc4d-0fe7-43c8-ad32-69e89c8b0da8', N'1.2.9', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'将“BL+出口通关资料”发送给日本进口搬家负责人', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'28c96a27-5081-49f7-9da8-6ac7f44e8c04', N'2.5.3', N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'成交，确定提货日期', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'5d7c1542-d677-47bf-aed7-6cfab98177cd', N'2.1.4', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'清关完毕，确认配送时间', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'1536fef8-0c75-46ef-9ff0-6f1f73f5a394', N'1.4.9', N'f55ba029-133c-47e7-abc7-2911766df56e', N'代理店发送BL', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'86b09ad9-48c0-4d23-9583-700aba9bca0a', N'2.5.6', N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'和代理店对账，和客户对账', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'a2b61f12-9bd3-4779-b122-7bdcc0ad0111', N'1.2.1', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'得到客户搬家的业务咨询，介绍搬家流程，听取客户需求', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'63d541a9-5020-4d18-b2b6-7cb7b6a0cb97', N'2.4.2', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'成交，确定提货时间', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'32155ca3-aecd-43c9-8e86-7ffe7dbfa875', N'1.4.7', N'f55ba029-133c-47e7-abc7-2911766df56e', N'配送纸箱、打包、提货、填写订舱资料', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'75ab3c55-aa35-4f37-991d-80322138a194', N'2.1.5', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'配送，签收完毕', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'bc17dafd-9112-4670-a69c-826b8017dc73', N'1.3.4', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'将资料交给对应的报关负责人', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'56cdc2ca-aa83-4b96-84d8-841a4023d0fc', N'1.4.2', N'f55ba029-133c-47e7-abc7-2911766df56e', N'确定查看货量的日期', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'52642e89-ab90-4422-b612-84fcf51a915e', N'1.2.3', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'上门查看货量，确定货量，向客户解释搬家要点', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'9e720613-bf0c-4ac5-ad25-85a5604c58e3', N'2.2.7', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'得到MABL/HABL确定预计的日程，汇报给客户', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'412f755e-0bc4-4e27-b84c-86eb71da5080', N'1.5.6', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'配送纸箱、打包、提货、向接货方发送行李信息', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'79c566d0-f0db-493f-b563-8b277f589d08', N'2.2.1', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'确定货量、包装要求及其他特殊要求、据此提交费用预算', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'00fe2048-ca88-430a-88eb-8fa6294e6d74', N'1.3.11', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'整理存档资料，装订成册', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'853529f2-25a9-4d27-95cf-90db0403713e', N'2.3.9', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'开发票、向日本发送debit note，收款及代理店付款', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'91681343-9b3d-4f69-a1ae-9123abc74018', N'1.2.7', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'向代理店发送出口通关签字资料及订舱委托书', NULL, N'0', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'51971f62-0a9f-4fac-8261-9573580fa81b', N'1.4.12', N'f55ba029-133c-47e7-abc7-2911766df56e', N'整理存档资料，装订成册。', NULL, N'0', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'f4e260db-eb63-43a1-be7d-95dce96a56ad', N'2.5.5', N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'配送完毕', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'4d606b30-4196-41ca-8cd1-98123b3e6d65', N'1.2.8', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'代理店发送BL', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'eee24848-a9fc-4f8f-b451-98e5d3358796', N'2.1.6', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'和代理店对账，和客户对账', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'120c6da0-3616-44a1-b080-9bcee33b4189', N'1.4.3', N'f55ba029-133c-47e7-abc7-2911766df56e', N'上门查看货量，确定货量，向客户解释搬家要点', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'f1d94827-afac-4bfd-8601-9bd784fe831f', N'1.3.8', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'配送、拆包装、说明保险赔付问题', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'2.2', NULL, N'货运空运出口', N'1. 发票、箱单（发货人盖章原件一份）
2. 报关委托书（公章+法人章一份）
3. 报检委托书（公章）
4. 申报要素（公章）
5. 保险购买申请书
6. 保费通知单
7. 空运主单托书
8. 空运分单托书', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'89013ba3-b825-4d4d-867f-9c7d77fc9f56', N'2.1.3', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'确定清关预计时间，通知客户网付，汇报其他意外情况', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'c9fbc0d1-1f06-4ef8-91c7-a02f763d6d01', N'1.3.9', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'结算：业务一览表、代理店对账', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'7ab75ad8-f0fe-428a-af3d-a3a173fabfb1', N'1.1.7', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'结算：业务一览表、代理店对账', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'8ddab89e-5be8-4210-8c3e-a55348793899', N'1.3.5', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'确定行李放行日期', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'1c823964-f06c-4ad2-a65c-a5ff6c14ac0e', N'1.4.11', N'f55ba029-133c-47e7-abc7-2911766df56e', N'结算：业务一览表、代理店对账', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'7949f157-5f5a-46e1-a649-a60d90716a3a', N'2.4.8', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'跟踪航班情况，跟踪目的地的清关情况', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'ab3ca17f-0b29-4330-99c3-a6a7ae266676', N'2.2.4', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'给代理店提交报关委托书、保险购买申请书', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'b63347d3-ee7d-4d8a-a96e-a7445c5646cb', N'2.3.6', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'配送，签收完毕', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'5a8a580f-d44b-44f6-bb03-a7df62aba84c', N'2.2.2', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'成交，确定提货时间', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'2e567346-98e8-4620-aa3c-a7fd585d49b3', N'1.5.7', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'确认是否完成配送', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'1100502f-fc93-4359-9e8d-a90f12eb9627', N'1.5.9', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'开票，向客户收款', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'59be76c8-2395-45c5-863b-adf82b10cfbb', N'2.2.8', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'跟踪航班情况，跟踪目的地的清关情况', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'f5408be6-28d3-45d5-b2a3-b33c04d74d4b', N'2.3.1', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'接收PRE-alert，通知报关公司，通知客户准备资料', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'2.5', NULL, N'货运国内/市内', N'1. 投保申请书
2. 雅玛多送货凭证
3. 物品清单&投保金额
4. 国内运输指示单', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'e1c35cd2-34d5-4a65-bb7d-b44a8fc6d364', N'2.4.6', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'确定通关情况及订舱情况', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'90c2856c-5171-4365-832e-b590d4ebdf30', N'1.1.5', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'确定配送时间', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'1316f3ae-52d3-406c-9628-b5b0bfc7e283', N'2.4.7', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'得到MABL/HABL确定预计的日程，汇报给客户', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'b58fee52-9a54-4837-9710-b5b388030a2e', N'1.5', NULL, N'搬家国内/市内', N'1. 国内·市内用保险赔偿同意书
2.下見書
3．国内引越申込書
4．番号シール
5．パッキングリスト
6．分解工具
', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'f9532f60-fd3e-4808-85b9-b8133b6c7b84', N'1.4.10', N'f55ba029-133c-47e7-abc7-2911766df56e', N'将“BL+出口通关资料”发送给日本进口搬家负责人', NULL, N'0', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'98765326-1c5e-4bd1-9710-bb223f1f7891', N'2.2.3', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'提示客户将通关资料在货物到达仓库前寄送到通关公司', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'65e28175-1bf4-4729-b4c4-bd8994421375', N'1.2.4', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'提交报价', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'98669382-ed9e-49cf-912f-befc9a377377', N'1.3.10', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'开发票、向日本发送debit note，收款及代理店付款', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'a18220dd-3ddb-489b-9908-c0828c966a8c', N'1.1.9', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'整理存档资料，装订成册', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'2832bc4e-22f2-4820-96ef-c1da6f5d4506', N'2.4.3', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'提示客户将通关资料在货物到达仓库前寄送到通关公司', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'ed31859b-2d3c-402d-9049-ca4dceba1ff1', N'1.4.1', N'f55ba029-133c-47e7-abc7-2911766df56e', N'得到客户搬家的业务咨询，介绍搬家流程，听取客户需求', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'a6a44a70-7d76-4dea-988a-ce573702f50f', N'1.5.1', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'得到客户搬家的业务咨询，介绍搬家流程，听取客户需求', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'6c7f7286-bf55-441a-bbc7-d484bb4557ca', N'2.2.9', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'确认配送完毕时间，向客户汇报', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'441386f9-79aa-4bad-ad98-d6d0a6a99b76', N'2.4.12', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'开发票、收款及代理店付款', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'11c8358a-08b5-463b-8a6d-d84a527f6de8', N'1.1.3', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'确定行李放行日期', NULL, N'5', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DC4A4 AS DateTime), NULL, NULL, N'f7b7185a-499f-464f-aab7-dac08fa6f686', N'1.4.8', N'f55ba029-133c-47e7-abc7-2911766df56e', N'向代理店发送出口通关签字资料及订舱委托书', NULL, N'0', NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'79ead6fe-b757-4afa-a0c8-dcc5b948eff3', N'1.3.7', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'确定配送时间', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'6fd087f3-a5a4-46d5-9075-e1417b2555cc', N'2.4.1', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'确定货量、包装要求及其他特殊要求、据此提交费用预算', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D774C AS DateTime), NULL, NULL, N'7cee4be5-d23d-4f5b-8800-e53089209cc1', N'1.1.1', N'1e74043f-f68c-442e-ab1d-204d4737dd32', N'确认是否到达中国', NULL, N'0', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DA758 AS DateTime), NULL, NULL, N'e1ad8d13-74e2-405a-9920-e651c2bd4231', N'1.3.2', N'3ca6f881-e2a4-4bbd-99d5-3005655af90b', N'确认护照、就业证原件的可借用时间段，确定取资料日期', NULL, N'1', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'bdc9cc50-84ee-4c4b-8ec6-e6ff90f52c7a', N'1.5.2', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'确定查看货量的日期', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'bcc15536-40e6-4f0d-917a-ec7dfd06661e', N'2.2.10', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'和代理店对账，和客户对账', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E0770 AS DateTime), NULL, NULL, N'b0f70bf2-e211-45d3-8abe-ed22cd6ea656', N'2.2.5', N'3abb2dc7-6852-4020-b78b-9c7c994d148f', N'安排包装、提货、配送至空运出口仓库', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E54C8 AS DateTime), NULL, NULL, N'6b891efe-abe2-4ac7-8c7c-ee8f8ad9ab28', N'2.5.2', N'f47b9fb6-1268-4944-8f14-b439114d21f9', N'按照特定要求提供报价', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'2.4', NULL, N'货运海运出口', N'1. 发票、箱单（发货人盖章原件一份）
2. 报关委托书（公章+法人章一份）
3. 报检委托书（公章）
4. 申报要素（公章）
5. 保险购买申请书
6. 保费通知单
7. 海运主单托书
8. 海运分单托书', NULL, N'')
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DF384 AS DateTime), NULL, NULL, N'7d1e7b9d-e92b-4e5a-abfa-f27053d929fc', N'2.1.7', N'4334b54a-8c6d-4599-aa2a-541c479d9960', N'结算：业务一览表', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011DD9BC AS DateTime), NULL, NULL, N'd0cc25ff-4f18-4559-afbb-f4bd86df4ff3', N'1.5.8', N'b58fee52-9a54-4837-9710-b5b388030a2e', N'结算：业务一览表、代理店对账', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011D8B38 AS DateTime), NULL, NULL, N'cabc7b5d-064c-4fce-9293-f4bf1f04049e', N'1.2.2', N'eb13d896-7680-4d5e-8335-35532e45b8cc', N'确定查看货量的日期', NULL, N'0', NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E296C AS DateTime), NULL, NULL, N'569d20e9-b5a4-4529-8626-f9e57392dc5d', N'2.4.11', N'8ce64cdc-f68e-4baa-953c-ef4136fce530', N'结算：业务一览表', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'b93e6161-63b3-4dc6-80d0-fc95f7bb4d2f', N'2.3.7', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'和代理店对账，和客户对账', NULL, NULL, NULL)
INSERT [dbo].[BusinessType] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [TypeID], [Code], [ParentID], [Name], [Material], [Time], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8011E1904 AS DateTime), NULL, NULL, N'7c379515-60fa-4525-9f5d-fddff2db0a10', N'2.3.2', N'c5777c05-7e64-43ba-bb10-0cae075244c0', N'协助客户准备通关资料：PL.INV.CONTRACT 等', NULL, NULL, NULL)
/****** Object:  Table [dbo].[AgentCompany]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentCompany](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[AgentID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[Character] [nvarchar](50) NULL,
	[Contact] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](50) NULL,
	[BankName] [nvarchar](100) NULL,
	[BankCardNumber] [nvarchar](100) NULL,
	[IdentifyCode] [nvarchar](100) NULL,
	[Warehouse] [nvarchar](200) NULL,
	[WarehouseManager] [nvarchar](50) NULL,
	[WarehouseContact] [nvarchar](50) NULL,
	[WarehouseContactEmail] [nvarchar](100) NULL,
	[MainBusiness] [nvarchar](500) NULL,
	[Memo] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AgentCompany] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [AgentID], [Name], [Address], [Character], [Contact], [Email], [Mobile], [BankName], [BankCardNumber], [IdentifyCode], [Warehouse], [WarehouseManager], [WarehouseContact], [WarehouseContactEmail], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012880B0 AS DateTime), NULL, NULL, N'4f2d54b0-2a0d-426c-8e37-20da470e5003', N'代理公司A', N'公司地址?', N'0002', N'没 人', N'无', N'123', N'家行', N'9384', N'23423', N'地址地址', N'人人人', N'23423', N'3在在要工要', N'没有业务', N'好多备注')
INSERT [dbo].[AgentCompany] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [AgentID], [Name], [Address], [Character], [Contact], [Email], [Mobile], [BankName], [BankCardNumber], [IdentifyCode], [Warehouse], [WarehouseManager], [WarehouseContact], [WarehouseContactEmail], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012880B0 AS DateTime), NULL, NULL, N'36a251c8-dee9-4bbd-8d0b-615ef1578850', N'代理公司D', N'公司地址?', N'0002', N'没 人', N'无', N'123', N'家行', N'9384', N'23423', N'地址地址', N'人人人', N'23423', N'3在在要工要', N'没有业务', N'好多备注')
INSERT [dbo].[AgentCompany] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [AgentID], [Name], [Address], [Character], [Contact], [Email], [Mobile], [BankName], [BankCardNumber], [IdentifyCode], [Warehouse], [WarehouseManager], [WarehouseContact], [WarehouseContactEmail], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012880B0 AS DateTime), NULL, NULL, N'b25c68b4-9e43-4ead-93bd-a47afd60fbe2', N'代理公司B', N'公司地址?', N'0002', N'没 人', N'无', N'123', N'家行', N'9384', N'23423', N'地址地址', N'人人人', N'23423', N'3在在要工要', N'没有业务', N'好多备注')
INSERT [dbo].[AgentCompany] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [AgentID], [Name], [Address], [Character], [Contact], [Email], [Mobile], [BankName], [BankCardNumber], [IdentifyCode], [Warehouse], [WarehouseManager], [WarehouseContact], [WarehouseContactEmail], [MainBusiness], [Memo]) VALUES (N'7924604e-2eae-4d25-9260-b93ef689f4b4', CAST(0x0000A4E8012880B0 AS DateTime), NULL, NULL, N'3e86fe14-cf69-4cd5-8141-d03edb608cb2', N'代理公司C', N'公司地址?', N'0002', N'没 人', N'无', N'123', N'家行', N'9384', N'23423', N'地址地址', N'人人人', N'23423', N'3在在要工要', N'没有业务', N'好多备注')
/****** Object:  Table [dbo].[ActionInfo]    Script Date: 01/23/2016 12:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionInfo](
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[ActionGuid] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) NULL,
	[Name] [nvarchar](20) NULL,
	[FunctionGuid] [uniqueidentifier] NULL,
	[Remark] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActionGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo', @level2type=N'COLUMN',@level2name=N'ActionGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo', @level2type=N'COLUMN',@level2name=N'FunctionGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActionInfo'
GO
INSERT [dbo].[ActionInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ActionGuid], [Code], [Name], [FunctionGuid], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'4a336067-7ac4-4d6d-975e-2be55a2ecfd7', N'在', N'B页面改造', N'6bc38b1c-48b2-46a4-a137-2efafd060639', N'1')
INSERT [dbo].[ActionInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ActionGuid], [Code], [Name], [FunctionGuid], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'3a44761e-2d8d-4adb-8720-49b81486b04e', N'2', N'A页面新增', N'd41bd1f7-516c-43f6-ad9c-1463350a4e2b', N'1')
INSERT [dbo].[ActionInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ActionGuid], [Code], [Name], [FunctionGuid], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'644f77b4-7742-4048-a409-81b5ed7cf32d', N'1', N'专项功能导出Excel', N'd41bd1f7-516c-43f6-ad9c-1463350a4e2b', N'2')
INSERT [dbo].[ActionInfo] ([CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ActionGuid], [Code], [Name], [FunctionGuid], [Remark]) VALUES (NULL, NULL, NULL, NULL, N'c2fe5b31-c9ba-4771-99cb-c948bf06a364', N'223', N'小专项', N'c6c6d1f0-4d41-4f6d-b359-173345a10905', N'2')
/****** Object:  Default [DF__Menu__IsSystem__239E4DCF]    Script Date: 01/23/2016 12:17:17 ******/
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((0)) FOR [IsSystem]
GO
