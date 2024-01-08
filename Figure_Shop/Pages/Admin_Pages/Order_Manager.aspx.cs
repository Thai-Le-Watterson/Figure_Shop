using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

namespace Figure_Shop.Pages.Admin_Pages
{
    public partial class Order_Manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_khachhang();
                load_donhang(DropDownList_khachhang.SelectedValue);
                load_tinhtrang();
                load_san_pham();
                load_all_san_pham();
                load_thongtindh();
            }
        }

        public void load_san_pham()
        {
            string sql = "SELECT san_pham.ma_sp, san_pham.ten_sp, san_pham.gia, chi_tiet_hd.so_luong FROM san_pham, chi_tiet_hd WHERE san_pham.ma_sp = chi_tiet_hd.ma_sp and chi_tiet_hd.ma_hoa_don = '" + DropDownList_donhang.SelectedValue + "'";
            Connect connect = new Connect();
            GridView1.DataSource = connect.getData(sql);
            GridView1.DataBind();
        }

        public void load_all_san_pham()
        {
            string sql = "SELECT * FROM san_pham";
            Connect connect = new Connect();
            GridView2.DataSource = connect.getData(sql);
            GridView2.DataBind();
        }

        public void load_khachhang()
        {
            Connect connect = new Connect();
            DropDownList_khachhang.DataSource = connect.getData("select * from users where quyen = 'R1'");
            DropDownList_khachhang.DataValueField = "id";
            DropDownList_khachhang.DataTextField = "ten_tk";
            DropDownList_khachhang.DataBind();
        }

        public void load_donhang(string ma_kh = "")
        {
            Connect connect = new Connect();

            string sql = "select * from hoa_don";
            if (ma_kh != "")
            {
                sql = "select * from hoa_don where user_id = '" + ma_kh + "'";
            }

            DataTable hoa_don = connect.getData(sql);

            DropDownList_donhang.DataSource = hoa_don;
            DropDownList_donhang.DataValueField = "ma_hoa_don";
            DropDownList_donhang.DataTextField = "ma_hoa_don";
            DropDownList_donhang.DataBind();

            if (hoa_don.Rows.Count > 0)
            {
                inp_thanhtien.Value = hoa_don.Rows[0].ItemArray[4].ToString();
                inp_diachi.Value = hoa_don.Rows[0].ItemArray[2].ToString();
                inp_nguoinhan.Value = hoa_don.Rows[0].ItemArray[5].ToString();
                inp_sdt.Value = hoa_don.Rows[0].ItemArray[6].ToString();
            }
        }

        public void load_tinhtrang()
        {
            Connect connect = new Connect();
            DropDownList_tinhtrang.DataSource = connect.getData("select * from code where type = 'STATUS'");
            DropDownList_tinhtrang.DataValueField = "id";
            DropDownList_tinhtrang.DataTextField = "value";
            DropDownList_tinhtrang.DataBind();
        }

        public void load_thongtindh()
        {
            Connect connect = new Connect();

            string tinhtrang = connect.getField("select tinh_trang from hoa_don where ma_hoa_don = '" + DropDownList_donhang.SelectedValue + "'");
            string diachi = connect.getField("select dia_chi from hoa_don where ma_hoa_don = '" + DropDownList_donhang.SelectedValue + "'");
            string thanhtien = connect.getField("select thanh_tien from hoa_don where ma_hoa_don = '" + DropDownList_donhang.SelectedValue + "'");
            string nguoinhan = connect.getField("select nguoi_nhan from hoa_don where ma_hoa_don = '" + DropDownList_donhang.SelectedValue + "'");
            string sdt = connect.getField("select sdt from hoa_don where ma_hoa_don = '" + DropDownList_donhang.SelectedValue + "'");

            DropDownList_tinhtrang.SelectedValue = tinhtrang;
            inp_diachi.Value = diachi;
            inp_thanhtien.Value = thanhtien;
            inp_nguoinhan.Value = nguoinhan;
            inp_sdt.Value = sdt;

            load_san_pham();
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            try
            {
                string khach_hang = DropDownList_khachhang.SelectedValue,
                       dia_chi = inp_diachi.Value,
                       tinh_trang = DropDownList_tinhtrang.SelectedValue,
                       nguoi_nhan = inp_nguoinhan.Value,
                       sdt = inp_sdt.Value;

                if (khach_hang != "" && dia_chi != "" && tinh_trang != "" && nguoi_nhan != "" && sdt != "")
                {
                    Connect connect = new Connect();
                    int rowAff = connect.excuteQuery("insert into hoa_don(user_id, dia_chi, tinh_trang, thanh_tien, nguoi_nhan, sdt) values('" + khach_hang + "', N'" + dia_chi + "', '" + tinh_trang + "', 0, N'" + nguoi_nhan + "', '" + sdt + "')");
                    if (rowAff > 0)
                    {
                        load_donhang(DropDownList_khachhang.SelectedValue);
                        load_thongtindh();
                        //Page.Response.Redirect(Page.Request.Url.ToString(), false);
                    }
                    else
                    {
                        Response.Write("<script>alert('Thêm hóa đơn thất bại')</script>");
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
                string so_hoa_don = DropDownList_donhang.SelectedValue,
                       dia_chi = inp_diachi.Value,
                       tinh_trang = DropDownList_tinhtrang.SelectedValue,
                       nguoi_nhan = inp_nguoinhan.Value,
                       sdt = inp_sdt.Value;

                if (so_hoa_don != "" && dia_chi != "" && tinh_trang != "" && nguoi_nhan != "" && sdt != "")
                {
                    Connect connect = new Connect();
                    int rowAff = connect.excuteQuery("update hoa_don set dia_chi = N'" + dia_chi + "', tinh_trang = '" + tinh_trang + "', nguoi_nhan = N'" + nguoi_nhan + "', sdt = '" + sdt + "' where ma_hoa_don = " + so_hoa_don);
                    if (rowAff > 0)
                    {
                        load_donhang(DropDownList_khachhang.SelectedValue);
                        load_thongtindh();
                        //Page.Response.Redirect(Page.Request.Url.ToString(), false);
                    }
                    else
                    {
                        Response.Write("<script>alert('Sửa hóa đơn thất bại')</script>");
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
                string ma_don = DropDownList_donhang.SelectedValue;

                if (ma_don != "")
                {
                    Connect connect = new Connect();

                    //Xóa data trong chi tiết hóa đơn
                    connect.excuteQuery("delete from chi_tiet_hd where ma_hoa_don = '" + ma_don + "'");

                    int rowAff = connect.excuteQuery("delete from hoa_don where ma_hoa_don = '"+ma_don+"'");
                    if (rowAff > 0)
                    {
                        load_donhang(DropDownList_khachhang.SelectedValue);
                        load_thongtindh();
                        //Page.Response.Redirect(Page.Request.Url.ToString(), false);
                    }
                    else
                    {
                        Response.Write("<script>alert('Xóa hóa đơn thất bại')</script>");
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

        protected void DropDownList_khachhang_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_donhang(DropDownList_khachhang.SelectedValue);
            load_san_pham();
        }

        protected void DropDownList_donhang_SelectedIndexChanged(object sender, EventArgs e)
        {
            Connect connect = new Connect();
            string tinhtrang = connect.getField("select tinh_trang from hoa_don where ma_hoa_don = '" + DropDownList_donhang.SelectedValue + "'");

            DropDownList_tinhtrang.SelectedValue = tinhtrang;
            load_san_pham();
            load_thongtindh();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
        }

        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //HtmlInputControl input_so_luong = GridView2.SelectedRow.FindControl("inp_so_luong") as HtmlInputControl;
                TextBox input_so_luong = GridView2.SelectedRow.FindControl("inp_so_luong") as TextBox;
                Label lbl_masp = GridView2.SelectedRow.FindControl("lbl_masp_2") as Label;
                string ma_don = DropDownList_donhang.SelectedValue,
                       ma_sp = lbl_masp.Text,
                       so_luong = input_so_luong.Text;

                if (ma_don != "" && ma_sp != "" && so_luong != "")
                {
                    Connect connect = new Connect();
                    DataTable sp_hoadon = connect.getData("select * from chi_tiet_hd where ma_hoa_don = '" + ma_don + "' and ma_sp = '" + ma_sp + "'");
                    int rowAff;
                    if (sp_hoadon.Rows.Count > 0)
                    {
                        int so_luong_2 = int.Parse(sp_hoadon.Rows[0].ItemArray[2].ToString()) + int.Parse(so_luong);
                        rowAff = connect.excuteQuery("update chi_tiet_hd set so_luong = " + so_luong_2 + " where ma_hoa_don = '" + ma_don + "' and ma_sp = '" + ma_sp + "'");
                    }
                    else
                    {
                        rowAff = connect.excuteQuery("insert into chi_tiet_hd(ma_hoa_don, ma_sp, so_luong) values('" + ma_don + "', '" + ma_sp + "', " + so_luong + ")");
                    }

                    if (rowAff > 0)
                    {
                        //Tính lại số lượng tồn kho của sản phẩm
                        string so_luong_ton = connect.getField("select so_luong from san_pham where ma_sp = '" + ma_sp + "'");
                        int so_luong_ton_2 = int.Parse(so_luong_ton) - int.Parse(so_luong);
                        connect.excuteQuery("update san_pham set so_luong = " + so_luong_ton_2 + " where ma_sp = '" + ma_sp + "'");

                        //Tính lại thành tiền của hóa đơn
                        string gia_sp = connect.getField("select gia from san_pham where ma_sp = '" + ma_sp + "'");
                        double thanh_tien = double.Parse(gia_sp) * double.Parse(so_luong);
                        connect.excuteQuery("update hoa_don set thanh_tien = (thanh_tien + " + thanh_tien + ") where ma_hoa_don = '" + ma_don + "'");

                        //Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        load_san_pham();
                        load_all_san_pham();
                        load_thongtindh();
                    }
                    else
                    {
                        Response.Write("<script>alert('Thêm hóa đơn thất bại')</script>");
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
                Label lbl_masp = (Label)GridView1.SelectedRow.FindControl("lbl_masp");
                Label lbl_so_luong = (Label)GridView1.SelectedRow.FindControl("lbl_so_luong");
                string ma_don = DropDownList_donhang.SelectedValue,
                       ma_sp = lbl_masp.Text,
                       sl_trong_don = lbl_so_luong.Text;

                Response.Write("<script>alert('ma_don = " + ma_don + ", ma_sp = " + ma_sp + "')</script>");

                if (ma_don != "" && ma_sp != "")
                {
                    Connect connect = new Connect();
                    int rowAff = connect.excuteQuery("delete from chi_tiet_hd where ma_hoa_don = " + ma_don + " and ma_sp = " + ma_sp);
                    if (rowAff > 0)
                    {
                        //Tính lại số lượng tồn kho của sản phẩm
                        string so_luong_ton = connect.getField("select so_luong from san_pham where ma_sp = '" + ma_sp + "'");
                        int so_luong_ton_2 = int.Parse(so_luong_ton) + int.Parse(sl_trong_don);
                        connect.excuteQuery("update san_pham set so_luong = " + so_luong_ton_2 + " where ma_sp = '" + ma_sp + "'");

                        //Tính lại thành tiền của hóa đơn
                        string gia_sp = connect.getField("select gia from san_pham where ma_sp = '" + ma_sp + "'");
                        double thanh_tien = double.Parse(gia_sp) * double.Parse(sl_trong_don);
                        connect.excuteQuery("update hoa_don set thanh_tien = (thanh_tien - " + thanh_tien + ") where ma_hoa_don = '" + ma_don + "'");
                        Page.Response.Redirect(Page.Request.Url.ToString(), false);
                    }
                    else
                    {
                        Response.Write("<script>alert('Xóa hóa đơn thất bại')</script>");
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

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            load_san_pham();
            load_all_san_pham();
        }
    }
}