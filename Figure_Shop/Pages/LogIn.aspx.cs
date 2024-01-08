using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Figure_Shop.Pages
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_signin_Click(object sender, EventArgs e)
        {
            try
            {
                if (inp_in_email.Value != "" && inp_in_password.Value != "")
                {
                    Connect connect = new Connect();
                    DataTable users_by_name = connect.getData("select * from users where email = '" + inp_in_email.Value + "' and mat_khau = '" + inp_in_password.Value + "'");

                    if (users_by_name.Rows.Count > 0)
                    {
                        //DataTable users = connect.getData("select * from user where ten = '" + inp_in_user_name.Value + "' and mat_khau = '" + inp_in_password.Value + "'");
                        object[] user_infor = users_by_name.Rows[0].ItemArray;

                        Session["user_name"] = user_infor[1].ToString();
                        Session["user_avatar"] = user_infor[2].ToString();
                        Session["user_email"] = user_infor[3].ToString();
                        Session["user_role"] = user_infor[5].ToString();

                        Response.Redirect("/Pages/Home.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Tài khoản không tồn tại!')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Dữ liệu nhập trống!')</script>");
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('"+err.ToString()+"')</script>");
            }
        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            try
            {
                if (inp_up_email.Value != "" && inp_up_password.Value != "" && inp_up_email.Value != "")
                {
                    Connect connect = new Connect();
                    DataTable users_by_name = connect.getData("select * from users where email = '" + inp_in_email.Value + "'");

                    if (users_by_name.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Email đã tồn tại!')</script>");
                    }
                    else
                    {
                        int rowAff = connect.excuteQuery("insert into users(ten_tk, email, mat_khau, avatar, quyen) values('" + inp_up_user_name.Value + "', '" + inp_up_email.Value + "', '" + inp_up_password.Value + "', 'user.jpg', 'R1')");

                        if (rowAff > 0)
                        {
                            string user_id = connect.getField("select id from users where email = '" + inp_up_email.Value + "'");
                            connect.excuteQuery("insert into gio_hang(user_id) values('" + user_id + "')");
                            Response.Redirect("/Pages/LogIn.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Đăng ký thất bại!')</script>");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Dữ liệu nhập trống!')</script>");
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + err.ToString() + "')</script>");
            }
        }
    }
}