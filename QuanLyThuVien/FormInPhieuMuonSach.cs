using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien
{
    public partial class FormInPhieuMuonSach : Form
    {
        public FormInPhieuMuonSach()
        {
            InitializeComponent();
        }

        public FormInPhieuMuonSach(string maPhieuMuon)
            : this()
        {
            MaPhieuMuon = maPhieuMuon;
        }

        public string MaPhieuMuon { get; }

        private void txtQuayLai_Click(object sender, EventArgs e)
        {
            FormMain.Instance.LoadForm(new FormMuonTraSach());
        }

        private void FormInPhieuMuonSach_Load(object sender, EventArgs e)
        {
            string sql = "SELECT pm.MaPhieuMuon, pm.MaDG, dg.HoTen, pm.SoLuongSach FROM PHIEU_MUON_SACH pm INNER JOIN THE_DOCGIA dg ON pm.MaDG = dg.MaDG WHERE pm.MaPhieuMuon = N'" + MaPhieuMuon + "'";
            DataTable result = Utils.GetData(sql);
            if (result.Rows.Count > 0)
            {
                txtMaPhieuMuon.Text = result.Rows[0].Field<string>("MaPhieuMuon");
                txtTenDocGia.Text = result.Rows[0].Field<string>("HoTen");
                txtMaDocGia.Text = result.Rows[0].Field<string>("MaDG");
                txtSoLuong.Text = result.Rows[0].Field<int>("SoLuongSach").ToString();

                sql = "SELECT ROW_NUMBER() OVER(ORDER BY S.MaSach) AS STT, s.MaSach, s.TenSach, s.MaTheLoai, s.TacGia, pm.NgayMuon FROM CHITIET_MUONTRA ct INNER JOIN PHIEU_MUON_SACH pm ON ct.MaPhieuMuon = pm.MaPhieuMuon INNER JOIN SACH S ON ct.MaSach = S.MaSach WHERE pm.MaPhieuMuon = N'" + MaPhieuMuon + "'";
                result = Utils.GetData(sql);
                gridMuonSach.DataSource = null;
                gridMuonSach.DataSource = result;
                gridMuonSach.Refresh();
            }
        }
    }
}
