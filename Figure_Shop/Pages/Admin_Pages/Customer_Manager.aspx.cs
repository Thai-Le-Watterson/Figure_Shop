using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Figure_Shop.Pages.Admin_Pages
{
    public partial class Customer_Manager : System.Web.UI.Page
    {
        public string custom_avatar = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void upload_image()
        {
            string strFileName;
            string strFilePath;
            string strFolder;

            strFolder = Server.MapPath("../../Assets/Images/avatar/");
            strFileName = file_anh.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);

            if (file_anh.FileName != "")
            {
                strFilePath = strFolder + strFileName;
                if (File.Exists(strFilePath))
                {
                    Response.Write("<script>alert('already exists on the server!')</script>");
                }
                else
                {
                    file_anh.PostedFile.SaveAs(strFilePath);
                    Response.Write("<script>alert('has been successfully uploaded.')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Click \'Browse\' to select the file to upload.')</script>");
            }
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            try
            {
                string ten_kh = inp_tenkh.Value,
                       email = inp_email.Value,
                       mat_khau = inp_matkhau.Value,
                       avatar = file_anh.PostedFile.FileName;


                if (ten_kh != "" && email != "" && mat_khau != "")
                {
                    Connect connect = new Connect();
                    DataTable product_by_name = connect.getData("select * from users where email = N'" + email + "'");

                    if (product_by_name.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Tên khách hàng đã tồn tại')</script>");
                    }
                    else
                    {
                        avatar = avatar != "" ? avatar : "user.jpg";
                        string sql_kh = "insert into users(ten_tk, email, mat_khau, avatar, quyen) values(N'" + ten_kh + "', N'" + email + "', '" + mat_khau + "', N'" + avatar + "', 'R1')";

                        int rowAff = connect.excuteQuery(sql_kh);
                        if (rowAff > 0)
                        {
                            upload_image();

                            string user_id = connect.getField("select id from users where email = N'" + email + "'");
                            string sql_gio_hang = "insert into gio_hang(user_id) values('" + user_id + "')";
                            connect.excuteQuery(sql_gio_hang);

                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        }
                        else
                        {
                            Response.Write("<script>alert('Thêm khách hàng thất bại')</script>");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Dữ liệu trống')</script>");
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + err.ToString() + "')</script>");
            }
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            try
            {
                string ten_kh = inp_tenkh.Value,
                       email = inp_email.Value,
                       mat_khau = inp_matkhau.Value,
                       avatar = file_anh.PostedFile.FileName;


                if (ten_kh != "" && email != "" && mat_khau != "")
                {
                    Connect connect = new Connect();
                    DataTable product_by_name = connect.getData("select * from users where email = N'" + email + "'");

                    if (product_by_name.Rows.Count > 0)
                    {
                        string sql = "update users set ten_tk = N'" + ten_kh + "', mat_khau = '" + mat_khau + "' where email = N'" + email + "'";
                        if (avatar != "")
                        {
                            sql = "update users set ten_tk = N'" + ten_kh + "', mat_khau = '" + mat_khau + "', avatar = N'" + avatar + "' where email = N'" + email + "'";
                        }
                        int rowAff = connect.excuteQuery(sql);
                        if (rowAff > 0)
                        {
                            upload_image();
                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        }
                        else
                        {
                            Response.Write("<script>alert('Sửa thông tin khách hàng thất bại')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Email không tồn tại')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Dữ liệu trống')</script>");
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + err.ToString() + "')</script>");
            }
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            try
            {
                string email = inp_email.Value;

                if (email != "")
                {
                    Connect connect = new Connect();
                    DataTable product_by_name = connect.getData("select * from users where email = N'" + email + "'");

                    if (product_by_name.Rows.Count > 0)
                    {
                        string user_id = connect.getField("select id from users where email = N'" + email + "'");

                        string ma_gh = connect.getField("select ma_gio_hang from gio_hang where user_id = '" + user_id + "'");
                        if(ma_gh != "")
                            connect.excuteQuery("delete chi_tiet_gh where ma_gio_hang = '" + ma_gh + "'");

                        string sql_gio_hang = "delete gio_hang where user_id = '" + user_id + "'";
                        connect.excuteQuery("delete gio_hang where user_id = '" + user_id + "'");

                        string[] ma_hd = connect.getFields("select ma_hoa_don from hoa_don where user_id = '" + user_id + "'");
                        if(ma_hd.Length > 0)
                            foreach (string ma in ma_hd)
                            {
                                connect.excuteQuery("delete chi_tiet_hd where ma_hoa_don = '" + ma + "'");
                            }
                        connect.excuteQuery("delete hoa_don where user_id = '" + user_id + "'");

                        int rowAff = connect.excuteQuery("delete from users where email = N'" + email + "'");
                        if (rowAff > 0)
                        {
                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        }
                        else
                        {
                            Response.Write("<script>alert('Xóa khách hàng thất bại')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Email không tồn tại')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Dữ liệu trống')</script>");
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + err.ToString() + "')</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            inp_tenkh.Value = GridView1.SelectedRow.Cells[1].Text.ToString();
            inp_email.Value = GridView1.SelectedRow.Cells[2].Text.ToString();
            inp_matkhau.Value = GridView1.SelectedRow.Cells[3].Text.ToString();
            custom_avatar = GridView1.SelectedRow.Cells[4].Text.ToString();
        }
    }
}