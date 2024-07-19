using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien.Models
{
    public class SachMuon
    {
        public int STT { get; set; }
        public string MaSach { get; set; }
        public string TenSach { get; set; }
        public string TheLoai { get; set; }
        public string TacGia { get; set; }
        public int SoLuong { get; set; }
        public DateTime NgayMuon { get; set; }
    }
}
