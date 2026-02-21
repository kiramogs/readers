<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="OrderDetails.aspx.cs" Inherits="OnlineBookStore.OrderDetailsPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <a href="Profile.aspx">
            <font face="Arial" size="3" color="#e4717a"><b>&laquo; Back to Profile</b></font>
        </a>
        <br /><br /><br />

        <font face="Arial" size="6" color="#1a1a2e"><b>Order Details</b></font>
        <br /><br />

        <asp:Label ID="lblError" runat="server" Visible="false" Font-Names="Arial" Font-Bold="true"
            ForeColor="#dc3545" />

        <asp:Panel ID="pnlOrderDetails" runat="server">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="65%" valign="top">
                        <!-- Order Info -->
                        <table width="100%" border="0" cellpadding="20" cellspacing="0" bgcolor="#ffffff">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="10" cellspacing="0">
                                        <tr>
                                            <td>
                                                <font face="Arial" size="2" color="#888888"><b>Order ID</b></font><br />
                                                <font face="Arial" size="4" color="#1a1a2e"><b>#
                                                        <asp:Label ID="lblOrderId" runat="server" />
                                                    </b></font>
                                            </td>
                                            <td>
                                                <font face="Arial" size="2" color="#888888"><b>Date Placed</b></font>
                                                <br />
                                                <font face="Arial" size="4" color="#1a1a2e"><b>
                                                        <asp:Label ID="lblOrderDate" runat="server" />
                                                    </b></font>
                                            </td>
                                            <td>
                                                <font face="Arial" size="2" color="#888888"><b>Status</b></font><br />
                                                <font face="Arial" size="4" color="#28a745"><b>
                                                        <asp:Label ID="lblStatus" runat="server" />
                                                    </b></font>
                                            </td>
                                        </tr>
                                    </table>

                                    <br /><br />
                                    <font face="Arial" size="4" color="#1a1a2e"><b>Items in Your Order</b></font>
                                    <hr color="#d4cfc7" size="1" />
                                    <br />

                                    <asp:Repeater ID="rptOrderItems" runat="server">
                                        <ItemTemplate>
                                            <table width="100%" border="0" cellpadding="10" cellspacing="0">
                                                <tr>
                                                    <td width="80">
                                                        <img src='https://via.placeholder.com/60x90?text=Book' alt='<%# Eval("BookTitle") %>'
                                                            width="60" height="90" border="0"
                                                            onerror="this.src='https://via.placeholder.com/60x90?text=No+Cover'" />
                                                    </td>
                                                    <td valign="top">
                                                        <font face="Arial" size="3" color="#1a1a2e"><b>
                                                                <%# Eval("BookTitle") %>
                                                            </b></font><br />
                                                        <font face="Arial" size="2" color="#888888">Qty: <%#
                                                                Eval("Quantity") %>
                                                        </font>
                                                    </td>
                                                    <td align="right" valign="top">
                                                        <font face="Arial" size="3" color="#1a1a2e"><b>Rs. <%#
                                                                    Eval("Price") %></b></font>
                                                    </td>
                                                </tr>
                                            </table>
                                            <hr color="#f4f1eb" size="1" />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </table>
                    </td>

                    <td width="3%">&nbsp;</td>

                    <!-- Summaries -->
                    <td width="32%" valign="top">
                        <!-- Total Summary -->
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
                                                        <asp:Label ID="lblTotalItems" runat="server" />
                                                    </b></font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <font face="Arial" size="4" color="#1a1a2e"><b>Order Total:</b></font>
                                            </td>
                                            <td align="right">
                                                <font face="Arial" size="4" color="#e4717a"><b>
                                                        <asp:Label ID="lblTotal" runat="server" />
                                                    </b></font>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                        <br />

                        <!-- Shipping Address -->
                        <table width="100%" border="0" cellpadding="20" cellspacing="0" bgcolor="#ffffff">
                            <tr>
                                <td>
                                    <font face="Arial" size="4" color="#1a1a2e"><b>Shipping Address</b></font>
                                    <hr color="#d4cfc7" size="1" />
                                    <br />
                                    <font face="Arial" size="3" color="#5a5a5a">
                                        <asp:Label ID="lblAddress" runat="server" />
                                    </font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </asp:Content>
