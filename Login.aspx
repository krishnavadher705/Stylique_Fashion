<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Stylique_Fashion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
     <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(120deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-container {
            width: 100%;
            max-width: 900px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.1);
            display: flex;
            flex-wrap: wrap;
            overflow: hidden;
        }

        .image-section {
            flex: 1;
            min-height: 600px;
            min-width: 350px;
            background: url('https://images.unsplash.com/photo-1490481651871-ab68de25d43d?ixlib=rb-4.0.3') center/cover;
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
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
            font-size: 48px;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 10px;
            letter-spacing: 3px;
        }

        .form-section {
            flex: 1;
            padding: 60px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-header h2 {
            font-family: 'Playfair Display', serif;
            font-size: 60px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #121212;
        }

       /* .form-header p {
            font-size: 25px;
            color: #666;
            margin-bottom: 30px;
        }*/

        .form-group { margin-bottom: 20px; }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
            text-transform: uppercase;
            color: #333;
            letter-spacing: 1px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #f9f9f9;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #121212;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(18,18,18,0.1);
            outline: none;
        }

        .btn-login {
            width: 100%;
            padding: 16px;
            background: #121212;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            text-transform: uppercase;
            letter-spacing: 2px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background: #333;
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .message {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            padding: 12px;
            border-radius: 8px;
        }

        .error {
            background: #fff5f5;
            color: #e53e3e;
            border: 1px solid #fed7d7;
        }

        .success {
            background: #f0fff4;
            color: #38a169;
            border: 1px solid #c6f6d5;
        }

        @media (max-width: 992px) {
            .login-container { flex-direction: column; }
            .image-section { min-height: 900px; }
            .brand-name { font-size: 36px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <!-- Left Image Section -->
            <div class="image-section">
                <div class="overlay">
                    <h1 class="brand-name">STYLIQUE</h1>
                    <p>Welcome back! Please login to continue.</p>
                </div>
            </div>

            <!-- Right Form Section -->
            <div class="form-section">
                <div class="form-header">
                    <h2>Login</h2>
                    </br>
                    <br />
<%--                    <p>Enter your username and password to access your account.</p>--%>
                </div>

                <div class="form-group">
                    <label for="txtUsername">Username</label>
<%--                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>--%>
                <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control" 
    Placeholder="Enter Email"></asp:TextBox>

                </div>


                <div class="form-group">
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
