using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien
{
    public static class Utils
    {
        public static void LoadForm(Panel content, Form frm)
        {
            if (frm == null)
                return;

            foreach (Control control in content.Controls)
                content.Controls.Remove(control);

            frm.TopLevel = false;
            content.Controls.Add(frm);
            frm.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            frm.Dock = DockStyle.Fill;
            frm.Show();
        }

        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.
                    ConnectionStrings["QuanLyThuVien"].ConnectionString;
        }

        public static DataTable GetData(string sql)
        {
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection con = new SqlConnection(Utils.GetConnectionString()))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sql, con);
                    SqlDataReader reader = cmd.ExecuteReader();
                    dt.Load(reader);
                    con.Close();
                }
            }
            catch (Exception ex) {
                System.Diagnostics.Debug.WriteLine(sql);
                MessageBox.Show("Lỗi truy vấn GetData : " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            return dt;
        }

        public static bool ExecuteSQL(string sql)
        {
            bool ret = false;

            try
            {
                using (SqlConnection con = new SqlConnection(Utils.GetConnectionString()))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sql, con);
                    ret = cmd.ExecuteNonQuery() > 0;
                    con.Close();
                }
            }
            catch (Exception ex) 
            {
                System.Diagnostics.Debug.WriteLine(sql);
                MessageBox.Show("Lỗi truy vấn ExecuteSQL : " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }


            return ret;
        }
    }
}
