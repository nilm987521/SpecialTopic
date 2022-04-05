USE [db]
GO
/****** Object:  Table [dbo].[article]    Script Date: 2022/3/24 下午 06:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uuid] [char](24) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [ntext] NOT NULL,
	[page_views] [int] NOT NULL,
	[members_uid] [int] NOT NULL,
	[publish_time] [date] NOT NULL,
 CONSTRAINT [PK_articles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[article_tag]    Script Date: 2022/3/24 下午 06:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[article_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
 CONSTRAINT [PK_article_tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chat]    Script Date: 2022/3/24 下午 06:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[server_content] [text] NOT NULL,
	[client_content] [text] NOT NULL,
	[time] [datetime] NOT NULL,
	[member_uid1] [int] NOT NULL,
	[member_uid2] [int] NOT NULL,
 CONSTRAINT [PK_chat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messageboard]    Script Date: 2022/3/24 下午 06:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messageboard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NOT NULL,
	[content] [text] NOT NULL,
	[time] [datetime] NOT NULL,
	[members_uid] [int] NOT NULL,
 CONSTRAINT [PK_messageboard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tag]    Script Date: 2022/3/24 下午 06:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[category] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[article]  WITH CHECK ADD  CONSTRAINT [FK_article_members] FOREIGN KEY([members_uid])
REFERENCES [dbo].[members] ([uid])
GO
ALTER TABLE [dbo].[article] CHECK CONSTRAINT [FK_article_members]
GO
ALTER TABLE [dbo].[article_tag]  WITH CHECK ADD  CONSTRAINT [FK_article_tag_article] FOREIGN KEY([article_id])
REFERENCES [dbo].[article] ([id])
GO
ALTER TABLE [dbo].[article_tag] CHECK CONSTRAINT [FK_article_tag_article]
GO
ALTER TABLE [dbo].[article_tag]  WITH CHECK ADD  CONSTRAINT [FK_article_tag_tag] FOREIGN KEY([tag_id])
REFERENCES [dbo].[tag] ([id])
GO
ALTER TABLE [dbo].[article_tag] CHECK CONSTRAINT [FK_article_tag_tag]
GO
