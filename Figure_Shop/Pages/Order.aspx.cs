using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Figure_Shop.Pages
{
    public partial class Order1 : System.Web.UI.Page
    {
        public ArrayList arr_soluong = new ArrayList();
        public string who = "";
        public string phone = "";
        public string address = "";
        public static int product_total = 0;
        public static double price_total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["arr_sp"] != null)
            {
                string str = "";
                int i = 0;
                foreach (string[] sp in (ArrayList)Session["arr_sp"])
                {
                    if (i == 0)
                    {
                        str += "'" + sp[0] + "'";
                    }
                    else
                    {
                        str += ",'" + sp[0] + "'";
                    }

                    arr_soluong.Add(sp[1]);
                    i++;
                }

                Connect connect = new Connect();
                DataList1.DataSource = connect.getData("select * from san_pham where ma_sp in(" + str + ")");
                DataList1.DataBind();

                Calc_Price();
            }

            who = inp_who.Value;
            phone = inp_phone.Value;
            address = inp_address.Value;
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
                        string ma_sp = DataList1.DataKeys[i].ToString();
                        Label txt_soluong = (Label)item.FindControl("Label5");
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
                        price_total += tong_gia;

                    i++;
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>console.log('" + err.ToString() + "')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            who = inp_who.Value;
            phone = inp_phone.Value;
            address = inp_address.Value;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (inp_who.Value != "" && inp_phone.Value != "" && inp_address.Value != "")
            {
                Connect connect = new Connect();
                string user_id = connect.getField("select id from users where email = '" + Session["user_email"].ToString() + "'");
                connect.excuteQuery("insert into hoa_don(user_id, tinh_trang, dia_chi, thanh_tien, nguoi_nhan, sdt) values(" + user_id + ", 'S0', N'" + inp_address.Value + "', " + price_total + ", N'" + inp_who.Value + "', '" + inp_phone.Value + "')");
                string ma_hoa_don = connect.getField("select top(1) ma_hoa_don from hoa_don where user_id = '" + user_id + "' order by ma_hoa_don desc");

                foreach (string[] sp in (ArrayList)Session["arr_sp"])
                {
                    connect.excuteQuery("insert into chi_tiet_hd values(" + ma_hoa_don + ", " + sp[0] + ", " + sp[1] + ")");
                    connect.excuteQuery("update san_pham set so_luong = so_luong - " + sp[1]);
                }
            }
            else
            {
                Response.Write("<script>alert('Thông tin địa chỉ nhận hàng đang bỏ trống !')</script>");
            }
        }
    }
}