<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs" Inherits="OnlineBookStore.ProfilePage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h1 style="font-size: 32px; font-weight: 700; color: #1a1a2e; margin-bottom: 24px;">My Profile</h1>

        <!-- Tabs -->
        <div style="display: flex; gap: 4px; margin-bottom: 24px;">
            <asp:LinkButton ID="tabProfile" runat="server" OnClick="tabProfile_Click"
                style="padding: 10px 24px; border-radius: 8px 8px 0 0; font-size: 14px; font-weight: 600; cursor: pointer; border: none;">
                Profile</asp:LinkButton>
            <asp:LinkButton ID="tabOrders" runat="server" OnClick="tabOrders_Click"
                style="padding: 10px 24px; border-radius: 8px 8px 0 0; font-size: 14px; font-weight: 600; cursor: pointer; border: none;">
                My Orders</asp:LinkButton>
            <asp:LinkButton ID="tabWishlist" runat="server" OnClick="tabWishlist_Click"
                style="padding: 10px 24px; border-radius: 8px 8px 0 0; font-size: 14px; font-weight: 600; cursor: pointer; border: none;">
                Wishlist ♥</asp:LinkButton>
        </div>

        <!-- Profile Tab -->
        <asp:Panel ID="pnlProfile" runat="server">
            <div style="background: #fff; border-radius: 12px; padding: 30px; box-shadow: 0 2px 12px rgba(0,0,0,0.06);">
                <h2 style="font-size: 20px; font-weight: 600; color: #1a1a2e; margin-bottom: 20px;">Account Information
                </h2>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div>
                        <label class="form-label">Username</label>
                        <asp:Label ID="lblUsername" runat="server"
                            style="display: block; font-size: 16px; color: #1a1a2e; font-weight: 500;" />
                    </div>
                    <div>
                        <label class="form-label">Email</label>
                        <asp:Label ID="lblEmail" runat="server"
                            style="display: block; font-size: 16px; color: #1a1a2e; font-weight: 500;" />
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Orders Tab -->
        <asp:Panel ID="pnlOrders" runat="server" Visible="false">
            <asp:Panel ID="pnlNoOrders" runat="server" Visible="false">
                <div style="text-align: center; padding: 40px; background: #fff; border-radius: 12px;">
                    <p style="color: #888; font-size: 16px;">No orders yet</p>
                </div>
            </asp:Panel>
            <asp:Repeater ID="rptOrders" runat="server">
                <ItemTemplate>
                    <div
                        style="background: #fff; border-radius: 12px; padding: 20px; margin-bottom: 12px; box-shadow: 0 1px 6px rgba(0,0,0,0.06); display: flex; justify-content: space-between; align-items: center;">
                        <div>
                            <p style="font-size: 16px; font-weight: 600; color: #1a1a2e;">Order #<%# Eval("Id") %>
                            </p>
                            <p style="font-size: 13px; color: #888;">
                                <%# Eval("OrderDate", "{0:dd MMM yyyy, hh:mm tt}" ) %>
                            </p>
                            <p style="font-size: 13px; color: #888;">
                                <%# Eval("Items.Count") %> item(s)
                            </p>
                        </div>
                        <div style="text-align: right;">
                            <p style="font-size: 20px; font-weight: 700; color: #c45b3e;">₹<%# Eval("TotalAmount") %>
                            </p>
                            <a href='<%# "OrderDetails.aspx?id=" + Eval("Id") %>'
                                style="color: #1a1a2e; font-size: 13px; font-weight: 600; text-decoration: underline;">View
                                Details</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>

        <!-- Wishlist Tab -->
        <asp:Panel ID="pnlWishlist" runat="server" Visible="false">
            <asp:Panel ID="pnlNoWishlist" runat="server" Visible="false">
                <div style="text-align: center; padding: 40px; background: #fff; border-radius: 12px;">
                    <p style="color: #888; font-size: 16px;">Your wishlist is empty</p>
                </div>
            </asp:Panel>
            <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 20px;">
                <asp:Repeater ID="rptWishlist" runat="server" OnItemCommand="rptWishlist_ItemCommand">
                    <ItemTemplate>
                        <div
                            style="background: #fff; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 12px rgba(0,0,0,0.08);">
                            <a href='<%# "BookDetails.aspx?id=" + Eval("BookId") %>'>
                                <img src='<%# Eval("BookImageUrl") %>' alt='<%# Eval("BookTitle") %>'
                                    style="width: 100%; height: 250px; object-fit: cover;"
                                    onerror="this.src='https://via.placeholder.com/200x250?text=No+Cover'" />
                            </a>
                            <div style="padding: 12px;">
                                <h3
                                    style="font-size: 14px; font-weight: 600; color: #1a1a2e; margin-bottom: 4px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                    <%# Eval("BookTitle") %>
                                </h3>
                                <p style="font-size: 12px; color: #888; margin-bottom: 6px;">
                                    <%# Eval("BookAuthor") %>
                                </p>
                                <p style="font-size: 16px; font-weight: 700; color: #c45b3e; margin-bottom: 8px;">₹<%#
                                        Eval("BookPrice") %>
                                </p>
                                <asp:LinkButton ID="btnRemoveWish" runat="server" CommandName="RemoveWish"
                                    CommandArgument='<%# Eval("Id") %>'
                                    style="color: #dc3545; font-size: 12px; font-weight: 600;">Remove ✕</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>
    </asp:Content>