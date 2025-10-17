<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="Stylique_Fashion.ViewDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Product Details</title>
    <style>
        .wrap { display:flex; gap:20px; }
        .wrap img { width:300px; height:300px; object-fit:cover; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h2><asp:Label ID="lblName" runat="server" Text="" /></h2>
    <div class="wrap">
        <asp:Image ID="imgProduct" runat="server" />
        <div>
            <div style="font-size:20px; margin:6px 0;">$<asp:Label ID="lblPrice" runat="server" Text="" /></div>
            <div><asp:Label ID="lblDescription" runat="server" Text="" /></div>
            <div style="margin-top:12px;">
                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

