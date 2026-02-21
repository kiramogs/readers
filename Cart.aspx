<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Cart.aspx.cs" Inherits="OnlineBookStore.CartPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <font face="Arial" size="6" color="#1a1a2e"><b>Shopping Cart</b></font>
        <br /><br />

        <asp:Label ID="lblMessage" runat="server" Visible="false" Font-Names="Arial" Font-Bold="true" />

        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
            <table width="100%" border="0" cellpadding="40" cellspacing="0" bgcolor="#ffffff">
                <tr>
                    <td align="center">
                        <font face="Arial" size="5" color="#888888">Your cart is completely empty.</font>
                        <br /><br /><br />
                        <a href="BrowseBooks.aspx">
                            <table border="0" cellpadding="15" cellspacing="0" bgcolor="#e4717a">
                                <tr>
                                    <td>
                                        <font face="Arial" color="#ffffff" size="4"><b>Continue Shopping</b></font>
                                    </td>
                                </tr>
                            </table>
                        </a>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="pnlCartContent" runat="server">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <!-- Left Column: Cart Items -->
                    <td width="70%" valign="top">
                        <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                            <ItemTemplate>
                                <table width="100%" border="0" cellpadding="20" cellspacing="0" bgcolor="#ffffff">
                                    <tr>
                                        <td width="120">
                                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("BookTitle") %>' width="100"
                                                height="150" border="0"
                                                onerror="this.src='https://via.placeholder.com/100x150?text=No+Cover'" />
                                        </td>
                                        <td valign="top">
                                            <font face="Arial" size="4" color="#1a1a2e"><b>
                                                    <%# Eval("BookTitle") %>
                                                </b></font><br /><br />
                                            <font face="Arial" size="4" color="#e4717a"><b>Rs. <%# Eval("Price") %></b>
                                            </font>
                                        </td>
                                        <td valign="middle" align="center" width="150">
                                            <font face="Arial" size="3" color="#1a1a2e"><b>Qty: <%# Eval("Quantity") %>
                                                        </b></font>
                                            <br /><br />
                                            <asp:LinkButton ID="btnRemove" runat="server" CommandName="Remove"
                                                CommandArgument='<%# Eval("BookId") %>' ForeColor="#dc3545"
                                                Font-Names="Arial"><b>Remove</b></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>

                    <td width="2%">&nbsp;</td>

                    <!-- Right Column: Order Summary -->
                    <td width="28%" valign="top">
                        <table width="100%" border="0" cellpadding="20" cellspacing="0" bgcolor="#ffffff">
                            <tr>
                                <td>
                                    <font face="Arial" size="4" color="#1a1a2e"><b>Order Summary</b></font>
                                    <hr color="#d4cfc7" size="1" />
                                    <br />
                                    <table width="100%" border="0" cellpadding="5" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <font face="Arial" size="3" color="#888888">Total Items:</font>
                                            </td>
                                            <td align="right">
                                                <font face="Arial" size="3" color="#1a1a2e"><b>
                                                        <asp:Label ID="lblItemCount" runat="server" />
                                                    </b></font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <font face="Arial" size="4" color="#1a1a2e"><b>Total:</b></font>
                                            </td>
                                            <td align="right">
                                                <font face="Arial" size="4" color="#e4717a"><b>
                                                        <asp:Label ID="lblTotal" runat="server" />
                                                    </b></font>
                                            </td>
                                        </tr>
                                    </table>
                                    <br /><br />
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout"
                                                    OnClick="btnCheckout_Click" BackColor="#c45b3e" ForeColor="White"
                                                    Font-Names="Arial" Font-Bold="true" Height="45" Width="100%"
                                                    BorderStyle="None" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="10"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnClearCart" runat="server" Text="Clear Cart"
                                                    OnClick="btnClear_Click" BackColor="#ffffff" ForeColor="#dc3545"
                                                    Font-Names="Arial" Font-Bold="true" Height="45" Width="100%"
                                                    BorderStyle="Solid" BorderColor="#dc3545" BorderWidth="2" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </asp:Content>
