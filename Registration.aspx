<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Stylique_Fashion.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Registration Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .register-container {
            width: 100%;
            max-width: 900px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.1);
            display: flex;
            flex-wrap: wrap;
            overflow: hidden;
        }

        /* LEFT IMAGE SECTION */
        .image-section {
            flex: 1;
            min-height: 500px;
            min-width: 350px;
            background: url('https://images.unsplash.com/photo-1490481651871-ab68de25d43d?ixlib=rb-4.0.3') center/cover;
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(18,18,18,0.6);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            padding: 40px;
        }

        .brand-name {
            font-family: 'Playfair Display', serif;
            font-size: 42px;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 10px;
            letter-spacing: 3px;
        }

        .overlay p {
            font-size: 16px;
            line-height: 1.5;
        }

        /* RIGHT FORM SECTION */
        .form-section {
            flex: 1;
            padding: 50px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-header h1 {
            font-family: 'Playfair Display', serif;
            font-size: 30px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #121212;
        }

        /* .form-header p {
            font-size: 25px;
            color: #666;
            margin-bottom: 25px;
        }*/

        .form-group {
            margin-bottom: 15px;
        }

            .form-group label {
                font-size: 14px;
                font-weight: 500;
                margin-bottom: 6px;
                color: #444;
                display: block;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .form-group input, .form-group select {
                width: 100%;
                padding: 12px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 6px;
            }

        .gender-options {
            display: flex;
            gap: 15px;
            font-size: 10px;
        }

        .btn-register {
            width: 100%;
            padding: 14px;
            background: #121212;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
        }

            .btn-register:hover {
                background: #333;
            }

        .login-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

            .login-link a {
                color: #121212;
                font-weight: 600;
                text-decoration: none;
            }

                .login-link a:hover {
                    text-decoration: underline;
                }

        @media (max-width: 992px) {
            .register-container {
                flex-direction: column;
            }

            .image-section {
                min-height: 250px;
            }

            .brand-name {
                font-size: 32px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <!-- LEFT IMAGE PANEL -->
            <div class="image-section">
                <div class="overlay">
                    <h1 class="brand-name">STYLIQUE</h1>
                    <p>Join us today and explore your fashion journey.</p>
                </div>
            </div>

            <!-- RIGHT FORM PANEL -->
            <div class="form-section">
                <div class="form-header">
                    <h1>Register</h1>
                    <br />

                    <%--                    <p>Create your account to get started</p>--%>
                </div>

                <div class="form-group">
                    <label for="txtFullName">Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter your full name" />
                </div>

                <div class="form-group">
                    <label for="txtUsername">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter username" />
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter email" TextMode="Email" />
                </div>

                <div class="form-group">
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter password" TextMode="Password" />
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <div class="gender-options">
                        <asp:RadioButton ID="rbMale" runat="server" GroupName="Gender" Text="Male" />
                        <asp:RadioButton ID="rbFemale" runat="server" GroupName="Gender" Text="Female" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtMobile">Mobile</label>
                    <asp:TextBox ID="txtMobile" runat="server" placeholder="Enter mobile number" />
                </div>

                <div class="form-group">
                    <label for="txtCity">City</label>
                    <asp:TextBox ID="txtCity" runat="server" placeholder="Enter Your City"></asp:TextBox>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn-register" />
                <div class="login-link">
                    Already have an account? <a href="Login.aspx">Sign In</a>
<%--                    <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>--%>
                    <br />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
<%--                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>--%>
                </div>
            </div>
        </div>
      
       
    </form>
</body>
</html>
