using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Figure_Shop
{
    public class Common
    {
        public void upload_image_icon(FileUpload file_anh)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            strFolder = System.Web.HttpContext.Current.Server.MapPath("../../Assets/Images/icon/");
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
                }
                else
                {
                    file_anh.PostedFile.SaveAs(strFilePath);
                    //Response.Write("<script>alert('has been successfully uploaded.')</script>");
                }
            }
            else
            {
                //Response.Write("<script>alert('Click \'Browse\' to select the file to upload.')</script>");
            }
        }
    }
}