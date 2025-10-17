using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Stylique_Fashion
{
    public partial class index : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;//Connection
        SqlDataAdapter da;//DataAdapter
        DataSet ds;//DataSet
        SqlCommand cmd;//Command
        string fnm;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            //txtnm.Text = "";
            //RadioButtonList1.Text = "";
            //txteml.Text = "";
            //DropDownList1.SelectedValue = "";


        }


        protected void btnsave1(object sender, EventArgs e)
        {
            //if (Button1.Text == "Save")
            //{
            //    getcon();
               
            //    cmd = new SqlCommand("INSERT INTO styliqye VALUES('" + txtnm.Text + "','" + RadioButtonList1.Text + "','" + txteml.Text + "','" + DropDownList1.SelectedValue + "','" + fnm + "')", con);
            //    cmd.ExecuteNonQuery();
            //    con.Close();
            //}
        }

        
    }
}
