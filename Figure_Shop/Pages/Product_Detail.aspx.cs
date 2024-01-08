using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Threading;

namespace Figure_Shop.Pages
{
    public partial class Product_Detail : System.Web.UI.Page
    {
        public string[] images = null;
        public string ma_loai = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["masp"] == null)
                {
                    Connect connect = new Connect();
                    Response.Redirect("./Product.aspx");
                }
                else
                {
                    Load_SP();
                    Load_SP_LQ();
                }
            }
            else
            {
                if (Request.QueryString["masp"] != null)
                {
                    Load_Imgs_SP();
                }
            }
        }

        public void Load_SP()
        {
            if (Request.QueryString["masp"] != null)
            {
                Connect connect = new Connect();

                SqlDataSource sqlDataSrc = new SqlDataSource(connect.connectString, "select * from san_pham where ma_sp = " + Request.QueryString["masp"]);
                DataList1.DataSource = sqlDataSrc;
                DataList1.DataBind();

                Load_Imgs_SP();
            }
        }

        public void Load_Imgs_SP()
        {
            string hinh_anh_khac = new Connect().getField("select hinh_anh_khac from san_pham where ma_sp = " + Request.QueryString["masp"]);
            images = hinh_anh_khac != "" ? hinh_anh_khac.Split(',') : null;
        }

        public void Load_SP_LQ()
        {
            if (Request.QueryString["masp"] != null)
            {
                Connect connect = new Connect();
                
                ma_loai = connect.getField("select ma_loai from san_pham where ma_sp = " + Request.QueryString["masp"]);

                SqlDataSource sqlDataSrc = new SqlDataSource(connect.connectString, "select TOP(5) * from san_pham where ma_loai = '" + ma_loai + "' and not ma_sp = " + Request.QueryString["masp"]);
                DataList2.DataSource = sqlDataSrc;
                DataList2.DataBind();
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_themvaogio_Click(object sender, EventArgs e)
        {
            //if (Session["user_email"].ToString() != "")
            //{

            //}
            //else
            //{
            //    Response.Write("");
            //}
            //for (int i = 0; i < 5; i++)
            //{
            //    Response.Write("<script>alert('" + i + "')</script>");
            //    //Thread.Sleep(3000);
            //}
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "Add_To_Cart")
            {
                if (Session["user_email"] != null)
                {
                    Connect connect = new Connect();
                    string ma_sp = Request.QueryString["masp"];
                    DataTable sp = connect.getData("select * from chi_tiet_gh where ma_sp = " + ma_sp);

                    if (sp.Rows.Count > 0)
                    {
                        Response.Write("Sản phẩm đã được thêm vào giỏ hàng");
                    }
                    else
                    {
                        string user_id = connect.getField("select id from users where email = '" + Session["user_email"].ToString() + "'");
                        string ma_gh = connect.getField("select ma_gio_hang from gio_hang where user_id = " + user_id);
                        int rowAff = connect.excuteQuery("insert into chi_tiet_gh values(" + ma_gh + ", " + ma_sp + ")");

                        if(rowAff > 0) {
                            Response.Write("Sản phẩm đã được thêm");
                        }
                    }
                }
                else
                {
                    snackbar2.CssClass = "snackbar2 show";
                }
            }
            else if (e.CommandName.ToString() == "Buy_Product")
            {
                if (Session["user_email"] != null)
                {
                    ArrayList arr_sp = new ArrayList();
                    TextBox txt_soluong = (TextBox)DataList1.Items[0].FindControl("txt_soluong");
                    arr_sp.Add(new string[2] { Request.QueryString["masp"].ToString(), txt_soluong.Text });
                    Session["arr_sp"] = arr_sp;
                    Response.Redirect("Order.aspx");
                }
                else
                {
                    snackbar2.CssClass = "snackbar2 show";
                }
            }
        }

        protected void btn_mua_Click(object sender, EventArgs e)
        {
        }
    }
}