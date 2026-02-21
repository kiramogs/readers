<%@ Page Title="Book Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BookDetails.aspx.cs" Inherits="OnlineBookStore.BookDetailsPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <!-- Back Button -->
        <a href="BrowseBooks.aspx">
            <font face="Arial" size="3" color="#e4717a"><b>&laquo; Back to Browse</b></font>
        </a>
        <br /><br /><br />

        <!-- Main Content Table -->
        <table width="100%" border="0" cellpadding="20" cellspacing="0" bgcolor="#ffffff">
            <tr>
                <!-- Image Column -->
                <td width="300" align="center" valign="top">
                    <asp:Image ID="imgBookCover" runat="server" Width="250" Height="380" BorderWidth="1"
                        BorderColor="#d4cfc7" />
                </td>

                <!-- Details Column -->
                <td valign="top">
                    <font face="Arial" size="6" color="#1a1a2e"><b>
                            <asp:Label ID="lblTitle" runat="server" />
                        </b></font>
                    <br /><br />
                    <font face="Arial" size="4" color="#e4717a"><b>
                            <asp:Label ID="lblAuthor" runat="server" />
                        </b></font>
                    <br /><br />

                    <table border="0" cellpadding="5" cellspacing="0">
                        <tr>
                            <td>
                                <font face="Arial" color="#888888"><b>Genre:</b></font>
                            </td>
                            <td>
                                <font face="Arial" color="#1a1a2e"><b>
                                        <asp:Label ID="lblGenre" runat="server" />
                                    </b></font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font face="Arial" color="#888888"><b>ISBN:</b></font>
                            </td>
                            <td>
                                <font face="Arial" color="#1a1a2e"><b>
                                        <asp:Label ID="lblISBN" runat="server" />
                                    </b></font>
                            </td>
                        </tr>
                    </table>
                    <br /><br />

                    <font face="Arial" size="6" color="#2c2c2c"><b>
                            <asp:Label ID="lblPrice" runat="server" />
                        </b></font>
                    <br /><br /><br />

                    <font face="Arial" size="3" color="#5a5a5a">
                        <asp:Label ID="lblDescription" runat="server" />
                    </font>
                    <br /><br /><br />

                    <!-- Action Buttons -->
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart"
                                    OnClick="btnAddCart_Click" BackColor="#e4717a" ForeColor="White"
                                    Font-Names="Arial" Font-Bold="true" Height="45" Width="180" BorderStyle="None" />
                            </td>
                            <td width="20">&nbsp;</td>
                            <td>
                                <asp:Button ID="btnAddToWishlist" runat="server" Text="Add to Wishlist"
                                    OnClick="btnWishlist_Click" BackColor="#ffffff" ForeColor="#e4717a"
                                    Font-Names="Arial" Font-Bold="true" Height="45" Width="180" BorderStyle="Solid"
                                    BorderColor="#e4717a" BorderWidth="2" />
                            </td>
                        </tr>
                    </table>
                    <br /><br />

                    <!-- Messages -->
                    <asp:Label ID="lblMessage" runat="server" Visible="false" Font-Names="Arial" Font-Bold="true" />
                </td>
            </tr>
        </table>
    </asp:Content>
