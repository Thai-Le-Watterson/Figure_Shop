using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Figure_Shop.Pages.Admin_Pages
{
    public partial class Cart_Manager : System.Web.UI.Page
    {
        public bool isHaveProductInCart = false;
        public bool isHaveCart = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load_khachhang();
                load_all_sp();
                load_sp_giohang();
            }
        }

        public void load_khachhang()
        {
            Connect connect = new Connect();
            DropDownList_khachhang.DataSource = connect.getData("select * from users where quyen = 'R1'");
            DropDownList_khachhang.DataValueField = "id";
            DropDownList_khachhang.DataTextField = "ten_tk";
            DropDownList_khachhang.DataBind();
        }

        public void load_all_sp()
        {
            Connect connect = new Connect();
            GridView1.DataSource = connect.getData("select * from san_pham");
            GridView1.DataBind();
        }

        public void load_sp_giohang()
        {
            Connect connect = new Connect();

            DataTable gio_hang = connect.getData("select * from gio_hang where user_id = '" + DropDownList_khachhang.SelectedValue + "'");

            if (gio_hang.Rows.Count > 0)
            {
                DataTable sp_gio_hang = connect.getData("select san_pham.* from san_pham, gio_hang, chi_tiet_gh where gio_hang.user_id = '" + DropDownList_khachhang.SelectedValue + "' and gio_hang.ma_gio_hang = chi_tiet_gh.ma_gio_hang and chi_tiet_gh.ma_sp = san_pham.ma_sp");
                GridView2.DataSource = sp_gio_hang;
                GridView2.DataBind();

                isHaveCart = true;
                if (sp_gio_hang.Rows.Count > 0)
                {
                    isHaveProductInCart = true;
                }
                else
                {
                    isHaveProductInCart = false;
                }
            }
            else
            {
                isHaveCart = false;
            }
        }

        protected void DropDownList_khachhang_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_sp_giohang();
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            try
            {
                string khach_hang = DropDownList_khachhang.SelectedValue;

                if (khach_hang != "")
                {
                    Connect connect = new Connect();
                    DataTable gio_hang = connect.getData("select * from gio_hang where user_id = '" + khach_hang + "'");

                    if (gio_hang.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Khách hàng này đã có giỏ hàng rồi')</script>");
                    }
                    else
                    {
                        int rowAff = connect.excuteQuery("insert into gio_hang(user_id) values('" + khach_hang + "')");
                        if (rowAff > 0)
                        {
                            load_sp_giohang();
                            Page.Response.Redirect(Page.Request.Url.ToString(), true);
                        }
                        else
                        {
                            Response.Write("<script>alert('Thêm giỏ hàng thất bại')</script>");
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

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            try
            {
                string khach_hang = DropDownList_khachhang.SelectedValue;

                if (khach_hang != "")
                {
                    Connect connect = new Connect();
                    DataTable gio_hang = connect.getData("select * from gio_hang where user_id = '" + khach_hang + "'");

                    if (gio_hang.Rows.Count > 0)
                    {
                        //Xóa sản phẩm trong chi tiết giỏ hàng
                        connect.excuteQuery("delete from chi_tiet_gh where ma_gio_hang = '" + gio_hang.Rows[0].ItemArray[0].ToString() + "'");

                        int rowAff = connect.excuteQuery("delete from gio_hang where user_id = '" + khach_hang + "'");
                        if (rowAff > 0)
                        {
                            Page.Response.Redirect(Page.Request.Url.ToString(), true);
                        }
                        else
                        {
                            Response.Write("<script>alert('Xóa giỏ hàng thất bại')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Khách hàng này không có giỏ hàng')</script>");
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
            try
            {
                Connect connect = new Connect();
                string ma_gh = connect.getField("select ma_gio_hang from gio_hang where user_id = '" + DropDownList_khachhang.SelectedValue + "'");

                if (ma_gh != "")
                {
                    Label lbl_masp = GridView1.SelectedRow.FindControl("lbl_masp") as Label;
                    int rowAff = connect.excuteQuery("insert into chi_tiet_gh values('" + ma_gh + "', '" + lbl_masp.Text + "')");
                    if (rowAff > 0)
                    {
                        load_sp_giohang();
                        //Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                    else
                    {
                        Response.Write("<script>alert('Thêm sản phẩm vào giỏ hàng thất bại')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Khách hàng vẫn chưa có giỏ hàng')</script>");
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + err.ToString() + "')</script>");
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Connect connect = new Connect();

                string ma_gh = connect.getField("select ma_gio_hang from gio_hang where user_id = '" + DropDownList_khachhang.SelectedValue + "'");
                Label lbl_masp = GridView2.SelectedRow.FindControl("lbl_masp_2") as Label;

                int rowAff = connect.excuteQuery("delete from chi_tiet_gh where ma_gio_hang = '" + ma_gh + "' and ma_sp = '" + lbl_masp.Text + "'");
                if (rowAff > 0)
                {
                    Page.Response.Redirect(Page.Request.Url.ToString(), false);
                }
                else
                {
                    Response.Write("<script>alert('Xóa sản phẩm khỏi giỏ hàng thất bại')</script>");
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + err.ToString() + "')</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load_all_sp();
            load_sp_giohang();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            load_all_sp();
            load_sp_giohang();
        }
    }
}