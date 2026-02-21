<%@ Page Title="Book Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BookDetails.aspx.cs" Inherits="OnlineBookStore.BookDetailsPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:Label ID="lblMessage" runat="server" Visible="false" />

        <asp:Panel ID="pnlBook" runat="server">
            <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                <!-- Cover Image -->
                <div style="flex-shrink: 0;">
                    <asp:Image ID="imgCover" runat="server"
                        style="width: 300px; height: 440px; object-fit: cover; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.15);" />
                </div>
                <!-- Details -->
                <div style="flex: 1; min-width: 280px;">
                    <asp:Label ID="lblTitle" runat="server"
                        style="display: block; font-size: 32px; font-weight: 700; color: #1a1a2e; margin-bottom: 8px;" />
                    <asp:Label ID="lblAuthor" runat="server"
                        style="display: block; font-size: 16px; color: #888; margin-bottom: 12px;" />
                    <asp:Label ID="lblGenre" runat="server"
                        style="display: inline-block; background: #f4f1eb; color: #5a5a5a; padding: 4px 12px; border-radius: 4px; font-size: 13px; margin-bottom: 16px;" />
                    <asp:Label ID="lblPrice" runat="server"
                        style="display: block; font-size: 28px; font-weight: 700; color: #c45b3e; margin-bottom: 16px;" />
                    <asp:Label ID="lblDesc" runat="server"
                        style="display: block; font-size: 15px; color: #555; line-height: 1.7; margin-bottom: 24px;" />
                    <asp:Label ID="lblISBN" runat="server"
                        style="display: block; font-size: 13px; color: #999; margin-bottom: 24px;" />

                    <div style="display: flex; gap: 12px; flex-wrap: wrap;">
                        <asp:Button ID="btnAddCart" runat="server" Text="🛒 Add to Cart" OnClick="btnAddCart_Click"
                            CssClass="btn btn-primary" />
                        <asp:Button ID="btnWishlist" runat="server" Text="♥ Add to Wishlist" OnClick="btnWishlist_Click"
                            CssClass="btn btn-outline" />
                    </div>
                    <asp:Label ID="lblAction" runat="server" style="display: block; margin-top: 14px; font-size: 14px;"
                        Visible="false" />
                </div>
            </div>
        </asp:Panel>
    </asp:Content>