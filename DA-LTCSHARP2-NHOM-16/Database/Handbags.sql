USE [master]
GO
/****** Object:  Database [DB_HandBags]    Script Date: 10/8/2024 11:26:36 AM ******/
CREATE DATABASE [DB_HandBags]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_QLPQNGUOIDUNG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_QLPQNGUOIDUNG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_QLPQNGUOIDUNG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_QLPQNGUOIDUNG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_HandBags] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_HandBags].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_HandBags] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_HandBags] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_HandBags] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_HandBags] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_HandBags] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_HandBags] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_HandBags] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_HandBags] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_HandBags] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_HandBags] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_HandBags] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_HandBags] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_HandBags] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_HandBags] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_HandBags] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_HandBags] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_HandBags] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_HandBags] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_HandBags] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_HandBags] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_HandBags] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_HandBags] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_HandBags] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_HandBags] SET  MULTI_USER 
GO
ALTER DATABASE [DB_HandBags] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_HandBags] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_HandBags] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_HandBags] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_HandBags] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_HandBags] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_HandBags] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_HandBags] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_HandBags]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaBan] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaPhieuNhap] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[SoLuongNhap] [int] NOT NULL,
	[GiaNhap] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DM_ManHinh]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DM_ManHinh](
	[MaManHinh] [char](10) NOT NULL,
	[TenManHinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_DM_ManHinh] PRIMARY KEY CLUSTERED 
(
	[MaManHinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[NgayLap] [datetime] NOT NULL,
	[TongTien] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[ChucVu] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[TongTien] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QL_NguoiDung]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_NguoiDung](
	[TenDangNhap] [varchar](20) NOT NULL,
	[MatKhau] [varchar](30) NULL,
	[HoatDong] [int] NULL,
 CONSTRAINT [PK_QL_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QL_NguoiDungNhomNguoiDung]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_NguoiDungNhomNguoiDung](
	[TenDangNhap] [varchar](20) NOT NULL,
	[MaNhomNguoiDung] [char](10) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_QL_NguoiDungNhomNguoiDung] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC,
	[MaNhomNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QL_NhomNguoiDung]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_NhomNguoiDung](
	[MaNhom] [char](10) NOT NULL,
	[TenNhom] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_QL_NhomNguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QL_PhanQuyen]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_PhanQuyen](
	[MaNhomNguoiDung] [char](10) NULL,
	[MaManHinh] [char](10) NULL,
	[CoQuyen] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/8/2024 11:26:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[GiaBan] [decimal](18, 2) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[MaLoai] [int] NOT NULL,
	[MaNCC] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[DM_ManHinh] ([MaManHinh], [TenManHinh]) VALUES (N'MH001     ', N'Phân Quyền')
INSERT [dbo].[DM_ManHinh] ([MaManHinh], [TenManHinh]) VALUES (N'MH002     ', N'Danh Mục')
INSERT [dbo].[DM_ManHinh] ([MaManHinh], [TenManHinh]) VALUES (N'MH003     ', N'Ðang xu?t')
INSERT [dbo].[DM_ManHinh] ([MaManHinh], [TenManHinh]) VALUES (N'MH004     ', N'Nhóm ngu?i dùng')
INSERT [dbo].[DM_ManHinh] ([MaManHinh], [TenManHinh]) VALUES (N'MH005     ', N'Màn hình')
INSERT [dbo].[DM_ManHinh] ([MaManHinh], [TenManHinh]) VALUES (N'MH006     ', N'Ngu?i dùng - nhóm')
INSERT [dbo].[DM_ManHinh] ([MaManHinh], [TenManHinh]) VALUES (N'MH007     ', N'Nhóm - màn hình')
GO
INSERT [dbo].[QL_NguoiDung] ([TenDangNhap], [MatKhau], [HoatDong]) VALUES (N'admin', N'1', 1)
INSERT [dbo].[QL_NguoiDung] ([TenDangNhap], [MatKhau], [HoatDong]) VALUES (N'admin1', N'1', 1)
INSERT [dbo].[QL_NguoiDung] ([TenDangNhap], [MatKhau], [HoatDong]) VALUES (N'admin12', N'1', 1)
INSERT [dbo].[QL_NguoiDung] ([TenDangNhap], [MatKhau], [HoatDong]) VALUES (N'admin22', N'1', 1)
INSERT [dbo].[QL_NguoiDung] ([TenDangNhap], [MatKhau], [HoatDong]) VALUES (N'admin223', N'1', 1)
INSERT [dbo].[QL_NguoiDung] ([TenDangNhap], [MatKhau], [HoatDong]) VALUES (N'customer1', N'customer1pass', 1)
INSERT [dbo].[QL_NguoiDung] ([TenDangNhap], [MatKhau], [HoatDong]) VALUES (N'employee1', N'employee1pass', 1)
GO
INSERT [dbo].[QL_NguoiDungNhomNguoiDung] ([TenDangNhap], [MaNhomNguoiDung], [GhiChu]) VALUES (N'admin', N'G001      ', N'Qu?n tr? viên')
INSERT [dbo].[QL_NguoiDungNhomNguoiDung] ([TenDangNhap], [MaNhomNguoiDung], [GhiChu]) VALUES (N'admin', N'Nhom001   ', N'zzz')
INSERT [dbo].[QL_NguoiDungNhomNguoiDung] ([TenDangNhap], [MaNhomNguoiDung], [GhiChu]) VALUES (N'admin1', N'Nhom001   ', N'vv')
INSERT [dbo].[QL_NguoiDungNhomNguoiDung] ([TenDangNhap], [MaNhomNguoiDung], [GhiChu]) VALUES (N'customer1', N'G003      ', N'Khách hàng')
INSERT [dbo].[QL_NguoiDungNhomNguoiDung] ([TenDangNhap], [MaNhomNguoiDung], [GhiChu]) VALUES (N'employee1', N'G002      ', N'Nhân viên')
GO
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'G001      ', N'Qu?n tr? viên', N'Nhóm có quy?n qu?n tr? toàn b? h? th?ng')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'G002      ', N'Nhân viên', N'Nhóm nhân viên v?i quy?n h?n co b?n')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'G003      ', N'Khách hàng', N'Nhóm ngu?i dùng khách hàng')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'Nhom001   ', N'Nhom a', N'ko co gi dac biet')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'Nhom002   ', N'Nhóm b', N'zzfw')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'Nhom003   ', N'Nhóm c', N'zzfw')
GO
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'Nhom001   ', N'MH001     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'Nhom001   ', N'MH002     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'Nhom003   ', N'MH001     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'Nhom002   ', N'MH001     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G001      ', N'MH001     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G001      ', N'MH002     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G001      ', N'MH003     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G001      ', N'MH004     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G001      ', N'MH005     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G001      ', N'MH006     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G001      ', N'MH007     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G002      ', N'MH001     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G002      ', N'MH002     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G002      ', N'MH003     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G002      ', N'MH004     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G002      ', N'MH005     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G002      ', N'MH006     ', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G002      ', N'MH007     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G003      ', N'MH001     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G003      ', N'MH002     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G003      ', N'MH003     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G003      ', N'MH004     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G003      ', N'MH005     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G003      ', N'MH006     ', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaManHinh], [CoQuyen]) VALUES (N'G003      ', N'MH007     ', 0)
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[QL_NguoiDungNhomNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_QL_NguoiDungNhomNguoiDung_QL_NguoiDung] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[QL_NguoiDung] ([TenDangNhap])
GO
ALTER TABLE [dbo].[QL_NguoiDungNhomNguoiDung] CHECK CONSTRAINT [FK_QL_NguoiDungNhomNguoiDung_QL_NguoiDung]
GO
ALTER TABLE [dbo].[QL_NguoiDungNhomNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_QL_NguoiDungNhomNguoiDung_QL_NhomNguoiDung] FOREIGN KEY([MaNhomNguoiDung])
REFERENCES [dbo].[QL_NhomNguoiDung] ([MaNhom])
GO
ALTER TABLE [dbo].[QL_NguoiDungNhomNguoiDung] CHECK CONSTRAINT [FK_QL_NguoiDungNhomNguoiDung_QL_NhomNguoiDung]
GO
ALTER TABLE [dbo].[QL_PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_QL_PhanQuyen_DM_ManHinh] FOREIGN KEY([MaManHinh])
REFERENCES [dbo].[DM_ManHinh] ([MaManHinh])
GO
ALTER TABLE [dbo].[QL_PhanQuyen] CHECK CONSTRAINT [FK_QL_PhanQuyen_DM_ManHinh]
GO
ALTER TABLE [dbo].[QL_PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_QL_PhanQuyen_QL_NhomNguoiDung] FOREIGN KEY([MaNhomNguoiDung])
REFERENCES [dbo].[QL_NhomNguoiDung] ([MaNhom])
GO
ALTER TABLE [dbo].[QL_PhanQuyen] CHECK CONSTRAINT [FK_QL_PhanQuyen_QL_NhomNguoiDung]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSanPham] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
USE [master]
GO
ALTER DATABASE [DB_HandBags] SET  READ_WRITE 
GO
