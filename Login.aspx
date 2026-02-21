<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="OnlineBookStore.LoginPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div style="max-width: 420px; margin: 60px auto;">
            <div style="background: #fff; border-radius: 16px; padding: 40px; box-shadow: 0 4px 20px rgba(0,0,0,0.08);">
                <h1 style="font-size: 28px; font-weight: 700; color: #1a1a2e; margin-bottom: 8px; text-align: center;">
                    Welcome Back</h1>
                <p style="text-align: center; color: #888; margin-bottom: 28px; font-size: 14px;">Sign in to your
                    Readers account</p>

                <asp:Label ID="lblError" runat="server" CssClass="alert-danger" Visible="false"
                    style="display: block; margin-bottom: 16px;" />

                <div style="margin-bottom: 16px;">
                    <label class="form-label">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                        placeholder="Enter your username" />
                </div>
                <div style="margin-bottom: 24px;">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"
                        placeholder="Enter your password" />
                </div>
                <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click"
                    CssClass="btn btn-primary" style="width: 100%; padding: 12px;" />

                <p style="text-align: center; margin-top: 20px; font-size: 14px; color: #888;">
                    Don't have an account? <a href="Register.aspx"
                        style="color: #c45b3e; font-weight: 600;">Register</a>
                </p>
            </div>
        </div>
    </asp:Content>