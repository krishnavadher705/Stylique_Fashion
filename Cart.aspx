<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Stylique_Fashion.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Cart</title>
    <style>
        .summary { margin-top:12px; font-size:18px; }
        .actions { margin-top:8px; }
        .qty { width:60px; }
        .img-60 img { width:60px; height:60px; object-fit:cover; }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <h2>Your Cart</h2>
    <asp:GridView ID="gvCart" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="ProductID"
        OnRowCommand="gvCart_RowCommand">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID" Visible="False" />
            <asp:ImageField DataImageUrlField="ImageUrl" HeaderText="Image" ControlStyle-CssClass="img-60" />
            <asp:BoundField DataField="Name" HeaderText="Product" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
            <asp:TemplateField HeaderText="Qty">
                <ItemTemplate>
                    <asp:TextBox ID="txtQty" runat="server" CssClass="qty" Text='<%# Eval("Quantity") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LineTotal" HeaderText="Total" DataFormatString="{0:C}" />
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkRemove" runat="server"
                        CommandName="Remove"
                        CommandArgument='<%# Eval("ProductID") %>'
                        Text="Remove" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            Your cart is empty.
        </EmptyDataTemplate>
    </asp:GridView>

    <div class="actions">
        <asp:Button ID="btnUpdate" runat="server" Text="Update Cart" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
    </div>

    <div class="summary">
        Total: <asp:Label ID="lblTotal" runat="server" Text="$0.00" />
    </div>
</asp:Content>

