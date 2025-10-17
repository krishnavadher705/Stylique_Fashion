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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string email = txtUserEmail.Text;
            string query = "SELECT COUNT(*) FROM Users WHERE Username='" + txtUserEmail.Text +
                           "' AND Password='" + txtPassword.Text + "'";

            SqlCommand cmd = new SqlCommand(query, con);
            int count = (int)cmd.ExecuteScalar();

            if (count > 0)
            {
                lblMessage.Text = "✅ Login Successful!";
                Session["username"] = txtUserEmail.Text; // store session
                Response.Redirect("index.aspx"); // go to dashboard page
            }
            else
            {
                lblMessage.Text = "❌ Invalid Username or Password!";
            }

            //con.Close();
        }
    }
}


