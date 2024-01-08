using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Figure_Shop.Pages
{
    public partial class Cart : System.Web.UI.Page
    {
        public static int product_total = 0;
        public static double price_total = 0;
        //static DataListItemCollection items = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_email"] == null)
            {
                Response.Redirect("/Pages/Home.aspx");
            }

            if (!IsPostBack)
            {
                Load_SP();
                Calc_Price();
            }
        }

        public void Load_SP()
        {
            Connect connect = new Connect();
            string user_id = connect.getField("select id from users where email = '" + Session["user_email"].ToString() + "'");
            string ma_gio_hang = connect.getField("select ma_gio_hang from gio_hang where user_id = " + user_id);
            DataList1.DataSource = connect.getData("select sp.* from san_pham sp, chi_tiet_gh ct where sp.ma_sp = ct.ma_sp and ct.ma_gio_hang = " + ma_gio_hang);
            DataList1.DataBind();

            //items = DataList1.Items;
        }

        public void Calc_Price()
        {
            try
            {
                int i = 0;
                product_total = 0;
                price_total = 0;

                //DataList dtl = DataList1;

                foreach (DataListItem item in DataList1.Items)
                {
                    Connect connect = new Connect();
                    CheckBox chk = (CheckBox)item.FindControl("CheckBox1");
                    if (chk != null && chk.Checked)
                    {
                        string ma_sp = DataList1.DataKeys[i].ToString();
                        TextBox txt_soluong = (TextBox)item.FindControl("TextBox1");
                        //Label lbl_gia = (Label)item.FindControl("Label2");
                        //Label lbl_giam_gia = (Label)item.FindControl("Label3");
                        string gia_goc = connect.getField("select gia from san_pham where ma_sp = " + ma_sp);
                        string giam_gia = connect.getField("select giam_gia from san_pham where ma_sp = " + ma_sp);

                        //string gia_goc = lbl_gia.Text;
                        //string giam_gia = lbl_giam_gia.Text;

                        double gia = (Double.Parse(gia_goc) - (Double.Parse(gia_goc) * Double.Parse(giam_gia) / 100.0));
                        int so_luong = int.Parse(txt_soluong.Text);
                        double tong_gia = gia * so_luong;

                        product_total += so_luong;
                        price_total +=  tong_gia;
                    }

                    i++;
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>console.log('" + err.ToString() + "')</script>");
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            Calc_Price();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            Calc_Price();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calc_Price();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Calc_Price();
        }

        protected void chk_check_all_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (chk_check_all.Checked)
                {
                    foreach (DataListItem item in DataList1.Items)
                    {
                        CheckBox chk = (CheckBox)item.FindControl("CheckBox1");
                        if (chk != null && !chk.Checked)
                        {
                            chk.Checked = true;
                            Calc_Price();
                        }
                    }
                }
                else
                {
                    foreach (DataListItem item in DataList1.Items)
                    {
                        CheckBox chk = (CheckBox)item.FindControl("CheckBox1");
                        if (chk != null && chk.Checked)
                        {
                            chk.Checked = false;
                            Calc_Price();
                        }
                    }
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>console.log('" + err.ToString() + "')</script>");
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Connect connect = new Connect();
                connect.excuteQuery("delete from chi_tiet_gh where ma_sp = " + DataList1.DataKeys[DataList1.SelectedIndex]);
                Response.Redirect("Cart.aspx");
            }
            catch (Exception err)
            {
                Response.Write("<script>console.log('" + err.ToString() + "')</script>");
            }
        }

        protected void btn_delete_all_Click(object sender, EventArgs e)
        {
            try
            {
                Connect connect = new Connect();
                string user_id = connect.getField("select id from users where email = N'" + Session["user_email"].ToString() + "'");
                string ma_gh = connect.getField("select ma_gio_hang from gio_hang where user_id = " + user_id);
                connect.excuteQuery("delete from chi_tiet_gh where ma_gio_hang = " + ma_gh);
                Response.Redirect("Cart.aspx");
            }
            catch (Exception err)
            {
                Response.Write("<script>console.log('" + err.ToString() + "')</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            ArrayList arr_sp = new ArrayList();
            int i = 0;
            foreach (DataListItem item in DataList1.Items)
            {
                Connect connect = new Connect();
                CheckBox chk = (CheckBox)item.FindControl("CheckBox1");

                if (chk != null && chk.Checked)
                {
                    TextBox txt_soluong = (TextBox)item.FindControl("TextBox1");
                    arr_sp.Add(new string[2] { DataList1.DataKeys[i].ToString(), txt_soluong.Text });
                }
                i++;
            }

            Session["arr_sp"] = arr_sp;
            Response.Redirect("Order.aspx");
        }
    }
}