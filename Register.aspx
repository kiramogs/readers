<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="OnlineBookStore.RegisterPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div style="max-width: 420px; margin: 60px auto;">
            <div style="background: #fff; border-radius: 16px; padding: 40px; box-shadow: 0 4px 20px rgba(0,0,0,0.08);">
                <h1 style="font-size: 28px; font-weight: 700; color: #1a1a2e; margin-bottom: 8px; text-align: center;">
                    Create Account</h1>
                <p style="text-align: center; color: #888; margin-bottom: 28px; font-size: 14px;">Join the Readers
                    community</p>

                <asp:Label ID="lblError" runat="server" CssClass="alert-danger" Visible="false"
                    style="display: block; margin-bottom: 16px;" />
                <asp:Label ID="lblSuccess" runat="server" CssClass="alert-success" Visible="false"
                    style="display: block; margin-bottom: 16px;" />

                <div style="margin-bottom: 16px;">
                    <label class="form-label">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                        placeholder="Choose a username" />
                </div>
                <div style="margin-bottom: 16px;">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"
                        placeholder="your@email.com" />
                </div>
                <div style="margin-bottom: 16px;">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"
                        placeholder="Create a password" />
                </div>
                <div style="margin-bottom: 24px;">
                    <label class="form-label">Confirm Password</label>
                    <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password"
                        placeholder="Confirm your password" />
                </div>
                <asp:Button ID="btnRegister" runat="server" Text="Create Account" OnClick="btnRegister_Click"
                    CssClass="btn btn-primary" style="width: 100%; padding: 12px;" />

                <p style="text-align: center; margin-top: 20px; font-size: 14px; color: #888;">
                    Already have an account? <a href="Login.aspx" style="color: #c45b3e; font-weight: 600;">Sign In</a>
                </p>
            </div>
        </div>
    </asp:Content>