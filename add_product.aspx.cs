using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylique_Fashion
{
    public partial class add_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string description = txtDescription.Text.Trim();
            decimal price;

            if (string.IsNullOrWhiteSpace(name) || !decimal.TryParse(txtPrice.Text, out price))
            {
                lblStatus.Text = "Enter a valid name and price.";
                return;
            }

            string imageUrl = null;
            if (fuImage.HasFile)
            {
                string fileName = DateTime.UtcNow.Ticks + Path.GetExtension(fuImage.FileName);
                string relPath = "~/Prod_images/" + fileName;
                string absPath = Server.MapPath(relPath);
                Directory.CreateDirectory(Path.GetDirectoryName(absPath));
                fuImage.SaveAs(absPath);
                imageUrl = relPath;
            }

            string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var cmd = new SqlCommand(@"INSERT INTO Products(Name, Description, Price, ImageUrl)
                                          VALUES(@n,@d,@p,@i)", con))
            {
                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@d", (object)description ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@p", price);
                cmd.Parameters.AddWithValue("@i", (object)imageUrl ?? DBNull.Value);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            txtName.Text = "";
            txtDescription.Text = "";
            txtPrice.Text = "";
            lblStatus.Text = "Product added successfully.";
        }
    }
}
