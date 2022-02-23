<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="Guswin.adminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Admin Dashboard</h1>
        <p><asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label></p>
        <br />
        <br />
        <asp:Table ID="tblUser" CssClass="table" runat="server">
            <asp:TableRow>
                <asp:TableCell>First Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFName" CssClass="form-control" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Last Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLName" CssClass="form-control" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Email</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Password</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblUID" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="lbldtRegistered" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="lblActive" runat="server" Text="1" Visible="false"></asp:Label>
                </asp:TableCell>

                <asp:TableCell>
                    <asp:Button ID="btnInsert" CssClass="btn btn-primary" runat="server" Text="Insert" OnClick="btnInsert_Click" />
                    <asp:Button ID="btnUpdate" CssClass="btn btn-success" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnDelete" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="sdsUser" GridLines="None" Height="250px" Width="1020px" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="UID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="UID" />
                <asp:BoundField DataField="FName" HeaderText="First Name" SortExpression="FName" />
                <asp:BoundField DataField="LName" HeaderText="Last Name" SortExpression="LName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="dtRegistered" HeaderText="Date registered or updated" SortExpression="dtRegistered" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
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
    <br />
    <asp:SqlDataSource ID="sdsUser" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString2509 %>"
        SelectCommand="SELECT * FROM [tblUsers]"
        DeleteCommand="DELETE FROM [tblUsers] WHERE [UID] = @UID"
        InsertCommand="INSERT INTO [tblUsers] ([FName], [LName], [Email], [Password], [Active], [dtRegistered]) VALUES (@FName, @LName, @Email, @Password, @Active, @dtRegistered)"
        UpdateCommand="UPDATE [tblUsers] SET [FName] = @FName, [LName] = @LName, [Email] = @Email, [Password] = @Password, [Active] = @Active, [dtRegistered] = @dtRegistered WHERE [UID] = @UID">

        <DeleteParameters>
            <asp:ControlParameter ControlID="lblUID" Name="UID" Type="Int32" />
        </DeleteParameters>

        <InsertParameters>
            <asp:ControlParameter ControlID="txtFName" Name="FName" Type="String" />
            <asp:ControlParameter ControlID="txtLName" Name="LName" Type="String" />
            <asp:ControlParameter ControlID="txtEmail" Name="Email" Type="String" />
            <asp:ControlParameter ControlID="txtPassword" Name="Password" Type="String" />
            <asp:ControlParameter ControlID="lblActive" Name="Active" Type="Int32" />
            <asp:ControlParameter ControlID="lbldtRegistered" Name="dtRegistered" Type="DateTime" />
        </InsertParameters>

        <UpdateParameters>
            <asp:ControlParameter ControlID="txtFName" Name="FName" Type="String" />
            <asp:ControlParameter ControlID="txtLName" Name="LName" Type="String" />
            <asp:ControlParameter ControlID="txtEmail" Name="Email" Type="String" />
            <asp:ControlParameter ControlID="txtPassword" Name="Password" Type="String" />
            <asp:ControlParameter ControlID="lblActive" Name="Active" Type="Int32" />
            <asp:ControlParameter ControlID="lbldtRegistered" Name="dtRegistered" Type="DateTime" />
            <asp:ControlParameter ControlID="lblUID" Name="UID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
