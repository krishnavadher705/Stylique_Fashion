using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Stylique_Fashion.App_Code
{
    public class CartHelper
    {
        public static DataTable GetCart(HttpSessionState session)
        {
            var cart = session["cart"] as DataTable;
            if (cart == null)
            {
                cart = CreateCartTable();
                session["cart"] = cart;
            }
            return cart;
        }

        private static DataTable CreateCartTable()
        {
            var dt = new DataTable();
            dt.Columns.Add("ProductID", typeof(int));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Price", typeof(decimal));
            dt.Columns.Add("ImageUrl", typeof(string));
            dt.Columns.Add("Quantity", typeof(int));
            dt.Columns.Add("LineTotal", typeof(decimal));
            return dt;
        }

        public static void AddOrIncrement(DataTable cart, int productId, int qty)
        {
            var rows = cart.Select("ProductID=" + productId);
            if (rows.Length > 0)
            {
                rows[0]["Quantity"] = Convert.ToInt32(rows[0]["Quantity"]) + qty;
            }
            else
            {
                var row = cart.NewRow();
                row["ProductID"] = productId;
                row["Quantity"] = qty;
                row["Price"] = 0m;   // refreshed at bind
                row["Name"] = "";
                row["ImageUrl"] = "";
                row["LineTotal"] = 0m;
                cart.Rows.Add(row);
            }
        }

        public static void SetQuantity(DataTable cart, int productId, int qty)
        {
            var rows = cart.Select("ProductID=" + productId);
            if (rows.Length == 0) return;
            if (qty <= 0)
            {
                cart.Rows.Remove(rows[0]);
            }
            else
            {
                rows[0]["Quantity"] = qty;
            }
        }

        public static void Remove(DataTable cart, int productId)
        {
            var rows = cart.Select("ProductID=" + productId);
            if (rows.Length > 0) cart.Rows.Remove(rows[0]);
        }
    }
}