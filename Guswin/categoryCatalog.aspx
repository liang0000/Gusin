<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="categoryCatalog.aspx.cs" Inherits="Guswin.categoryCatalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Category Management</h1>
        <br />
        <br />
        <asp:Table ID="tblCtg" CssClass="table" runat="server">
            <asp:TableRow>
                <asp:TableCell>Category Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCName" CssClass="form-control" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Category Description</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCDesc" CssClass="form-control" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCID" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="lbldtAdded" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="lblActive" runat="server" Text="1" Visible="false"></asp:Label>
                </asp:TableCell>

                <asp:TableCell>
                    <asp:Button ID="btnInsert" CssClass="btn btn-primary" runat="server" Text="Insert" OnClick="btnInsert_Click" />
                    <asp:Button ID="btnUpdate" CssClass="btn btn-success" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnDelete" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <asp:GridView ID="gvCategory" runat="server" CellPadding="4" DataSourceID="sqlDSCategory" GridLines="None" Height="194px" Width="1020px" OnSelectedIndexChanged="gvCategory_SelectedIndexChanged" ForeColor="#333333" OnRowDataBound="gvCategory_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB"/>
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="sqlDSCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString2509 %>"
        DeleteCommand="DELETE FROM [tblCategory] WHERE [CID] = @CID"
        InsertCommand="INSERT INTO [tblCategory] ([cname], [cdescription], [dtAdded], [active]) VALUES (@cname, @cdescription, @dtAdded, @active)"
        SelectCommand="SELECT * FROM [tblCategory]"
        UpdateCommand="UPDATE [tblCategory] SET [cname] = @cname, [cdescription] = @cdescription, [dtAdded] = @dtAdded, [active] = @active WHERE [CID] = @CID">
        
        <DeleteParameters>
            <asp:ControlParameter ControlID="lblCID" Name="CID" Type="Int32" />
        </DeleteParameters>
        
        <InsertParameters>
            <asp:ControlParameter ControlID="txtCName" Name="cname" Type="String" />
            <asp:ControlParameter ControlID="txtCDesc" Name="cdescription" Type="String" />
            <asp:ControlParameter ControlID="lbldtAdded" Name="dtAdded" Type="DateTime" />
            <asp:ControlParameter ControlID="lblActive" Name="active" Type="Int32" />
        </InsertParameters>
        
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtCName" Name="cname" Type="String" />
            <asp:ControlParameter ControlID="txtCDesc" Name="cdescription" Type="String" />
            <asp:ControlParameter ControlID="lbldtAdded" Name="dtAdded" Type="DateTime" />
            <asp:ControlParameter ControlID="lblActive" Name="active" Type="Int32" />
            <asp:ControlParameter ControlID="lblCID" Name="CID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
