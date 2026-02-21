<%@ Page Title="Browse Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BrowseBooks.aspx.cs" Inherits="OnlineBookStore.BrowseBooks" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <font face="Arial" size="6" color="#1a1a2e"><b>Browse Books</b></font>
        <br /><br />

        <!-- Search & Filter -->
        <table width="100%" border="0" cellpadding="20" cellspacing="0" bgcolor="#ffffff">
            <tr>
                <td valign="middle">
                    <table border="0" cellpadding="5" cellspacing="0">
                        <tr>
                            <td>
                                <font face="Arial" size="3" color="#1a1a2e"><b>Search Title/Author:</b></font>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSearch" runat="server" Width="300" Height="30" Font-Names="Arial" />
                            </td>
                            <td>&nbsp;&nbsp;</td>
                            <td>
                                <font face="Arial" size="3" color="#1a1a2e"><b>Genre:</b></font>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlGenre" runat="server" Width="200" Height="30"
                                    Font-Names="Arial" />
                            </td>
                            <td>&nbsp;&nbsp;</td>
                            <td>
                                <asp:Button ID="btnFilter" runat="server" Text="Filter Options"
                                    OnClick="btnSearch_Click" BackColor="#e4717a" ForeColor="white" BorderStyle="None"
                                    Height="35" Width="120" Font-Names="Arial" Font-Bold="true" />
                            </td>
                            <td>
                                <asp:Button ID="btnReset" runat="server" Text="Reset Filters" OnClick="btnReset_Click"
                                    BackColor="#ffffff" ForeColor="#e4717a" BorderColor="#e4717a" BorderStyle="Solid"
                                    BorderWidth="2" Height="35" Width="120" Font-Names="Arial" Font-Bold="true" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br /><br />

        <asp:Label ID="lblNoResults" runat="server" Visible="false">
            <center>
                <br /><br />
                <font face="Arial" size="4" color="#888888">No books found matching your criteria.</font>
                <br /><br />
            </center>
        </asp:Label>

        <table width="100%" border="0" cellpadding="10" cellspacing="0">
            <tr>
                <asp:Repeater ID="rptBooks" runat="server">
                    <ItemTemplate>
                        <td width="20%" align="center" valign="top" bgcolor="#ffffff">
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
                        <%# (Container.ItemIndex + 1) % 5==0 ? "</tr><tr><td colspan='5'>&nbsp;</td></tr><tr>" : "" %>
                    </ItemTemplate>
                </asp:Repeater>
            </tr>
        </table>
    </asp:Content>
