<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Guswin.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-xs-8">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <div class="row">
                                <div class="col-xs-6">
                                    <h5><span class="glyphicon glyphicon-shopping-cart"></span>Shopping Cart</h5>
                                </div>
                                <div class="col-xs-6">
                                    <asp:Button ID="btnConShop" CssClass="btn btn-primary btn-sm btn-block" runat="server" Text="Continue Shopping" OnClick="btnConShop_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand"  OnItemDeleting="ListView1_ItemDeleting" OnItemUpdating="ListView1_ItemUpdating">
                                <LayoutTemplate>
                                    <table class="table table-striped table-responsive">
                                        <tr>
                                            <th>Product</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Amount</th>
                                            <th></th>
                                        </tr>

                                        <tbody>
                                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                                        </tbody>
                                    </table>
                                </LayoutTemplate>

                                <ItemTemplate>
                                    <tr>
                                        <td style="display:none;">
                                            <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>'/></td>
                                        <td>
                                            <img height="100" width="100" class="img-responsive" src='<%# Eval("pImage") %>'></td>
                                        <td>
                                            <h4 class="product-name"><strong><%# Eval("pname") %></strong></h4>
                                            <h4><small><%# Eval("pdescription") %></small></h4>
                                        </td>
                                        <td><asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>'/></td>
                                        <td>
                                            <asp:TextBox ID="txtQTY" TextMode="Number" runat="server" Text='<%# Eval("qty") %>'/></td>
                                        <td><asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>'/></td>
                                        <td>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="update"/>
                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="delete"/>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <hr>
                    </div>
                    <div class="panel-footer">
                        <div class="row text-center">
                            <div class="col-xs-9">
                                <h4 class="text-right">Total RM<strong>
                                    <asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label></strong>
                                </h4>
                            </div>
                            <div class="col-xs-3">
                                <asp:Button ID="btnCheckout" CssClass="btn btn-success" runat="server" Text="Checkout" OnClick="btnCheckout_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="sdsOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString2509 %>"
        DeleteCommand="DELETE FROM [tblOrderItem] WHERE [OrderID] = @OrderID"
        InsertCommand="INSERT INTO [tblOrderItem] ([QTY]) VALUES (@QTY)"
        SelectCommand="SELECT [OrderID], [QTY] FROM [tblOrderItem]"
        UpdateCommand="UPDATE [tblOrderItem] SET [QTY] = @QTY WHERE [OrderID] = @OrderID">

        <DeleteParameters>
            <asp:ControlParameter ControlID="OrderIDLabel" Name="OrderID" Type="Int32" />
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="QTY" Type="Int32" />
        </InsertParameters>

        <UpdateParameters>
            <asp:Parameter Name="QTY" Type="Int32" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>
