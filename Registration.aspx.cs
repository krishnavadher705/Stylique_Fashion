using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Stylique_Fashion
{
    public partial class Registration : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            getcon();

            string gender = "";
            if (rbMale.Checked) gender = "Male";
            else if (rbFemale.Checked) gender = "Female";

            cmd = new SqlCommand("INSERT INTO Users (FullName, Username, Email, Password, Gender, Mobile, City) " +
                           "VALUES ('" + txtFullName.Text + "','" + txtUsername.Text + "','" + txtEmail.Text + "','" +
                           txtPassword.Text + "','" + gender + "','" + txtMobile.Text + "','" + txtCity.Text + "')",con);

            //cmd = new SqlCommand(query, con);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                lblMessage.Text = "Registration successful!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

            
                txtFullName.Text = "";
                txtUsername.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                txtMobile.Text = "";
                txtCity.Text = "";
                rbMale.Checked = false;
                rbFemale.Checked = false;

                Response.Redirect("Login.aspx");
            }
            else
            {
                lblMessage.Text = "❌ Registration failed!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

            //con.Close();
        }
    }
}
