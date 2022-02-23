<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCatalog.aspx.cs" Inherits="Guswin.ShoppingCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Shopping Catalog</h1>
        <p>
            <asp:Label ID="lblAdded"  ForeColor="Green" runat="server"></asp:Label>
        </p>
    </div>

    <div class="row">
        <!--for the category list -->
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked">
                <li>All Category</li>
                <li><asp:Button ID="btnAll" runat="server" Text="All" OnClick="btnAll_Click"/></li>
                <asp:Repeater ID="repCategory" runat="server" DataSourceID="sqlDSCategory" OnItemCommand="repCategory_ItemCommand">
                    <ItemTemplate>
                        <li>
                            <asp:Button ID="btncname" runat="server" Text='<%# Eval("cname") %>' CommandName='<%# Eval("CID") %>'/>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>

        <!-- for the products list-->
        <div class="col-md-9">
            <asp:DataList ID="dlProduct" runat="server" CellPadding="4" DataKeyField="PID" DataSourceID="sqlDSProduct" RepeatColumns="4" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical" OnItemCommand="dlProduct_ItemCommand">
                <AlternatingItemStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
                <ItemTemplate>
                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Image ID="imgProduct" ImageUrl='<%# Eval("pImage") %>' Height="150" Width="150" runat="server" />
                                <br />
                                <asp:Label ID="PIDLabel" runat="server" Text='<%# Eval("PID") %>' Visible="False" />
                                Name:
                                <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' />
                                <br />
                                Description:
                                <asp:Label ID="pdescriptionLabel" runat="server" Text='<%# Eval("pdescription") %>' />
                                <br />
                                Price:
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                <br />
                                <br />
                                <p class="text-center">
                                    <asp:Button ID="btnAdd2Cart" CommandName="addtocart" CssClass="btn btn-primary" runat="server" Text="Add to Cart" />
                                </p>
                            </asp:TableCell></asp:TableRow></asp:Table></ItemTemplate><SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
        </div>
        <p>
            <asp:SqlDataSource ID="sqlDSCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString2509 %>" SelectCommand="SELECT [cname], [CID] FROM [tblCategory]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:SqlDataSource ID="sqlDSProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString2509 %>" SelectCommand="SELECT TOP 12 * FROM [tblProduct] ORDER BY newid()"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
