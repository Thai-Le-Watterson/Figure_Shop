using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Figure_Shop.User_Controls
{
    public partial class List_Category : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_Category();
        }

        public void Load_Category()
        {
            Connect connect = new Connect();
            DataList1.DataSource = connect.getData("select * from loai_sp");
            DataList1.DataBind();
        }
    }
}