<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeliveryStatus.aspx.cs" Inherits="Guswin.DeliveryStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Delivery Status</h1>
        <br />
        <br />
        <asp:Table ID="tblDelSta" CssClass="table" runat="server">
            <asp:TableRow>
                <asp:TableCell>User Name</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblUname" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblUID" runat="server" Text="" Visible="false"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Delivery Status</asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlDelSta" CssClass="form-control" runat="server" AutoPostBack="true">
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Parcel is out for delivery</asp:ListItem>
                        <asp:ListItem>Delivered</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                </asp:TableCell>

                <asp:TableCell>
                    <asp:Button ID="btnUpdate" CssClass="btn btn-success" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="sdsOrder" Width="901px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="sdsOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString2509 %>"
        SelectCommand="SELECT * FROM [tblOrderItem]"></asp:SqlDataSource>
</asp:Content>
