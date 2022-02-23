<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Guswin.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Customer Login</h1>
        <asp:Table ID="Table1" runat="server" CssClass="table table-striped">
            <asp:TableRow>
                <asp:TableCell>Email Address</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email" required="required"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please fill in your Email Address" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Password</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please fill in your password" ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Position (leave this blank if you are not admin)</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPosition" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <p class="text-center">
            <asp:Button ID="Button1" runat="server" Text="login" CssClass="btn btn-primary" OnClick="btnlogin_Click" />
        </p>
        <p class="text-center">
            <a href="registration.aspx" style="color: #0066FF">Don't have an account yet?</a>
        </p>
    </div>
</asp:Content>
