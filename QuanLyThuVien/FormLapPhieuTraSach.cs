using QuanLyThuVien.Helpers;
using QuanLyThuVien.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien
{
    public partial class FormLapPhieuTraSach : Form
    {
        public string MaPhieuMuon { get; }

        private FormLapPhieuTraSach()
        {
            InitializeComponent();
        }

        public FormLapPhieuTraSach(string maPhieuMuon)
            : this()
        {
            MaPhieuMuon = maPhieuMuon;    
        }

        private void btnQuayLai_Click(object sender, EventArgs e)
        {
            FormMain.Instance.LoadForm(new FormMuonTraSach());
        }

        private string TaoMaPhieuTra()
        {
            string sql = "SELECT pt.MaPhieuTra FROM PHIEU_TRA_SACH pt";

            DataTable result = Utils.GetData(sql);

            if (result.Rows.Count > 0)
            {
                int max = 0;

                for (int i = 0; i < result.Rows.Count; i++)
                {
                    var maPhieuMuon = result.Rows[i].Field<string>("MaPhieuTra");
                    if (!string.IsNullOrWhiteSpace(maPhieuMuon) && maPhieuMuon.Length > 2)
                    {
                        if (int.TryParse(maPhieuMuon.Substring(2), out int _order))
                        {
                            if (_order > max)
                                max = _order;
                        }
                    }
                }

                return string.Format("PT{0}", (max + 1).ToString().PadLeft(3, '0'));
            }
            else
                return "PT001";
        }

        public DataTable PhieuMuon {  get; set; }

        public List<SachMuon> CTPhieuMuon { get; set; } = new List<SachMuon>();
        BindingSource _src = new BindingSource();
        private void FormLapPhieuTraSach_Load(object sender, EventArgs e)
        {
            gridMuonSach.ReadOnly = true;
            gridMuonSach.AllowUserToAddRows = false;
            gridMuonSach.DataSource = _src;
            _src.DataSource = CTPhieuMuon;
            dtNgayTra.Value = DateTime.Now;
            txtMaPhieuTra.Text = TaoMaPhieuTra();

            // Lấy ra thông tin phiếu mượn
            string sql = string.Format(@"SELECT *, HoTen AS TenDG FROM PHIEU_MUON_SACH
                INNER JOIN THE_DOCGIA ON THE_DOCGIA.MaDG = PHIEU_MUON_SACH.MaDG WHERE MaPhieuMuon = '{0}'", MaPhieuMuon);

            PhieuMuon = Utils.GetData(sql);
            
            if (PhieuMuon.Rows.Count > 0)
            {
                
                txtTenDocGia.Text = PhieuMuon.Rows[0].Field<string>("TenDG");
                txtMaDocGia.Text = PhieuMuon.Rows[0].Field<string>("MaDG");
                txtSoLuongSach.Text = PhieuMuon.Rows[0].Field<int>("SoLuongSach").ToString();
                dtNgayTra.Value = DateTime.Now;

                TinhPhiPhat();

                // Lấy thông tin chi tiết phiếu mượn hiển thị ra màn hình
                sql = string.Format(@"SELECT  CT.MaPhieuMuon, CT.MaSach, TenSach, CT.SoLuong, S.TacGia, tl.TenTheLoai AS TheLoai  FROM CHITIET_MUONTRA CT
                            INNER JOIN SACH S ON S.MaSach = CT.MaSach
                            INNER JOIN THELOAI_SACH tl ON tl.MaTheLoai = S.MaTheLoai WHERE CT.MaPhieuMuon = '{0}'", MaPhieuMuon);
                
                DataTable tbCT = Utils.GetData(sql);

                foreach (DataRow r in tbCT.Rows)
                {
                    SachMuon s = new SachMuon();
                    s.STT = CTPhieuMuon.Count + 1;
                    s.MaSach = r.Field<string>("MaSach");
                    s.TenSach = r.Field<string>("TenSach");
                    s.SoLuong = r.Field<int>("SoLuong");
                    s.TacGia = r.Field<string>("TacGia");
                    s.TheLoai = r.Field<string>("TheLoai");
                    CTPhieuMuon.Add(s);
                }
                // Hiển thị chi tiết ra lưới
                _src.ResetBindings(true);


            }
            else
            {
                MessageBox.Show("Không tìm thấy phiếu mượn sách được yêu cầu !"
                    , "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                FormMain.Instance.LoadForm(new FormMuonTraSach());

            } 
        }

        private void TinhPhiPhat()
        {
            if (PhieuMuon == null || PhieuMuon.Rows.Count <= 0)
                return;

            string sql = "SELECT * FROM QUY_DINH";
            DataTable quyDinh = Utils.GetData(sql);

            int phiPhatChoMotNgayTre = 0;

            int thoiHanMuonSach = 1;

            if (quyDinh.Rows.Count > 0)
            {
                phiPhatChoMotNgayTre = quyDinh.Rows[0].Field<int>("Phi_Phat_Theo_Mot_Ngay_Tre");
                thoiHanMuonSach = quyDinh.Rows[0].Field<int>("Thoi_Han_Muon_Sach");
            }


            DateTime ngayMuon = PhieuMuon.Rows[0].Field<DateTime>("NgayMuon");

            int soNgayTre = thoiHanMuonSach - Math.Abs((int)((dtNgayTra.Value - ngayMuon).TotalDays));

            if (soNgayTre < 0)
            {
                tbSoNgayTraTre.Text = Math.Abs(soNgayTre).ToString();
                tbTienPhat.Text = (phiPhatChoMotNgayTre * Math.Abs(soNgayTre)).ToString("#,###");
            }
            else
            {
                tbSoNgayTraTre.Text = "0";
                tbTienPhat.Text = "0";
            }
        }
        private void dtNgayTra_ValueChanged(object sender, EventArgs e)
        {
            TinhPhiPhat();
        }

        private void btnInPhieuMuonSach_Click(object sender, EventArgs e)
        {
            string sql = string.Empty;

            if (PhieuMuon == null || PhieuMuon.Rows.Count <= 0)
            {
                return;
            }

            sql = string.Format("SELECT * FROM THUTHU WHERE MaTaiKhoan = '{0}'", SessionManager.User.MaTK);

            DataTable result = Utils.GetData(sql);

            string maTT = string.Empty;

            if (result.Rows.Count > 0)
            {
                maTT = result.Rows[0].Field<string>("MaTT");
            }

            if (string.IsNullOrEmpty(maTT))
            {
                MessageBox.Show("Vui lòng đăng nhập với quyền thủ thư để thực hiện chức năng này !", "Thông báo");
                return;
            }

            if (string.IsNullOrEmpty(txtMaPhieuTra.Text))
            {
                MessageBox.Show("Vui lòng nhập vào mã phiếu trả !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            sql = string.Format("SELECT MaPhieuTra FROM [PHIEU_TRA_SACH] WHERE MaPhieuTra = '{0}'", txtMaPhieuTra.Text);

            if (Utils.GetData(sql).Rows.Count > 0)
            {
                MessageBox.Show("Mã phiếu trả đã tồn tại !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (string.IsNullOrEmpty(txtMaDocGia.Text)) {
                MessageBox.Show("Mã độc giả không được để trống !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!int.TryParse(txtSoLuongSach.Text, out int _soLuongSach)) {
                MessageBox.Show("Số lượng sách không hợp lệ !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            int soNgayTre = 0;

            int.TryParse(tbSoNgayTraTre.Text, out soNgayTre);

            decimal soTienPhat = 0;
            
            decimal.TryParse(tbTienPhat.Text, out soTienPhat);

            sql = string.Format(@"INSERT INTO [dbo].[PHIEU_TRA_SACH]
                       ([MaPhieuTra]
                       ,[MaPhieuMuon]
                       ,[MaDG]
                       ,[MaTT]
                       ,[NgayTra]
                       ,[SoLuongSach]
                       ,[SoNgayTre]
                       ,[SoTienPhat])
                 VALUES
                       ('{0}'
                       ,'{1}'
                       , '{2}'
                       , '{3}'
                       , '{4}'
                       , {5}
                       , {6}
                       ,{7})", txtMaPhieuTra.Text
                       , MaPhieuMuon
                       , txtMaDocGia.Text
                       , maTT
                       , dtNgayTra.Value.ToString("yyyy/MM/dd")
                       , _soLuongSach
                       , soNgayTre
                       , soTienPhat);

            var ret = Utils.ExecuteSQL(sql);

            if (ret)
            {
                MessageBox.Show("Lưu thông tin phiếu trả sách thành công !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                FormMain.Instance.LoadForm(new FormMuonTraSach());
                return;
            }

            MessageBox.Show("Lưu thông tin phiếu trả sách không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);

        }
    }
}
