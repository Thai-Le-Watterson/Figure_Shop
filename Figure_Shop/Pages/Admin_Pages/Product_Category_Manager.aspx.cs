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
    public partial class Product_Category_Manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            inp_malsp.Value = GridView1.SelectedRow.Cells[0].Text.ToString();
            inp_tenlsp.Value = GridView1.SelectedRow.Cells[1].Text.ToString();
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            try
            {
                string malsp = inp_malsp.Value,
                       ten_lsp = inp_tenlsp.Value,
                       hinh_anh = file_anh.FileName;

                if (malsp != "" && ten_lsp != "")
                {
                    Connect connect = new Connect();
                    DataTable product_by_name = connect.getData("select * from loai_sp where ma_loai = '" + malsp + "'");

                    if (product_by_name.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Loại sản phẩm đã tồn tại')</script>");
                    }
                    else
                    {
                        string sql = "insert into loai_sp(ma_loai, ten_loai) values(N'" + malsp + "', N'" + ten_lsp + "')";
                        if (hinh_anh != null)
                        {
                            sql = "insert into loai_sp values(N'" + malsp + "', N'" + ten_lsp + "', N'" + hinh_anh + "')";
                        }

                        int rowAff = connect.excuteQuery(sql);
                        if (rowAff > 0)
                        {
                            new Common().upload_image_icon(file_anh);
                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        }
                        else
                        {
                            Response.Write("<script>alert('Thêm loại sản phẩm thất bại')</script>");
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
                string malsp = inp_malsp.Value,
                       ten_lsp = inp_tenlsp.Value,
                       hinh_anh = file_anh.FileName;

                if (malsp != "" && ten_lsp != "")
                {
                    Connect connect = new Connect();
                    DataTable product_by_name = connect.getData("select * from loai_sp where ma_loai = '" + malsp + "'");

                    if (product_by_name.Rows.Count > 0)
                    {
                        string sql = "update loai_sp set ten_loai = N'" + ten_lsp + "' where ma_loai = '" + malsp + "'";
                        if (hinh_anh != null && hinh_anh != "")
                        {
                            sql = "update loai_sp set ten_loai = N'" + ten_lsp + "', hinh_anh = N'" + hinh_anh + "' where ma_loai = '" + malsp + "'";
                        }
                        int rowAff = connect.excuteQuery(sql);
                        if (rowAff > 0)
                        {
                            new Common().upload_image_icon(file_anh);
                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        }
                        else
                        {
                            Response.Write("<script>alert('Sửa loại sản phẩm thất bại')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Loại sản phẩm không tồn tại')</script>");
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
                string malsp = inp_malsp.Value;

                if (malsp != "")
                {
                    Connect connect = new Connect();
                    DataTable product_by_name = connect.getData("select * from loai_sp where ma_loai = '" + malsp + "'");

                    if (product_by_name.Rows.Count > 0)
                    {
                        int rowAff = connect.excuteQuery("delete from loai_sp where ma_loai = '" + malsp + "'");
                        if (rowAff > 0)
                        {
                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        }
                        else
                        {
                            Response.Write("<script>alert('Xóa loại sản phẩm thất bại')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Loại sản phẩm không tồn tại')</script>");
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