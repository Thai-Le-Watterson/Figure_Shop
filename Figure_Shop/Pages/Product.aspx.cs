using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;

namespace Figure_Shop.Pages
{
    public partial class Product : System.Web.UI.Page
    {
        SqlDataSource SqlDataSource3;
        public bool isHaveProduct = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["loc"] != null)
            {
                string filter = Request.QueryString["loc"].ToString();
                Load_SP(filter);

                if (filter == "moi")
                {
                    btn_moi.CssClass = "filter_item active";
                    btn_banchay.CssClass = "filter_item";
                    ddl_gia.CssClass = "filter_item";
                }
                else if (filter == "banchay")
                {
                    btn_moi.CssClass = "filter_item";
                    btn_banchay.CssClass = "filter_item active";
                    ddl_gia.CssClass = "filter_item";
                }
                else if (filter == "len")
                {
                    btn_moi.CssClass = "filter_item";
                    btn_banchay.CssClass = "filter_item";
                    ddl_gia.CssClass = "filter_item active";
                }
            }
            else
            {
                Load_SP();
            }

            if (DataList1.Items.Count == 0)
            {
                isHaveProduct = false;
            }

            //if (IsPostBack)
            //{
            //    if (ViewState["ddl_selectedValue"] != null)
            //        ddl_gia.SelectedValue = ViewState["ddl_selectedValue"].ToString();
            //}
            if (!IsPostBack)
            {
                Load_Price_Filter();
            }
        }

        public void Load_Price_Filter()
        {
            ListItem macdinh = new ListItem("Giá: Mặc định", "macdinh");
            ListItem len = new ListItem("Giá: Thấp đến Cao", "len");
            ListItem xuong = new ListItem("Giá: Cao đến Thấp", "xuong");
            ddl_gia.Items.Add(macdinh);
            ddl_gia.Items.Add(len);
            ddl_gia.Items.Add(xuong);
        }

        public void Load_SP(string filter = "")
        {
            Connect connect = new Connect();

            string sql = "";
            string order = "";

            //if (Request.QueryString["loc"] != null)
            //{
                //string filter = Request.QueryString["loc"].ToString();
                if (filter == "moi")
                {
                    order = "order by ma_sp desc";
                }
                else if (filter == "banchay")
                {
                    order = "order by da_ban desc";
                }
                else if (filter == "len")
                {
                    order = "order by gia asc";
                }
                else if (filter == "xuong")
                {
                    order = "order by gia desc";
                } 
            //}

            if (Request.QueryString["ma_loai"] != null)
            {
                sql = "select * from san_pham where ma_loai = '" + Request.QueryString["ma_loai"].ToString() + "'";
            }
            else if (Request.QueryString["search"] != null)
            {
                string[] list_name_valid = Search_Name(Request.QueryString["search"]);

                if(list_name_valid.Length > 0)
                    sql = "select * from san_pham where ten_sp in (" + string.Join(",", list_name_valid) + ")";
                else
                {
                    sql = "select * from san_pham";
                }
            }
            else
            {
                sql = "select * from san_pham";
            }

            sql += " " + order;

            SqlDataSource3 = new SqlDataSource(connect.connectString, sql);
            DataList1.DataSource = SqlDataSource3;
            DataList1.DataBind();
        }

        public string[] Search_Name(string search)
        {
            Connect connect = new Connect();

            DataTable table_list_name = connect.getData("select ten_sp from san_pham");
            //string[] sentences = connect.getFields("select ten_sp from san_pham");
            string[] list_name = new string[table_list_name.Rows.Count];
            int list_name_i = 0;
            string[] sentences = new string[table_list_name.Rows.Count];
            int sentences_i = 0;

            foreach (DataRow row in table_list_name.Rows)
            {
                sentences[sentences_i] = row.ItemArray[0].ToString();
                sentences_i++;
            }


            foreach (string s in sentences)
            {
                string s2 = RemoveDiacritics(s).Replace(" ", "").ToLower();
                s2 = Regex.Replace(s2, "[^a-zA-Z0-9]+", "", RegexOptions.Compiled);

                search = RemoveDiacritics(search).Replace(" ", "").ToLower();
                search = Regex.Replace(search, "[^a-zA-Z0-9]", "", RegexOptions.Compiled);

                if (s2.Contains(search))
                {
                    Response.Write("<script>console.log('" + search + ", " + s2 + "')</script>");
                    list_name[list_name_i] = "N'" + s + "'";
                    list_name_i++;
                }
                else
                {
                    Console.WriteLine();
                }
            }

            list_name = list_name.Where(x => !string.IsNullOrEmpty(x)).ToArray();

            return list_name;
        }

        string RemoveDiacritics(string text)
        {
            var normalizedString = text.Normalize(NormalizationForm.FormD);
            var stringBuilder = new StringBuilder(capacity: normalizedString.Length);

            for (int i = 0; i < normalizedString.Length; i++)
            {
                char c = normalizedString[i];
                if (c == 'đ' || c == 'Đ')
                {
                    c = 'd';
                }
                var unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
                if (unicodeCategory != UnicodeCategory.NonSpacingMark)
                {
                    stringBuilder.Append(c);
                }
            }

            return stringBuilder
                .ToString()
                .Normalize(NormalizationForm.FormC);
        }

        protected void btn_moi_Click(object sender, EventArgs e)
        {
            Load_SP("moi");

            btn_moi.CssClass = "filter_item active";
            btn_banchay.CssClass = "filter_item";
            ddl_gia.CssClass = "filter_item";

            ddl_gia.SelectedValue = "macdinh";

            //if (Request.QueryString["ma_loai"] != null)
            //{
            //    Response.Redirect("Product.aspx?ma_loai=" + Request.QueryString["ma_loai"].ToString() + "&loc=moi");
            //}
            //else if (Request.QueryString["search"] != null)
            //{
            //    Response.Redirect("Product.aspx?search=" + Request.QueryString["search"].ToString() + "&loc=moi");
            //}
            //else
            //{
            //    Response.Redirect("Product.aspx?loc=moi");
            //}
        }

        protected void btn_banchay_Click(object sender, EventArgs e)
        {
            Load_SP("banchay");

            btn_moi.CssClass = "filter_item";
            btn_banchay.CssClass = "filter_item active";
            ddl_gia.CssClass = "filter_item";

            ddl_gia.SelectedValue = "macdinh";

            //if (Request.QueryString["ma_loai"] != null)
            //{
            //    Response.Redirect("Product.aspx?ma_loai=" + Request.QueryString["ma_loai"].ToString() + "&loc=banchay");
            //}
            //else if (Request.QueryString["search"] != null)
            //{
            //    Response.Redirect("Product.aspx?search=" + Request.QueryString["search"].ToString() + "&loc=banchay");
            //}
            //else
            //{
            //    Response.Redirect("Product.aspx?loc=banchay");
            //}
        }

        protected void ddl_gia_SelectedIndexChanged(object sender, EventArgs e)
        {
            Load_SP(ddl_gia.SelectedValue);

            btn_moi.CssClass = "filter_item";
            btn_banchay.CssClass = "filter_item";
            ddl_gia.CssClass = "filter_item active";

            //string condition = ddl_gia.SelectedValue == "len" ? "&loc=len" : ddl_gia.SelectedValue == "xuong" ? "&loc=xuong" : "&loc=macdinh";

            //ViewState["ddl_selectedValue"] = ddl_gia.SelectedValue;

            //if (Request.QueryString["ma_loai"] != null)
            //{
            //    Response.Redirect("Product.aspx?ma_loai=" + Request.QueryString["ma_loai"].ToString() + condition);
            //}
            //else if (Request.QueryString["search"] != null)
            //{
            //    Response.Redirect("Product.aspx?search=" + Request.QueryString["search"].ToString() + condition);
            //}
            //else
            //{
            //    condition = condition.Replace("&", "");
            //    Response.Redirect("Product.aspx?" + condition);
            //}
        }
    }
}