<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Guswin._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>New Arrivals</h1>
        <table class="w-100">
            <tr>
                <td>
                    <img src="Images/banner/top.jpg" style="width: 318px; height: 320px" /></td>
                <td>
                    <img src="Images/banner/bottom.png" style="width: 318px; height: 320px" /></td>
                <td>
                    <img src="Images/banner/headwear.jpg" style="width: 318px; height: 320px" /></td>
            </tr>
            <tr>
                <td class="text-center">Shirt & Tee & Vest & More</td>
                <td class="text-center">Shorts & Pants</td>
                <td class="text-center">One size fits all</td>
            </tr>
            <tr>
                <td class="text-center"><a href="ShoppingCatalog.aspx" style="color: #FF9900"><strong>TOP &gt;&gt;</strong></a></td>
                <td class="text-center"><a href="ShoppingCatalog.aspx" style="color: #FF9900"><strong>BOTTOM &gt;&gt;</strong></a></td>
                <td class="text-center"><a href="ShoppingCatalog.aspx" style="color: #FF9900"><strong>HEADWEAR &gt;&gt;</strong></a></td>
            </tr>
        </table>
    </div>
</asp:Content>
