using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;
using System.Globalization;

namespace Figure_Shop.User_Controls
{
    public partial class Header : System.Web.UI.UserControl
    {
        public string user_name = "";
        public string user_role = "";
        public string user_avatar = "";
        public string user_id = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_email"] != null)
            {
                Connect connect = new Connect();
                Session["user_name"] = connect.getField("select ten_tk from users where email = N'" + Session["user_email"].ToString() + "'");
                Session["user_role"] = connect.getField("select quyen from users where email = N'" + Session["user_email"].ToString() + "'");
                Session["user_avatar"] = connect.getField("select avatar from users where email = N'" + Session["user_email"].ToString() + "'");
            }

            if (Session["user_name"] != null && Session["user_role"] != null && Session["user_avatar"] != null)
            {
                user_name = Session["user_name"].ToString();
                user_role = Session["user_role"].ToString();
                user_avatar = Session["user_avatar"].ToString();
                user_id = new Connect().getField("select id from users where email = N'" + Session["user_email"] + "'");
            }

            Load_Category();
            Load_Product();
        }

        public void Load_Category()
        {
            Connect connect = new Connect();
            dtl_search_category.DataSource = connect.getData("select top(3) * from loai_sp");
            dtl_search_category.DataBind();
        }

        public void Load_Product()
        {
            Connect connect = new Connect();
            dtl_search_product.DataSource = connect.getData("select top(3) * from san_pham order by da_ban desc");
            dtl_search_product.DataBind();
        }

        protected void link_btn_logout_Click(object sender, EventArgs e)
        {
            Session["user_name"] = null;
            Session["user_email"] = null;
            Session["user_avatar"] = null;
            Session["user_role"] = null;

            Response.Redirect("/Pages/Home.aspx");
        }

        protected void lbtn_admin_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Admin_pages/Product_Manager.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["user_email"] != null)
                Response.Redirect("/Pages/Cart.aspx");
            else
            {
                snackbar.CssClass = "snackbar show";
            }
        }

        protected void lbtn_me_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages//Me.aspx?id=" + user_id);
        }
    }
}