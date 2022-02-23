<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Guswin.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Customer Registration</h1>
        <p>
            <asp:SqlDataSource ID="sdsUser" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString2509 %>"
                DeleteCommand="DELETE FROM [tblUsers] WHERE [UID] = @UID"
                InsertCommand="INSERT INTO [tblUsers] ([FName], [LName], [Email], [Password], [Active], [dtRegistered]) VALUES (@FName, @LName, @Email, @Password, @Active, @dtRegistered)"
                SelectCommand="SELECT * FROM [tblUsers]"
                UpdateCommand="UPDATE [tblUsers] SET [FName] = @FName, [LName] = @LName, [Email] = @Email, [Password] = @Password, [Active] = @Active, [dtRegistered] = @dtRegistered WHERE [UID] = @UID">

                <DeleteParameters>
                    <asp:Parameter Name="UID" Type="Int32" />
                </DeleteParameters>

                <InsertParameters>
                    <asp:ControlParameter ControlID="txtFName" Name="FName" Type="String" />
                    <asp:ControlParameter ControlID="txtLName" Name="LName" Type="String" />
                    <asp:ControlParameter ControlID="txtEmail" Name="Email" Type="String" />
                    <asp:ControlParameter ControlID="txtConfirmPass" Name="Password" Type="String" />
                    <asp:ControlParameter ControlID="lblActive" Name="Active" Type="Int32" />
                    <asp:ControlParameter ControlID="lbldtRegistered" Name="dtRegistered" Type="DateTime" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Active" Type="Int32" />
                    <asp:Parameter Name="dtRegistered" Type="DateTime" />
                    <asp:Parameter Name="UID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </p>

        <asp:Table ID="Table1" runat="server" CssClass="table table-striped">
            <asp:TableRow>
                <asp:TableCell>First Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please fill in your first name" ControlToValidate="txtFName" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Last Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please fill in your last name" ControlToValidate="txtLName" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Email Address</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please fill in your email address" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Password</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please fill in your password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Confirm Password</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtConfirmPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match!" ControlToValidate="txtConfirmPass" ControlToCompare="txtPassword" ForeColor="Red"></asp:CompareValidator>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblActive" runat="server" Text="1" Visible="false"></asp:Label>
                    <asp:Label ID="lbldtRegistered" runat="server" Text="" Visible="false"></asp:Label>
                </asp:TableCell>

                <asp:TableCell>
                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <p class="text-center">
            <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
        </p>
        <p class="text-center">
            <a href="login.aspx" style="color: #0066FF">Already have an account?</a>
        </p>
    </div>


</asp:Content>
