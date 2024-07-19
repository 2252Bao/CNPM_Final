using System;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace QuanLyThuVien
{
    public partial class FormTheDocGia : Form
    {
        private int minimumAge;

        public FormTheDocGia()
        {
            InitializeComponent();
        }

        private void FormTheDocGia_Load(object sender, EventArgs e)
        {
            dtNgaySinh.Value = DateTime.Now.AddYears(-18);
            dtNgayLapThe.Value = DateTime.Now;
            LoadComboTaiKhoan();
            LoadMinimumAge();
        }

        private void btnLapThe_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtHoTen.Text))
            {
                MessageBox.Show("Tên độc giả không được để trống !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                return;
            }

            if (cboLoaiDocGia.SelectedIndex < 0)
            {
                MessageBox.Show("Tài khoản chưa được chọn !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                return;
            }

            string email = guna2TextBox2.Text;
            if (!IsValidEmail(email))
            {
                MessageBox.Show($"Email không hợp lệ! Email phải có đuôi @gmail.com  Email bạn nhập: {email}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                return;
            }

            string phoneNumber = txtSdt.Text;
            if (!IsValidPhoneNumber(phoneNumber))
            {
                MessageBox.Show($"Số điện thoại không hợp lệ! Số điện thoại phải bắt đầu bằng số 0 và có 10 chữ số. Số điện thoại bạn nhập: {phoneNumber}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                return;
            }

            if (!IsValidAge(dtNgaySinh.Value))
            {
                MessageBox.Show($"Độc giả không đủ tuổi theo quy định! Tuổi tối thiểu là {minimumAge}.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                return;
            }

            using (SqlConnection con = new SqlConnection(Utils.GetConnectionString()))
            {
                con.Open();
                string sql = "INSERT INTO THE_DOCGIA(MADG, HOTEN, Email, MaTaiKhoan, NgaySinh, Sdt, DiaChi, NgayLapTheDocGia, NgayHetHan) VALUES (@MaDG, @HoTen, @Email, @MaTaiKhoan, @NgaySinh, @Sdt, @DiaChi, @NgayLapTheDocGia, @NgayHetHan)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@MaDG", "DG" + (int)DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1)).TotalSeconds);
                cmd.Parameters.AddWithValue("@HoTen", txtHoTen.Text);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@MaTaiKhoan", cboLoaiDocGia.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@NgaySinh", dtNgaySinh.Value);
                cmd.Parameters.AddWithValue("@Sdt", phoneNumber);
                cmd.Parameters.AddWithValue("@DiaChi", txtDiaChi.Text);
                cmd.Parameters.AddWithValue("@NgayLapTheDocGia", dtNgayLapThe.Value);
                cmd.Parameters.AddWithValue("@NgayHetHan", dtNgayLapThe.Value.AddMonths(6));

                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Thêm mới độc giả thành công !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    con.Close();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Thêm mới độc giả không thành công !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                }
                con.Close();
            }
        }

        private void LoadComboTaiKhoan()
        {
            using (SqlConnection con = new SqlConnection(Utils.GetConnectionString()))
            {
                con.Open();
                string sql = "SELECT * FROM TAIKHOAN";
                SqlCommand cmd = new SqlCommand(sql, con);
                DataTable result = new DataTable();
                SqlDataReader reader = cmd.ExecuteReader();
                result.Load(reader);
                cboLoaiDocGia.DataSource = result;
                cboLoaiDocGia.DisplayMember = "MaTK";
                cboLoaiDocGia.ValueMember = "MaTK";
                con.Close();
            }
        }

        private void LoadMinimumAge()
        {
            using (SqlConnection con = new SqlConnection(Utils.GetConnectionString()))
            {
                con.Open();
                string sql = "SELECT MinAge FROM QUY_DINH";
                SqlCommand cmd = new SqlCommand(sql, con);
                minimumAge = (int)cmd.ExecuteScalar();
                con.Close();
            }
        }

        private bool IsValidEmail(string email)
        {
            string pattern = @"^[a-zA-Z0-9._%+-]+@gmail\.com$";
            return Regex.IsMatch(email, pattern);
        }

        private bool IsValidPhoneNumber(string phoneNumber)
        {
            string pattern = @"^0\d{9}$";
            return Regex.IsMatch(phoneNumber, pattern);
        }

        private bool IsValidAge(DateTime birthDate)
        {
            int age = DateTime.Now.Year - birthDate.Year;
            if (birthDate > DateTime.Now.AddYears(-age)) age--;
            return age >= minimumAge;
        }

        private void dtNgaySinh_ValueChanged(object sender, EventArgs e)
        {

            if (!IsValidAge(dtNgaySinh.Value))
            {
                MessageBox.Show($"Độc giả không đủ tuổi theo quy định! Tuổi tối thiểu là {minimumAge}.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
        }

        private void dtNgaySinh_ValueChanged_1(object sender, EventArgs e)
        {

        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
