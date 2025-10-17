using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylique_Fashion
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();

                int addId;
                if (int.TryParse(Request.QueryString["add"], out addId))
                {
                    AddToCart(addId, 1);
                    Response.Redirect("Cart.aspx");
                }
            }
        }

        private void BindProducts()
        {
            string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var da = new SqlDataAdapter("SELECT ProductID, Name, Price, ImageUrl FROM Products ORDER BY CreatedAt DESC", con))
            {
                var dt = new DataTable();
                da.Fill(dt);
                rptProducts.DataSource = dt;
                rptProducts.DataBind();
            }
        }

        protected void rptProducts_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId;
                if (int.TryParse(e.CommandArgument.ToString(), out productId))
                {
                    AddToCart(productId, 1);
                    Response.Redirect("Cart.aspx");
                }
            }
        }

        private void AddToCart(int productId, int qty)
        {
            var cart = CartHelper.GetCart(Session);
            CartHelper.AddOrIncrement(cart, productId, qty);
            Session["cart"] = cart;
        }
    }
}
