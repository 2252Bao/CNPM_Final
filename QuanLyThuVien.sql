USE [QUANLYTHUVIEN]
GO
/****** Object:  Table [dbo].[CHITIET_MUONTRA]    Script Date: 7/19/2024 13:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIET_MUONTRA](
	[MaPhieuMuon] [varchar](255) NOT NULL,
	[MaSach] [varchar](255) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CTMT] PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEU_MUON_SACH]    Script Date: 7/19/2024 13:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEU_MUON_SACH](
	[MaPhieuMuon] [varchar](255) NOT NULL,
	[MaDG] [varchar](255) NULL,
	[MaTT] [varchar](255) NULL,
	[SoLuongSach] [int] NULL,
	[NgayMuon] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEU_THU_TIEN_PHAT]    Script Date: 7/19/2024 13:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEU_THU_TIEN_PHAT](
	[MaPhieuPhat] [varchar](255) NOT NULL,
	[MaDG] [varchar](255) NULL,
	[TongTienPhat] [money] NULL,
	[TienNhanDuoc] [money] NULL,
	[TienConLai] [money] NULL,
	[NgayTraTien] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuPhat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEU_TRA_SACH]    Script Date: 7/19/2024 13:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEU_TRA_SACH](
	[MaPhieuTra] [varchar](255) NOT NULL,
	[MaPhieuMuon] [varchar](255) NULL,
	[MaDG] [varchar](255) NULL,
	[MaTT] [varchar](255) NULL,
	[NgayTra] [smalldatetime] NULL,
	[SoLuongSach] [int] NULL,
	[SoNgayTre] [int] NULL,
	[SoTienPhat] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUY_DINH]    Script Date: 7/19/2024 13:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUY_DINH](
	[MinAge] [int] NULL,
	[MaxAge] [int] NULL,
	[Thoi_Han_The_Doc_Gia] [int] NULL,
	[So_Nam_Xuat_Ban] [int] NULL,
	[So_Sach_Doc_Gia_Muon_Duoc_Trong_Mot_ThoiGian] [int] NULL,
	[So_Ngay_Gioi_Han_So_Luong_Sach_Muon] [int] NULL,
	[Thoi_Han_Muon_Sach] [int] NULL,
	[Phi_Phat_Theo_Mot_Ngay_Tre] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SACH]    Script Date: 7/19/2024 13:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACH](
	[MaSach] [varchar](255) NOT NULL,
	[TenSach] [varchar](255) NULL,
	[MaTheLoai] [varchar](255) NULL,
	[TacGia] [varchar](255) NULL,
	[NamXuatBan] [int] NULL,
	[NhaXuatBan] [varchar](255) NULL,
	[SoLuong] [int] NULL,
	[GiaSach] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 7/19/2024 13:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTK] [varchar](255) NOT NULL,
	[TK_Username] [varchar](255) NULL,
	[TK_Password] [varchar](255) NULL,
	[LoaiTK] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THE_DOCGIA]    Script Date: 7/19/2024 13:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THE_DOCGIA](
	[MaDG] [varchar](255) NOT NULL,
	[HoTen] [varchar](255) NULL,
	[MaTaiKhoan] [varchar](255) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[DiaChi] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Sdt] [varchar](255) NULL,
	[NgayLapTheDocGia] [smalldatetime] NULL,
	[NgayHetHan] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THELOAI_SACH]    Script Date: 7/19/2024 13:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI_SACH](
	[MaTheLoai] [varchar](255) NOT NULL,
	[TenTheLoai] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThoiGian_ThongKe]    Script Date: 7/19/2024 13:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThoiGian_ThongKe](
	[Thang] [int] NULL,
	[Nam] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUTHU]    Script Date: 7/19/2024 13:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUTHU](
	[MaTT] [varchar](255) NOT NULL,
	[HoTen] [varchar](255) NULL,
	[MaTaiKhoan] [varchar](255) NULL,
	[NgayTaoTK] [smalldatetime] NULL,
	[NgaySinh] [smalldatetime] NULL,
	[DiaChi] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Sdt] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM001', N'S001', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM001', N'S002', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM001', N'S003', 3)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM002', N'S004', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM002', N'S005', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM003', N'S006', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM004', N'S007', 4)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM005', N'S011', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM005', N'S012', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM006', N'S013', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM006', N'S014', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM007', N'S015', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM008', N'S016', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM008', N'S017', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM008', N'S018', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM009', N'S019', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM009', N'S020', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM009', N'S021', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM010', N'S022', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM010', N'S023', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM011', N'S024', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM012', N'S027', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM012', N'S028', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM013', N'S030', 3)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM014', N'S012', 5)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM015', N'S005', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM015', N'S015', 3)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM016', N'S004', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM016', N'S029', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM017', N'S017', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM017', N'S019', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM018', N'S010', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM019', N'S003', 2)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM020', N'S014', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM020', N'S025', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM021', N'S019', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM021', N'S024', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM021', N'S027', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM022', N'S020', 1)
INSERT [dbo].[CHITIET_MUONTRA] ([MaPhieuMuon], [MaSach], [SoLuong]) VALUES (N'PM022', N'S025', 1)
GO
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM001', N'DG001', N'TT001', 5, CAST(N'2024-01-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM002', N'DG002', N'TT002', 3, CAST(N'2024-02-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM003', N'DG003', N'TT001', 1, CAST(N'2024-03-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM004', N'DG004', N'TT002', 4, CAST(N'2024-04-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM005', N'DG005', N'TT001', 4, CAST(N'2024-05-25T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM006', N'DG006', N'TT002', 3, CAST(N'2024-07-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM007', N'DG007', N'TT002', 1, CAST(N'2024-05-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM008', N'DG008', N'TT001', 4, CAST(N'2024-04-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM009', N'DG009', N'TT001', 5, CAST(N'2024-05-22T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM010', N'DG010', N'TT001', 2, CAST(N'2024-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM011', N'DG011', N'TT002', 2, CAST(N'2024-06-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM012', N'DG012', N'TT001', 3, CAST(N'2024-06-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM013', N'DG013', N'TT002', 3, CAST(N'2024-06-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM014', N'DG014', N'TT001', 5, CAST(N'2024-06-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM015', N'DG015', N'TT002', 4, CAST(N'2024-05-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM016', N'DG016', N'TT001', 4, CAST(N'2024-06-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM017', N'DG017', N'TT002', 3, CAST(N'2024-07-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM018', N'DG018', N'TT001', 1, CAST(N'2024-07-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM019', N'DG019', N'TT002', 2, CAST(N'2024-07-03T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM020', N'DG020', N'TT001', 2, CAST(N'2024-07-04T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM021', N'DG001', N'TT001', 3, CAST(N'2024-07-19T00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon], [MaDG], [MaTT], [SoLuongSach], [NgayMuon]) VALUES (N'PM022', N'DG001', N'TT001', 2, CAST(N'2024-07-19T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT001', N'PM001', N'DG001', N'TT001', CAST(N'2024-01-25T00:00:00' AS SmallDateTime), 5, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT002', N'PM002', N'DG002', N'TT002', CAST(N'2024-02-01T00:00:00' AS SmallDateTime), 3, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT003', N'PM003', N'DG003', N'TT001', CAST(N'2024-03-20T00:00:00' AS SmallDateTime), 1, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT004', N'PM004', N'DG004', N'TT002', CAST(N'2024-04-10T00:00:00' AS SmallDateTime), 4, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT005', N'PM005', N'DG005', N'TT001', CAST(N'2024-05-30T00:00:00' AS SmallDateTime), 4, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT006', N'PM006', N'DG006', N'TT002', CAST(N'2024-07-20T00:00:00' AS SmallDateTime), 3, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT007', N'PM007', N'DG007', N'TT002', CAST(N'2024-05-15T00:00:00' AS SmallDateTime), 1, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT008', N'PM008', N'DG008', N'TT001', CAST(N'2024-04-28T00:00:00' AS SmallDateTime), 4, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT009', N'PM009', N'DG009', N'TT001', CAST(N'2024-06-01T00:00:00' AS SmallDateTime), 5, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT010', N'PM010', N'DG010', N'TT001', CAST(N'2024-07-05T00:00:00' AS SmallDateTime), 2, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT011', N'PM011', N'DG011', N'TT002', CAST(N'2024-06-20T00:00:00' AS SmallDateTime), 2, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT012', N'PM012', N'DG012', N'TT001', CAST(N'2024-06-21T00:00:00' AS SmallDateTime), 3, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT013', N'PM013', N'DG013', N'TT002', CAST(N'2024-06-27T00:00:00' AS SmallDateTime), 3, 2, 2000.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT014', N'PM014', N'DG014', N'TT001', CAST(N'2024-06-30T00:00:00' AS SmallDateTime), 5, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT015', N'PM015', N'DG015', N'TT002', CAST(N'2024-06-05T00:00:00' AS SmallDateTime), 4, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT016', N'PM016', N'DG016', N'TT001', CAST(N'2024-06-22T00:00:00' AS SmallDateTime), 3, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT017', N'PM017', N'DG017', N'TT002', CAST(N'2024-07-17T00:00:00' AS SmallDateTime), 3, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT018', N'PM018', N'DG018', N'TT001', CAST(N'2024-07-10T00:00:00' AS SmallDateTime), 1, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT019', N'PM019', N'DG019', N'TT002', CAST(N'2024-07-12T00:00:00' AS SmallDateTime), 2, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT020', N'PM020', N'DG020', N'TT001', CAST(N'2024-07-07T00:00:00' AS SmallDateTime), 2, 0, 0.0000)
INSERT [dbo].[PHIEU_TRA_SACH] ([MaPhieuTra], [MaPhieuMuon], [MaDG], [MaTT], [NgayTra], [SoLuongSach], [SoNgayTre], [SoTienPhat]) VALUES (N'PT021', N'PM021', N'DG001', N'TT001', CAST(N'2024-07-19T00:00:00' AS SmallDateTime), 3, 0, 0.0000)
GO
INSERT [dbo].[QUY_DINH] ([MinAge], [MaxAge], [Thoi_Han_The_Doc_Gia], [So_Nam_Xuat_Ban], [So_Sach_Doc_Gia_Muon_Duoc_Trong_Mot_ThoiGian], [So_Ngay_Gioi_Han_So_Luong_Sach_Muon], [Thoi_Han_Muon_Sach], [Phi_Phat_Theo_Mot_Ngay_Tre]) VALUES (18, 55, 6, 8, 5, 7, 10, 1000)
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S001', N'M?t Bi?c', N'TL001', N'Nguy?n Nh?t Ánh', 2016, N'NXB Tr?', 10, 100000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S002', N'Cho tôi xin m?t vé di v? tu?i tho', N'TL001', N'Nguy?n Nh?t Ánh', 2017, N'NXB Tr?', 8, 150000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S003', N'Tôi th?y hoa vàng trên c? xanh', N'TL001', N'Nguy?n Nh?t Ánh', 2018, N'NXB Tr?', 5, 180000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S004', N'Cánh d?ng b?t t?n', N'TL001', N'Nguy?n Ng?c Tu', 2016, N'NXB Tr?', 12, 200000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S005', N'Chuy?n ngu?i con gái Nam Xuong', N'TL001', N'Nguy?n D?', 2019, N'NXB Van H?c', 7, 220000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S006', N'S?ng mòn', N'TL001', N'Nam Cao', 2020, N'NXB Van H?c', 9, 300000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S007', N'D? mèn phiêu luu ký', N'TL001', N'Tô Hoài', 2021, N'NXB Kim Ð?ng', 6, 270000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S008', N'Nhà gi? kim', N'TL002', N'Paulo Coelho', 2016, N'NXB Van H?c', 8, 200000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S009', N'Ð?c nhân tâm', N'TL002', N'Dale Carnegie', 2017, N'NXB Tr?', 10, 350000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S010', N'Khéo an nói s? có du?c thiên h?', N'TL002', N'Trác Nhã', 2018, N'NXB Van H?c', 15, 400000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S011', N'Tu?i tr? dáng giá bao nhiêu', N'TL002', N'Rosie Nguy?n', 2019, N'NXB Tr?', 11, 320000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S012', N'Ðu?ng mây qua x? tuy?t', N'TL002', N'Anagarika Govinda', 2020, N'NXB Van Hóa Thông Tin', 13, 370000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S013', N'C?m nang luy?n thi d?i h?c', N'TL002', N'Nhi?u tác gi?', 2021, N'NXB Giáo D?c', 20, 450000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S014', N'L?ch s? Vi?t Nam', N'TL003', N'Nhi?u tác gi?', 2016, N'NXB Giáo D?c', 18, 420000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S015', N'Vi?t Nam s? lu?c', N'TL003', N'Tr?n Tr?ng Kim', 2017, N'NXB Van H?c', 14, 500000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S016', N'S? ký Tu Mã Thiên', N'TL003', N'Tu Mã Thiên', 2018, N'NXB Van H?c', 17, 380000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S017', N'H?i ký c?a m?t Geisha', N'TL004', N'Arthur Golden', 2019, N'NXB Van H?c', 10, 210000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S018', N'Nh?ng câu chuy?n v? Bác H?', N'TL004', N'Nhi?u tác gi?', 2020, N'NXB Kim Ð?ng', 12, 240000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S019', N'H?i ký Lý Quang Di?u', N'TL004', N'Lý Quang Di?u', 2021, N'NXB Tr?', 9, 450000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S020', N'Ðêm h?i Long Trì', N'TL005', N'Ngô T?t T?', 2016, N'NXB Van H?c', 11, 230000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S021', N'Mê cung h?i ?c', N'TL005', N'Ðinh M?c', 2017, N'NXB Tr?', 8, 280000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S022', N'Con du?ng h?i giáo', N'TL005', N'Tariq Ramadan', 2018, N'NXB Van H?c', 10, 300000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S023', N'Tôi là Bêtô', N'TL005', N'Nguy?n Nh?t Ánh', 2019, N'NXB Tr?', 14, 350000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S024', N'N?u bi?t tram nam là h?u h?n', N'TL005', N'Ph?m L? Ân', 2020, N'NXB Tr?', 15, 500000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S025', N'Mu?i ngu?i da den nh?', N'TL005', N'Agatha Christie', 2021, N'NXB Van H?c', 13, 400000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S026', N'Công ngh? giáo d?c', N'TL006', N'Nguy?n Thành Nam', 2016, N'NXB Giáo D?c', 12, 310000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S027', N'Startup Vi?t', N'TL006', N'Nhi?u tác gi?', 2017, N'NXB Tr?', 16, 320000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S028', N'Công ngh? blockchain', N'TL006', N'Nguy?n Thành Công', 2018, N'NXB Công Ngh?', 18, 290000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S029', N'Cách m?ng công nghi?p 4.0', N'TL006', N'Klaus Schwab', 2019, N'NXB Tr?', 20, 300000.0000)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [NamXuatBan], [NhaXuatBan], [SoLuong], [GiaSach]) VALUES (N'S030', N'Hành trình v? phuong Ðông', N'TL006', N'Baird T. Spalding', 2020, N'NXB Van Hóa Thông Tin', 19, 340000.0000)
GO
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK001', N'user1', N'password1', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK002', N'user2', N'password2', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK003', N'user3', N'password3', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK004', N'user4', N'password4', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK005', N'user5', N'password5', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK006', N'user6', N'password6', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK007', N'user7', N'password7', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK008', N'user8', N'password8', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK009', N'user9', N'password9', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK010', N'user10', N'password10', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK011', N'user11', N'password11', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK012', N'user12', N'password12', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK013', N'user13', N'password13', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK014', N'user14', N'password14', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK015', N'user15', N'password15', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK016', N'user16', N'password16', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK017', N'user17', N'password17', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK018', N'user18', N'password18', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK019', N'user19', N'password19', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK020', N'user20', N'password20', N'Reader')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK021', N'librarian1', N'password21', N'Librarian')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TK_Username], [TK_Password], [LoaiTK]) VALUES (N'TK022', N'librarian2', N'password22', N'Librarian')
GO
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG001', N'Nguy?n Van An', N'TK001', CAST(N'1990-01-01T00:00:00' AS SmallDateTime), N'123 Ðu?ng A', N'an.nguyen@example.com', N'0912345678', CAST(N'2024-02-15T00:00:00' AS SmallDateTime), CAST(N'2024-08-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG002', N'Tr?n Th? Bích', N'TK002', CAST(N'1985-02-15T00:00:00' AS SmallDateTime), N'456 Ðu?ng B', N'bich.tran@example.com', N'0912345679', CAST(N'2024-02-25T00:00:00' AS SmallDateTime), CAST(N'2024-08-25T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG003', N'Lê Hoàng Cu?ng', N'TK003', CAST(N'1979-03-20T00:00:00' AS SmallDateTime), N'789 Ðu?ng C', N'cuong.le@example.com', N'0912345680', CAST(N'2024-02-07T00:00:00' AS SmallDateTime), CAST(N'2024-08-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG004', N'Ph?m Minh Duy', N'TK004', CAST(N'1992-04-10T00:00:00' AS SmallDateTime), N'101 Ðu?ng D', N'duy.pham@example.com', N'0912345681', CAST(N'2024-02-12T00:00:00' AS SmallDateTime), CAST(N'2024-08-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG005', N'Hoàng Th? Em', N'TK005', CAST(N'1987-05-25T00:00:00' AS SmallDateTime), N'202 Ðu?ng E', N'em.hoang@example.com', N'0912345682', CAST(N'2024-02-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG006', N'Bùi Van Phát', N'TK006', CAST(N'1983-06-30T00:00:00' AS SmallDateTime), N'303 Ðu?ng F', N'phat.bui@example.com', N'0912345683', CAST(N'2024-03-05T00:00:00' AS SmallDateTime), CAST(N'2024-09-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG007', N'Ð? Th? G?m', N'TK007', CAST(N'1995-07-15T00:00:00' AS SmallDateTime), N'404 Ðu?ng G', N'gam.do@example.com', N'0912345684', CAST(N'2024-03-18T00:00:00' AS SmallDateTime), CAST(N'2024-09-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG008', N'Vu Hoàng Hà', N'TK008', CAST(N'1981-08-10T00:00:00' AS SmallDateTime), N'505 Ðu?ng H', N'ha.vu@example.com', N'0912345685', CAST(N'2024-03-23T00:00:00' AS SmallDateTime), CAST(N'2024-09-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG009', N'Ph?m Van Khang', N'TK009', CAST(N'1988-09-05T00:00:00' AS SmallDateTime), N'606 Ðu?ng I', N'khang.pham@example.com', N'0912345686', CAST(N'2024-04-07T00:00:00' AS SmallDateTime), CAST(N'2024-10-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG010', N'Nguy?n Th? Lan', N'TK010', CAST(N'1993-10-20T00:00:00' AS SmallDateTime), N'707 Ðu?ng J', N'lan.nguyen@example.com', N'0912345687', CAST(N'2024-04-18T00:00:00' AS SmallDateTime), CAST(N'2024-10-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG011', N'Tr?n Van Minh', N'TK011', CAST(N'1984-11-25T00:00:00' AS SmallDateTime), N'808 Ðu?ng K', N'minh.tran@example.com', N'0912345688', CAST(N'2024-04-25T00:00:00' AS SmallDateTime), CAST(N'2024-10-25T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG012', N'Lê Th? Ng?c', N'TK012', CAST(N'1990-12-30T00:00:00' AS SmallDateTime), N'909 Ðu?ng L', N'ngoc.le@example.com', N'0912345689', CAST(N'2024-05-07T00:00:00' AS SmallDateTime), CAST(N'2024-11-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG013', N'Hoàng Van Nam', N'TK013', CAST(N'1986-01-15T00:00:00' AS SmallDateTime), N'111 Ðu?ng M', N'nam.hoang@example.com', N'0912345690', CAST(N'2024-05-17T00:00:00' AS SmallDateTime), CAST(N'2024-11-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG014', N'Bùi Th? Oanh', N'TK014', CAST(N'1991-02-10T00:00:00' AS SmallDateTime), N'222 Ðu?ng N', N'oanh.bui@example.com', N'0912345691', CAST(N'2024-05-25T00:00:00' AS SmallDateTime), CAST(N'2024-11-25T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG015', N'Ð? Van Phú', N'TK015', CAST(N'1978-03-05T00:00:00' AS SmallDateTime), N'333 Ðu?ng O', N'phu.do@example.com', N'0912345692', CAST(N'2024-06-02T00:00:00' AS SmallDateTime), CAST(N'2024-12-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG016', N'Vu Th? Quyên', N'TK016', CAST(N'1989-04-20T00:00:00' AS SmallDateTime), N'444 Ðu?ng P', N'quyen.vu@example.com', N'0912345693', CAST(N'2024-06-18T00:00:00' AS SmallDateTime), CAST(N'2024-12-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG017', N'Ph?m Van Son', N'TK017', CAST(N'1982-05-25T00:00:00' AS SmallDateTime), N'555 Ðu?ng Q', N'son.pham@example.com', N'0912345694', CAST(N'2024-06-30T00:00:00' AS SmallDateTime), CAST(N'2024-12-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG018', N'Nguy?n Th? Tâm', N'TK018', CAST(N'1994-06-30T00:00:00' AS SmallDateTime), N'666 Ðu?ng R', N'tam.nguyen@example.com', N'0912345695', CAST(N'2024-07-05T00:00:00' AS SmallDateTime), CAST(N'2025-01-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG019', N'Tr?n Van Tài', N'TK019', CAST(N'1980-07-10T00:00:00' AS SmallDateTime), N'777 Ðu?ng S', N'tai.tran@example.com', N'0912345696', CAST(N'2024-07-01T00:00:00' AS SmallDateTime), CAST(N'2025-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[THE_DOCGIA] ([MaDG], [HoTen], [MaTaiKhoan], [NgaySinh], [DiaChi], [Email], [Sdt], [NgayLapTheDocGia], [NgayHetHan]) VALUES (N'DG020', N'Lê Th? Uyên', N'TK020', CAST(N'1996-08-05T00:00:00' AS SmallDateTime), N'888 Ðu?ng T', N'uyen.le@example.com', N'0912345697', CAST(N'2024-07-03T00:00:00' AS SmallDateTime), CAST(N'2025-01-03T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[THELOAI_SACH] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL001', N'Ti?u thuy?t')
INSERT [dbo].[THELOAI_SACH] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL002', N'Khoa h?c')
INSERT [dbo].[THELOAI_SACH] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL003', N'L?ch s?')
INSERT [dbo].[THELOAI_SACH] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL004', N'T? truy?n')
INSERT [dbo].[THELOAI_SACH] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL005', N'Vi?n tu?ng')
INSERT [dbo].[THELOAI_SACH] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL006', N'Công ngh?')
GO
INSERT [dbo].[ThoiGian_ThongKe] ([Thang], [Nam]) VALUES (7, 2024)
GO
INSERT [dbo].[THUTHU] ([MaTT], [HoTen], [MaTaiKhoan], [NgayTaoTK], [NgaySinh], [DiaChi], [Email], [Sdt]) VALUES (N'TT001', N'Lê Th? Bích Ng?c', N'TK021', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'1985-05-05T00:00:00' AS SmallDateTime), N'123 Ðu?ng V', N'ngoc.lethi@example.com', N'0912345698')
INSERT [dbo].[THUTHU] ([MaTT], [HoTen], [MaTaiKhoan], [NgayTaoTK], [NgaySinh], [DiaChi], [Email], [Sdt]) VALUES (N'TT002', N'Nguy?n Van Hùng', N'TK022', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'1980-07-20T00:00:00' AS SmallDateTime), N'456 Ðu?ng W', N'hung.nguyen@example.com', N'0912345699')
GO
ALTER TABLE [dbo].[CHITIET_MUONTRA]  WITH CHECK ADD FOREIGN KEY([MaPhieuMuon])
REFERENCES [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon])
GO
ALTER TABLE [dbo].[CHITIET_MUONTRA]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[PHIEU_MUON_SACH]  WITH CHECK ADD FOREIGN KEY([MaDG])
REFERENCES [dbo].[THE_DOCGIA] ([MaDG])
GO
ALTER TABLE [dbo].[PHIEU_MUON_SACH]  WITH CHECK ADD FOREIGN KEY([MaTT])
REFERENCES [dbo].[THUTHU] ([MaTT])
GO
ALTER TABLE [dbo].[PHIEU_THU_TIEN_PHAT]  WITH CHECK ADD FOREIGN KEY([MaDG])
REFERENCES [dbo].[THE_DOCGIA] ([MaDG])
GO
ALTER TABLE [dbo].[PHIEU_TRA_SACH]  WITH CHECK ADD FOREIGN KEY([MaDG])
REFERENCES [dbo].[THE_DOCGIA] ([MaDG])
GO
ALTER TABLE [dbo].[PHIEU_TRA_SACH]  WITH CHECK ADD FOREIGN KEY([MaTT])
REFERENCES [dbo].[THUTHU] ([MaTT])
GO
ALTER TABLE [dbo].[PHIEU_TRA_SACH]  WITH CHECK ADD FOREIGN KEY([MaPhieuMuon])
REFERENCES [dbo].[PHIEU_MUON_SACH] ([MaPhieuMuon])
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[THELOAI_SACH] ([MaTheLoai])
GO
ALTER TABLE [dbo].[THE_DOCGIA]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
GO
ALTER TABLE [dbo].[THUTHU]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
GO
