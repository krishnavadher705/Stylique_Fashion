<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Stylique_Fashion.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .product-card { border:1px solid #eee; padding:10px; margin:10px; width:220px; display:inline-block; vertical-align:top; }
        .product-card img { width:200px; height:200px; object-fit:cover; }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <h2>Products</h2>
<asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
    <ItemTemplate>
        <div class="product-card">
            <img src='<%# string.IsNullOrWhiteSpace(Eval("ImageUrl") as string) ? ResolveUrl("~/images/placeholder.png") : ResolveUrl(Eval("ImageUrl").ToString()) %>' alt="" />
            <h4>
                <a href='<%# "ViewDetails.aspx?id=" + Eval("ProductID") %>'><%# Eval("Name") %></a>
            </h4>
            <div>$<%# Eval("Price","{0:F2}") %></div>
            <div style="margin-top:8px;">
                <asp:LinkButton ID="btnAdd" runat="server"
                    CommandName="AddToCart"
                    CommandArgument='<%# Eval("ProductID") %>'
                    Text="Add to Cart" />
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
</asp:Content>

