<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add_product.aspx.cs" Inherits="Stylique_Fashion.add_product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<h2>Add Product</h2>
        <div>
            <label for="txtName">Name</label><br />
            <asp:TextBox ID="txtName" runat="server" Width="300" />
        </div>
        <div>
            <label for="txtDescription">Description</label><br />
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" Width="400" />
        </div>
        <div>
            <label for="txtPrice">Price</label><br />
            <asp:TextBox ID="txtPrice" runat="server" Width="150" />
        </div>
        <div>
            <label for="fuImage">Image</label><br />
            <asp:FileUpload ID="fuImage" runat="server" />
        </div>
        <div style="margin-top:10px;">
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        </div>
        <div style="margin-top:10px;color:green;">
            <asp:Label ID="lblStatus" runat="server" />
        </div>
</asp:Content>

