<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs" Inherits="OnlineBookStore.ProfilePage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <font face="Arial" size="6" color="#1a1a2e"><b>My Profile</b></font>
        <br /><br /><br />

        <!-- Tabs Menu -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="200" align="center">
                    <table border="0" cellpadding="10" cellspacing="0" bgcolor="#e4717a" width="100%">
                        <tr>
                            <td align="center">
                                <asp:LinkButton ID="tabProfile" runat="server" OnClick="tabProfile_Click"
                                    ForeColor="White" Font-Names="Arial" Font-Bold="true" Font-Size="11pt"
                                    style="text-decoration:none;">Profile Info</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="10">&nbsp;</td>
                <td width="200" align="center">
                    <table border="0" cellpadding="10" cellspacing="0" bgcolor="#1a1a2e" width="100%">
                        <tr>
                            <td align="center">
                                <asp:LinkButton ID="tabOrders" runat="server" OnClick="tabOrders_Click"
                                    ForeColor="White" Font-Names="Arial" Font-Bold="true" Font-Size="11pt"
                                    style="text-decoration:none;">My Orders</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="10">&nbsp;</td>
                <td width="200" align="center">
                    <table border="0" cellpadding="10" cellspacing="0" bgcolor="#c45b3e" width="100%">
                        <tr>
                            <td align="center">
                                <asp:LinkButton ID="tabWishlist" runat="server" OnClick="tabWishlist_Click"
                                    ForeColor="White" Font-Names="Arial" Font-Bold="true" Font-Size="11pt"
                                    style="text-decoration:none;">Wishlist ♥</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br /><br />

        <!-- Profile Tab -->
        <asp:Panel ID="pnlProfile" runat="server">
            <table width="600" border="0" cellpadding="30" cellspacing="0" bgcolor="#ffffff">
                <tr>
                    <td>
                        <font face="Arial" size="5" color="#1a1a2e"><b>Account Information</b></font>
                        <hr color="#d4cfc7" size="1" />
                        <br />
                        <table width="100%" border="0" cellpadding="10" cellspacing="0">
                            <tr>
                                <td width="30%">
                                    <font face="Arial" size="3" color="#888888"><b>Username</b></font>
                                </td>
                                <td>
                                    <font face="Arial" size="4" color="#1a1a2e"><b>
                                            <asp:Label ID="lblUsername" runat="server" />
                                        </b></font>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <font face="Arial" size="3" color="#888888"><b>Email</b></font>
                                </td>
                                <td>
                                    <font face="Arial" size="4" color="#1a1a2e"><b>
                                            <asp:Label ID="lblEmail" runat="server" />
                                        </b></font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <!-- Orders Tab -->
        <asp:Panel ID="pnlOrders" runat="server" Visible="false">
            <asp:Panel ID="pnlNoOrders" runat="server" Visible="false">
                <table width="100%" border="0" cellpadding="40" cellspacing="0" bgcolor="#ffffff">
                    <tr>
                        <td align="center">
                            <font face="Arial" size="4" color="#888888">You haven't placed any orders yet.</font>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:Repeater ID="rptOrders" runat="server">
                <ItemTemplate>
                    <table width="800" border="0" cellpadding="20" cellspacing="0" bgcolor="#ffffff">
                        <tr>
                            <td width="20%">
                                <font face="Arial" size="2" color="#888888">Order ID</font><br />
                                <font face="Arial" size="4" color="#1a1a2e"><b>#<%# Eval("Id") %></b></font>
                            </td>
                            <td width="30%">
                                <font face="Arial" size="2" color="#888888">Date Placed</font><br />
                                <font face="Arial" size="3" color="#1a1a2e"><b>
                                        <%# Eval("OrderDate", "{0:dd MMM yyyy}" ) %>
                                    </b></font>
                            </td>
                            <td width="20%">
                                <font face="Arial" size="2" color="#888888">Order Total</font><br />
                                <font face="Arial" size="4" color="#e4717a"><b>Rs. <%# Eval("TotalAmount") %></b></font>
                            </td>
                            <td width="30%" align="right" valign="middle">
                                <a href='<%# "OrderDetails.aspx?id=" + Eval("Id") %>'>
                                    <table border="0" cellpadding="10" cellspacing="0" bgcolor="#1a1a2e">
                                        <tr>
                                            <td>
                                                <font face="Arial" color="White" size="3"><b>View Details</b></font>
                                            </td>
                                        </tr>
                                    </table>
                                </a>
                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>

        <!-- Wishlist Tab -->
        <asp:Panel ID="pnlWishlist" runat="server" Visible="false">
            <asp:Panel ID="pnlNoWishlist" runat="server" Visible="false">
                <table width="100%" border="0" cellpadding="40" cellspacing="0" bgcolor="#ffffff">
                    <tr>
                        <td align="center">
                            <font face="Arial" size="4" color="#888888">Your wishlist is empty.</font>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <table width="100%" border="0" cellpadding="10" cellspacing="0">
                <tr>
                    <asp:Repeater ID="rptWishlist" runat="server" OnItemCommand="rptWishlist_ItemCommand">
                        <ItemTemplate>
                            <td width="25%" align="center" valign="top" bgcolor="#ffffff">
                                <table border="0" cellpadding="15" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="center">
                                            <a href='<%# "BookDetails.aspx?id=" + Eval("BookId") %>'>
                                                <img src='<%# Eval("BookImageUrl") %>' alt='<%# Eval("BookTitle") %>'
                                                    width="160" height="240" border="0"
                                                    onerror="this.src='https://via.placeholder.com/160x240?text=No+Cover'" /><br /><br />
                                                <font face="Arial" size="3" color="#1a1a2e"><b>
                                                        <%# Eval("BookTitle") %>
                                                    </b></font><br />
                                                <font face="Arial" size="2" color="#888888">
                                                    <%# Eval("BookAuthor") %>
                                                </font><br /><br />
                                                <font face="Arial" size="4" color="#e4717a"><b>Rs. <%# Eval("BookPrice")
                                                            %></b></font>
                                            </a>
                                            <br /><br />
                                            <asp:LinkButton ID="btnRemoveWish" runat="server" CommandName="RemoveWish"
                                                CommandArgument='<%# Eval("Id") %>' ForeColor="#dc3545"
                                                Font-Names="Arial" Font-Bold="true">Remove &times;</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <%# (Container.ItemIndex + 1) % 4==0 ? "</tr><tr><td colspan='4'>&nbsp;</td></tr><tr>" : "" %>
                    </ItemTemplate>
                    </asp:Repeater>
                </tr>
            </table>
        </asp:Panel>
    </asp:Content>
