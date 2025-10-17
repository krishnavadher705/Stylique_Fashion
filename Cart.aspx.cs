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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int addId;
            if (!IsPostBack && int.TryParse(Request.QueryString["add"], out addId))
            {
                var cart = CartHelper.GetCart(Session);
                CartHelper.AddOrIncrement(cart, addId, 1);
                Session["cart"] = cart;
            }

            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            var cart = CartHelper.GetCart(Session);
            if (cart.Rows.Count == 0)
            {
                gvCart.DataSource = cart;
                gvCart.DataBind();
                lblTotal.Text = "$0.00";
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (var con = new SqlConnection(cs))
            {
                con.Open();
                foreach (DataRow row in cart.Rows)
                {
                    int pid = (int)row["ProductID"];
                    using (var cmd = new SqlCommand("SELECT Name, Price, ImageUrl FROM Products WHERE ProductID=@id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", pid);
                        using (var r = cmd.ExecuteReader())
                        {
                            if (r.Read())
                            {
                                row["Name"] = r["Name"].ToString();
                                row["Price"] = Convert.ToDecimal(r["Price"]);
                                row["ImageUrl"] = r["ImageUrl"] as string;
                            }
                        }
                    }
                    row["LineTotal"] = (decimal)row["Price"] * (int)row["Quantity"];
                }
            }

            gvCart.DataSource = cart;
            gvCart.DataBind();

            decimal total = cart.AsEnumerable().Sum(x => x.Field<decimal>("LineTotal"));
            lblTotal.Text = "$" + total.ToString("F2");
            Session["cart"] = cart;
        }

        protected void gvCart_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                var cart = CartHelper.GetCart(Session);
                CartHelper.Remove(cart, productId);
                Session["cart"] = cart;
                BindCart();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var cart = CartHelper.GetCart(Session);
            foreach (System.Web.UI.WebControls.GridViewRow row in gvCart.Rows)
            {
                int productId = Convert.ToInt32(gvCart.DataKeys[row.RowIndex].Value);
                var txt = (System.Web.UI.WebControls.TextBox)row.FindControl("txtQty");
                int qty;
                if (txt != null && int.TryParse(txt.Text, out qty))
                {
                    CartHelper.SetQuantity(cart, productId, qty);
                }
            }
            Session["cart"] = cart;
            BindCart();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Session["cart"] = null;
            Response.Redirect("OrderConfirmation.aspx");
        }
    }
}