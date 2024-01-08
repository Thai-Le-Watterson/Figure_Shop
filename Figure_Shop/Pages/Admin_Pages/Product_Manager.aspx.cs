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
    public partial class Product_Manager : System.Web.UI.Page
    {
        public string product_image = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_products_categories();
            }
        }

        public void upload_image()
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            strFolder = Server.MapPath("../../Assets/Images/Figures/");
            Response.Write("<script>alert('" + strFolder + "')</script>");
            // Retrieve the name of the file that is posted.
            strFileName = file_anh.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (file_anh.FileName != "")
            {
                // Create the folder if it does not exist.
                //if (!Directory.Exists(strFolder))
                //{
                //Directory.CreateDirectory(strFolder);
                //}
                // Save the uploaded file to the server.
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

        public void load_products_categories()
        {
            try
            {
                Connect connect = new Connect();
                DropDownList_loai_sp.DataSource = connect.getData("select * from loai_sp");
                DropDownList_loai_sp.DataValueField = "ma_loai";
                DropDownList_loai_sp.DataTextField = "ten_loai";
                DropDownList_loai_sp.DataBind();
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + err.ToString() + "')</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('" + GridView1.SelectedRow.Cells[5].Text + "')</script>");
            inp_masp.Value = GridView1.SelectedRow.Cells[0].Text.ToString();
            inp_tensp.Value = HttpUtility.HtmlDecode(GridView1.SelectedRow.Cells[1].Text.ToString());
            DropDownList_loai_sp.SelectedValue = GridView1.SelectedRow.Cells[2].Text.ToString();
            inp_gia.Value = GridView1.SelectedRow.Cells[3].Text.ToString();
            inp_giamgia.Value = GridView1.SelectedRow.Cells[4].Text.ToString();
            inp_soluong.Value = GridView1.SelectedRow.Cells[5].Text.ToString();
            inp_daban.Value = GridView1.SelectedRow.Cells[6].Text.ToString();
            inp_mota.Value = HttpUtility.HtmlDecode(GridView1.SelectedRow.Cells[7].Text.ToString());
            inp_hinhanhkhac.Value = GridView1.SelectedRow.Cells[9].Text.ToString();
            product_image = GridView1.SelectedRow.Cells[8].Text.ToString();
            
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            try
            {
                string masp = inp_masp.Value,
                       ten_sp = inp_tensp.Value,
                       loai_sp = DropDownList_loai_sp.SelectedValue.ToString(),
                       gia = inp_gia.Value,
                       giam_gia = inp_giamgia.Value,
                       so_luong = inp_soluong.Value,
                       da_ban = inp_daban.Value,
                       mo_ta = inp_mota.Value,
                       hinh_anh_khac = inp_hinhanhkhac.Value,
                       hinh_anh = file_anh.FileName;

                if (masp != "" && ten_sp != "" && loai_sp != "" && gia != "" && giam_gia != "" && so_luong != "" && da_ban != "" && mo_ta != "" && hinh_anh != "")
                {
                    Connect connect = new Connect();
                    DataTable product_by_name = connect.getData("select * from san_pham where ten_sp = '" + ten_sp + "'");

                    if (product_by_name.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Tên sản phẩm đã tồn tại')</script>");
                    }
                    else
                    {
                        int rowAff = connect.excuteQuery("insert into san_pham(ten_sp, ma_loai, gia, giam_gia, so_luong, da_ban, mo_ta, hinh_anh, hinh_anh_khac) values(N'" + ten_sp + "', '" + loai_sp + "', " + gia + ", " + giam_gia + ", " + so_luong + ", " + da_ban + ", N'" + mo_ta + "', N'" + hinh_anh + "', N'" + hinh_anh_khac + "')");
                        if (rowAff > 0)
                        {
                            upload_image();
                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        }
                        else
                        {
                            Response.Write("<script>alert('Thêm sản phẩm thất bại')</script>");
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
                string masp = inp_masp.Value,
                       ten_sp = inp_tensp.Value,
                       loai_sp = DropDownList_loai_sp.SelectedValue.ToString(),
                       gia = inp_gia.Value,
                       giam_gia = inp_giamgia.Value,
                       so_luong = inp_soluong.Value,
                       da_ban = inp_daban.Value,
                       mo_ta = inp_mota.Value,
                       hinh_anh_khac = inp_hinhanhkhac.Value,
                       hinh_anh = file_anh.FileName;

                if (masp != "" && ten_sp != "" && loai_sp != "" && gia != "" && giam_gia != "" && so_luong != "" && da_ban != "" && mo_ta != "")
                {
                    Connect connect = new Connect();
                    DataTable product_by_name = connect.getData("select * from san_pham where ma_sp = '" + masp + "'");

                    if (product_by_name.Rows.Count > 0)
                    {
                        string sql = "update san_pham set ten_sp = N'" + ten_sp + "', ma_loai = '" + loai_sp + "', gia = " + gia + ", giam_gia = " + giam_gia + ", so_luong = " + so_luong + ", da_ban = " + da_ban + ", mo_ta = N'" + mo_ta + "', hinh_anh_khac = N'" + hinh_anh_khac + "' where ma_sp = '" + masp + "'";
                        if (hinh_anh != "")
                            sql = "update san_pham set ten_sp = N'" + ten_sp + "', ma_loai = '" + loai_sp + "', gia = " + gia + ", giam_gia = " + giam_gia + ", so_luong = " + so_luong + ", da_ban = " + da_ban + ", mo_ta = N'" + mo_ta + "', hinh_anh_khac = N'" + hinh_anh_khac + "' , hinh_anh = N'" + hinh_anh + "' where ma_sp = '" + masp + "'";
                        
                        int rowAff = connect.excuteQuery(sql);
                        if (rowAff > 0)
                        {
                            upload_image();
                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        }
                        else
                        {
                            Response.Write("<script>alert('Sửa sản phẩm thất bại')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Sản phẩm không tồn tại')</script>");
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
                string masp = inp_masp.Value;

                if (masp != "")
                {
                    Connect connect = new Connect();
                    DataTable product_by_name = connect.getData("select * from san_pham where ma_sp = '" + masp + "'");

                    if (product_by_name.Rows.Count > 0)
                    {
                        if (connect.getData("select * from chi_tiet_gh where ma_sp = " + masp).Rows.Count > 0)
                        {
                            connect.excuteQuery("delete from chi_tiet_gh where ma_sp = " + masp);
                        }

                        if (connect.getData("select * from chi_tiet_hd where ma_sp = " + masp).Rows.Count > 0)
                        {
                            string so_luong_sp = connect.getField("select so_luong from chi_tiet_hd where ma_sp = " + masp);
                            string gia_sp = connect.getField("select gia from san_pham where ma_sp = " + masp);
                            connect.excuteQuery("delete from chi_tiet_hd where ma_sp = " + masp);
                            connect.excuteQuery("update hoa_don set thanh_tien = (thanh_tien - " + (double.Parse(so_luong_sp) * double.Parse(gia_sp)) + ")");
                        }

                        int rowAff = connect.excuteQuery("delete from san_pham where ma_sp = " + masp);
                        if (rowAff > 0)
                        {
                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        }
                        else
                        {
                            Response.Write("<script>alert('Xóa sản phẩm thất bại')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Sản phẩm không tồn tại')</script>");
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
    }
}