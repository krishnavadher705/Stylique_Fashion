using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylique_Fashion
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["id"], out ProductId))
            {
                Response.Redirect("product.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadProduct(productId);
            }
        }

        private void LoadProduct(int id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var cmd = new SqlCommand("SELECT Name, Description, Price, ImageUrl FROM Products WHERE ProductID=@id", con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                using (var r = cmd.ExecuteReader())
                {
                    if (!r.Read())
                    {
                        Response.Redirect("product.aspx");
                        return;
                    }

                    lblName.Text = r["Name"].ToString();
                    lblDescription.Text = r["Description"].ToString();
                    lblPrice.Text = string.Format("{0:F2}", r["Price"]);
                    var img = r["ImageUrl"] as string;
                    imgProduct.ImageUrl = string.IsNullOrWhiteSpace(img) ? "~/images/placeholder.png" : img;
                }
            }
        }
        

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            var cart = CartHelper.GetCart(Session);
            CartHelper.AddOrIncrement(cart, productId, 1);
            Session["cart"] = cart;
            Response.Redirect("Cart.aspx");
        }
    }
}