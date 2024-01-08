using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Figure_Shop.Pages
{
    public partial class Me : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    Load_UserInfo();
                }
            }
        }

        public void Load_UserInfo()
        {
            Connect connect = new Connect();
            DataList1.DataSource = connect.getData("select * from users where id = " + Request.QueryString["id"]);
            DataList1.DataBind();
        }

        public bool upload_image()
        {
            FileUpload file_anh = (FileUpload)DataList1.Items[0].FindControl("FileUpload1");
            string strFileName;
            string strFilePath;
            string strFolder;
            strFolder = Server.MapPath("../Assets/Images/avatar/");
            //Response.Write("<script>alert('" + strFolder + "')</script>");
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
                    //Response.Write("<script>alert('already exists on the server!')</script>");
                    return false;
                }
                else
                {
                    file_anh.PostedFile.SaveAs(strFilePath);
                    //Response.Write("<script>alert('has been successfully uploaded.')</script>");
                    return true;
                }
            }
            else
            {
                //Response.Write("<script>alert('Click \'Browse\' to select the file to upload.')</script>");
                return false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //DataList1.EditItemIndex = 0;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            //DataList1.EditItemIndex = -1;
        }

        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = e.Item.ItemIndex;
            Load_UserInfo();
        }

        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            TextBox txt_tenkh = (TextBox)DataList1.Items[0].FindControl("txt_tenkh");
            FileUpload file_anh = (FileUpload)DataList1.Items[0].FindControl("FileUpload1");

            if (txt_tenkh.Text != "")
            {
                string sql = "update users set ten_tk = N'" + txt_tenkh.Text + "'";

                if (file_anh.HasFile)
                {
                    upload_image();
                    sql += ", avatar = N'" + file_anh.FileName + "'";
                }

                sql += " where email = N'" + Session["user_email"] + "'";

                new Connect().excuteQuery(sql);

                DataList1.EditItemIndex = -1;
                Load_UserInfo();

                Page.Response.Redirect(Page.Request.Url.ToString(), false);
            }
        }
    }
}