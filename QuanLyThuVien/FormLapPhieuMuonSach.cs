using DocumentFormat.OpenXml.VariantTypes;
using QuanLyThuVien.Helpers;
using QuanLyThuVien.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien
{
    public partial class FormLapPhieuMuonSach : Form
    {
        public FormLapPhieuMuonSach()
        {
            InitializeComponent();
        }

        private void btnQuayLai_Click(object sender, EventArgs e)
        {
            FormMain.Instance.LoadForm(new FormMuonTraSach());
        }

        private string TaoMaPhieuMuon()
        {
            string sql = "SELECT pm.MaPhieuMuon FROM PHIEU_MUON_SACH pm";

            DataTable result = Utils.GetData(sql);

            if (result.Rows.Count > 0)
            {
                int max = 0;

                for (int i = 0; i < result.Rows.Count; i++)
                {
                    var maPhieuMuon = result.Rows[i].Field<string>("MaPhieuMuon");
                    if (!string.IsNullOrWhiteSpace(maPhieuMuon) && maPhieuMuon.Length > 2)
                    {
                        if (int.TryParse(maPhieuMuon.Substring(2), out int _order)) {
                            if (_order > max)
                                max = _order;
                        }
                    }
                }

                return string.Format("PM{0}", (max  + 1).ToString().PadLeft(3, '0'));
            }
            else
                return "PM001";
        }

        private void FormLapPhieuMuonSach_Load(object sender, EventArgs e)
        {
            gridMuonSach.DataSource = _src;
            txtMaPhieuMuon.Text = TaoMaPhieuMuon();
            LoadComboDocGia();
            LoadComboSach();
            LoadGrid();
        }

        private void LoadGrid()
        {
            _src.DataSource = new List<SachMuon>();
            _src.ResetBindings(true);
        }

        private void LoadComboSach()
        {
            string sql = @"SELECT Sach.MaSach, Sach.TenSach, TheLoai_Sach.TenTheLoai AS TheLoai, Sach.TacGia, Sach.MaSach + ' - ' + Sach.TenSach as DisplayText  FROM SACH
                INNER JOIN THELOAI_SACH ON THELOAI_SACH.MaTheLoai = SACH.MaTheLoai";
            DataTable result = Utils.GetData(sql);
            cboMaSach.DataSource = result;
            cboMaSach.ValueMember = "MaSach";
            cboMaSach.DisplayMember = "DisplayText";
            cboMaSach.SelectedIndex = 0;
        }

        private void LoadComboDocGia()
        {
            string sql = "SELECT *, MaDG + ' - ' + HoTen as DisplayText FROM THE_DOCGIA";
            DataTable result = Utils.GetData(sql);
            cboMaDG.DataSource = result;
            cboMaDG.ValueMember = "MaDG";
            cboMaDG.DisplayMember = "DisplayText";
            cboMaDG.SelectedIndex = 0;
        }

        private void cboMaDG_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboMaDG.SelectedIndex < 0)
                return;
            
            var hoTen = (cboMaDG.SelectedItem as DataRowView).Row.Field<string>("HoTen");
            
            if (hoTen == null) return;

            txtTenDocGia.Text = hoTen;
        }

        private void cboMaSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboMaSach.SelectedIndex < 0)
                return;

            var tenSach = (cboMaSach.SelectedItem as DataRowView).Row.Field <string>("TenSach");

            if (tenSach == null) return;

            tbTenSach.Text = tenSach;
            tbSoLuong.Text = "1";
        }

        BindingSource _src = new BindingSource();

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (cboMaSach.SelectedIndex < 0)
            {
                MessageBox.Show("Vui lòng chọn sách !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            } 

            if (!int.TryParse(tbSoLuong.Text, out int _soLuong))
            {
                MessageBox.Show("Vui lòng nhập vào số lượng !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (_soLuong <= 0)
            {
                MessageBox.Show("Số lượng sách phải lớn hơn 0 !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var row = (cboMaSach.SelectedItem as DataRowView).Row;
            SachMuon s = new SachMuon();
            s.STT = 1;
            s.MaSach = row.Field<string>("MaSach");
            s.TenSach = row.Field<string>("TenSach");
            s.TheLoai =  row.Field<string>("TheLoai");
            s.TacGia = row.Field<string>("TacGia");
            s.SoLuong = _soLuong;
            s.NgayMuon = DateTime.Now.Date;

            List<SachMuon> ds = _src.DataSource as List<SachMuon>;

            if (ds == null)
            {
                ds = new List<SachMuon> { s };
            }
            else
            {
                bool exists = false;

                for (int i = 0; i < ds.Count; i++)
                {
                    if (ds[i].MaSach == s.MaSach)
                    {
                        ds[i].SoLuong += _soLuong;
                        exists = true;
                        break;
                    }
                }

                if (!exists)
                {
                    s.STT = ds.Count + 1;
                    ds.Add(s);
                }
            }

            txtSoLuongSach.Text = ds.Sum(x => x.SoLuong).ToString();

            _src.ResetBindings(true);

        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (gridMuonSach.CurrentRow == null || gridMuonSach.CurrentRow.IsNewRow)
                return;
            
            var obj = gridMuonSach.CurrentRow.DataBoundItem as SachMuon;
            
            if (obj == null)
                return;

            if (MessageBox.Show("Bạn muốn xoá sách được chọn ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                List<SachMuon> ds = _src.DataSource as List<SachMuon>;

                if (ds != null)
                {
                    SachMuon s = null;

                    for (int i = 0; i < ds.Count; i++)
                    {
                        if (ds[i].MaSach == obj.MaSach)
                        {
                            s = ds[i];
                            break;
                        }
                    }

                    if (s != null)
                        ds.Remove(s);

                    for (int i = 0; i < ds.Count; i++)
                    {
                        ds[i].STT = i + 1;
                    }

                    txtSoLuongSach.Text = ds.Sum(x => x.SoLuong).ToString();
                    _src.ResetBindings(true);
                }
            }    
        }

        private void btnInPhieuMuonSach_Click(object sender, EventArgs e)
        {
            string sql = string.Format("SELECT * FROM THUTHU WHERE MaTaiKhoan = '{0}'", SessionManager.User.MaTK);
            
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

            List<SachMuon> ds = _src.DataSource as List<SachMuon>;
            
            if (ds == null)
            {
                MessageBox.Show("Không có sách nào được chọn !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            
            sql = string.Format("SELECT MaPhieuMuon FROM PHIEU_MUON_SACH WHERE MaPhieuMuon = '{0}'", txtMaPhieuMuon.Text);
            
            if (Utils.GetData(sql).Rows.Count > 0)
            {
                MessageBox.Show("Mã phiếu mượn đã tồn tại !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            } 

            if (cboMaDG.SelectedIndex < 0)
            {
                MessageBox.Show("Vui lòng chọn độc giả !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            } 

            sql = string.Format(@"
                INSERT INTO [dbo].[PHIEU_MUON_SACH]
                           ([MaPhieuMuon]
                           ,[MaDG]
                           ,[MaTT]
                           ,[SoLuongSach]
                           ,[NgayMuon])
                     VALUES
                           ('{0}'
                           , '{1}'
                           , '{2}'
                           , {3}
                           , '{4}')", txtMaPhieuMuon.Text
                           , cboMaDG.SelectedValue.ToString()
                           , maTT
                           , txtSoLuongSach.Text, DateTime.Now.Date.ToString("yyyy/MM/dd") );

            var ret = Utils.ExecuteSQL(sql);

            if (ret)
            {
                foreach (var s in ds)
                {
                    sql = string.Format(@"INSERT INTO [dbo].[CHITIET_MUONTRA]
                               ([MaPhieuMuon]
                               ,[MaSach]
                               ,[SoLuong])
                         VALUES
                               ('{0}'
                               ,'{1}'
                               ,{2})", txtMaPhieuMuon.Text, s.MaSach, s.SoLuong);
                    ret = Utils.ExecuteSQL(sql);
                }
            }

            if (ret)
            {
                MessageBox.Show("In/Lưu phiếu mượn sách thành công !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                FormMain.Instance.LoadForm(new FormMuonTraSach());
                return;
            } 

            MessageBox.Show("In/Lưu phiếu mượn sách không thành công !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }
}
