<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="OnlineBookStore._Default" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <!-- Hero Section -->
        <table width="100%" border="0" cellpadding="40" cellspacing="0" bgcolor="#ffffff">
            <tr>
                <td align="center">
                    <font face="Arial" size="7" color="#1a1a2e"><b>Welcome to Readers</b></font><br /><br />
                    <font face="Arial" size="4" color="#888888">Discover your next favourite book from our curated
                        collection</font><br /><br /><br />
                    <a href="BrowseBooks.aspx">
                        <table border="0" cellpadding="15" cellspacing="0" bgcolor="#e4717a">
                            <tr>
                                <td>
                                    <font face="Arial" color="#ffffff" size="4"><b>Browse All Books</b></font>
                                </td>
                            </tr>
                        </table>
                    </a>
                </td>
            </tr>
        </table>
        <br /><br /><br />

        <!-- AdRotator -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                    <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/AdRotator.xml" />
                </td>
            </tr>
        </table>
        <br /><br /><br />

        <!-- Featured Books -->
        <font face="Arial" size="6" color="#1a1a2e"><b>Featured Books</b></font>
        <br /><br />

        <table width="100%" border="0" cellpadding="10" cellspacing="0">
            <tr>
                <asp:Repeater ID="rptFeatured" runat="server">
                    <ItemTemplate>
                        <td width="25%" align="center" valign="top" bgcolor="#ffffff">
                            <table border="0" cellpadding="15" cellspacing="0" width="100%">
                                <tr>
                                    <td align="center">
                                        <a href='<%# "BookDetails.aspx?id=" + Eval("Id") %>'>
                                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' width="160"
                                                height="240" border="0"
                                                onerror="this.src='https://via.placeholder.com/160x240?text=No+Cover'" /><br /><br />
                                            <font face="Arial" size="3" color="#1a1a2e"><b>
                                                    <%# Eval("Title") %>
                                                </b></font><br />
                                            <font face="Arial" size="2" color="#888888">
                                                <%# Eval("Author") %>
                                            </font><br /><br />
                                            <font face="Arial" size="4" color="#e4717a"><b>Rs. <%# Eval("Price") %></b>
                                            </font>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <%# (Container.ItemIndex + 1) % 4==0 ? "</tr><tr><td colspan='4'>&nbsp;</td></tr><tr>" : "" %>
                    </ItemTemplate>
                </asp:Repeater>
            </tr>
        </table>
    </asp:Content>