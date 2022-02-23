<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="Guswin.userProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>User Profile Settings</h1>

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
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email" ReadOnly="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please fill in your email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
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
        </asp:Table>
        <p class="text-center">
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green" Font-Size="Small"></asp:Label>
        </p>
        <p class="text-center">
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
        </p>
    </div>
</asp:Content>
