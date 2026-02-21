<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="OnlineBookStore.LoginPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                    <br /><br />
                    <table width="400" border="0" cellpadding="40" cellspacing="0" bgcolor="#ffffff">
                        <tr>
                            <td align="center">
                                <font face="Arial" size="6" color="#1a1a2e"><b>Welcome Back</b></font>
                                <br /><br /><br />

                                <asp:Label ID="lblMessage" runat="server" Visible="false" Font-Names="Arial"
                                    Font-Bold="true" ForeColor="#dc3545" />

                                <table width="100%" border="0" cellpadding="10" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <font face="Arial" size="3" color="#5a5a5a"><b>Username</b></font><br />
                                            <asp:TextBox ID="txtUsername" runat="server" Width="100%" Height="35"
                                                Font-Names="Arial" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <font face="Arial" size="3" color="#5a5a5a"><b>Password</b></font><br />
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                                                Width="100%" Height="35" Font-Names="Arial" />
                                        </td>
                                    </tr>
                                </table>

                                <br /><br />
                                <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click"
                                    BackColor="#e4717a" ForeColor="White" Font-Names="Arial" Font-Bold="true"
                                    Height="45" Width="100%" BorderStyle="None" />

                                <br /><br /><br />
                                <font face="Arial" size="3" color="#888888">Don't have an account?</font>
                                <br /><br />
                                <a href="Register.aspx">
                                    <font face="Arial" size="3" color="#e4717a"><b>Create an account</b></font>
                                </a>
                            </td>
                        </tr>
                    </table>
                    <br /><br />
                </td>
            </tr>
        </table>
    </asp:Content>
