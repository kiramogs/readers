<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Checkout.aspx.cs" Inherits="OnlineBookStore.CheckoutPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <font face="Arial" size="6" color="#1a1a2e"><b>Checkout</b></font>
        <br /><br />

        <!-- Error Message -->
        <asp:Label ID="lblError" runat="server" Visible="false" Font-Names="Arial" Font-Bold="true"
            ForeColor="#dc3545" />

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <!-- Left Column: Shipping Form -->
                <td width="60%" valign="top">
                    <table width="100%" border="0" cellpadding="30" cellspacing="0" bgcolor="#ffffff">
                        <tr>
                            <td>
                                <font face="Arial" size="4" color="#1a1a2e"><b>Shipping Address</b></font>
                                <hr color="#d4cfc7" size="1" />
                                <br />

                                <font face="Arial" size="3" color="#5a5a5a"><b>Full Name</b></font><br />
                                <asp:TextBox ID="txtFullName" runat="server" Width="100%" Height="35"
                                    Font-Names="Arial" /><br /><br />

                                <font face="Arial" size="3" color="#5a5a5a"><b>Street Address</b></font><br />
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" Width="100%"
                                    Font-Names="Arial" /><br /><br />

                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="48%">
                                            <font face="Arial" size="3" color="#5a5a5a"><b>City</b></font><br />
                                            <asp:TextBox ID="txtCity" runat="server" Width="100%" Height="35"
                                                Font-Names="Arial" />
                                        </td>
                                        <td width="4%">&nbsp;</td>
                                        <td width="48%">
                                            <font face="Arial" size="3" color="#5a5a5a"><b>Postal Code</b></font><br />
                                            <asp:TextBox ID="txtPostalCode" runat="server" Width="100%" Height="35"
                                                Font-Names="Arial" />
                                        </td>
                                    </tr>
                                </table>

                                <br /><br />
                                <font face="Arial" size="4" color="#1a1a2e"><b>Payment Information</b></font>
                                <hr color="#d4cfc7" size="1" />
                                <br />

                                <font face="Arial" size="3" color="#5a5a5a"><b>Card Number</b></font><br />
                                <asp:TextBox ID="txtCardNumber" runat="server" Width="100%" Height="35"
                                    Font-Names="Arial" /><br /><br />

                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="48%">
                                            <font face="Arial" size="3" color="#5a5a5a"><b>Expiry Date (MM/YY)</b>
                                            </font><br />
                                            <asp:TextBox ID="txtExpiry" runat="server" Width="100%" Height="35"
                                                Font-Names="Arial" />
                                        </td>
                                        <td width="4%">&nbsp;</td>
                                        <td width="48%">
                                            <font face="Arial" size="3" color="#5a5a5a"><b>CVV</b></font><br />
                                            <asp:TextBox ID="txtCVV" runat="server" Width="100%" Height="35"
                                                Font-Names="Arial" />
                                        </td>
                                    </tr>
                                </table>
                                <br /><br />

                                <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order"
                                    OnClick="btnPlace_Click" BackColor="#c45b3e" ForeColor="White"
                                    Font-Names="Arial" Font-Bold="true" Height="45" Width="100%" BorderStyle="None" />
                            </td>
                        </tr>
                    </table>
                </td>

                <td width="3%">&nbsp;</td>

                <!-- Right Column: Order Summary -->
                <td width="37%" valign="top">
                    <table width="100%" border="0" cellpadding="20" cellspacing="0" bgcolor="#ffffff">
                        <tr>
                            <td>
                                <font face="Arial" size="4" color="#1a1a2e"><b>Order Summary</b></font>
                                <hr color="#d4cfc7" size="1" />
                                <br />
                                <asp:Repeater ID="rptOrderSummary" runat="server">
                                    <ItemTemplate>
                                        <table width="100%" border="0" cellpadding="5" cellspacing="0">
                                            <tr>
                                                <td colspan="2">
                                                    <font face="Arial" size="3" color="#1a1a2e"><b>
                                                            <%# Eval("BookTitle") %>
                                                        </b></font>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <font face="Arial" size="2" color="#888888">Qty: <%#
                                                            Eval("Quantity") %>
                                                    </font>
                                                </td>
                                                <td align="right">
                                                    <font face="Arial" size="3" color="#1a1a2e">Rs. <%# Eval("Price") %>
                                                    </font>
                                                </td>
                                            </tr>
                                        </table>
                                        <hr color="#f4f1eb" size="1" />
                                    </ItemTemplate>
                                </asp:Repeater>

                                <br />
                                <table width="100%" border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <font face="Arial" size="3" color="#888888">Subtotal:</font>
                                        </td>
                                        <td align="right">
                                            <font face="Arial" size="3" color="#1a1a2e"><b>
                                                    <asp:Label ID="lblSubtotal" runat="server" />
                                                </b></font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <font face="Arial" size="3" color="#888888">Shipping:</font>
                                        </td>
                                        <td align="right">
                                            <font face="Arial" size="3" color="#1a1a2e"><b>Rs. 50</b></font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <hr color="#d4cfc7" size="1" />
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
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Content>
