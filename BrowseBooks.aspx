<%@ Page Title="Browse Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BrowseBooks.aspx.cs" Inherits="OnlineBookStore.BrowseBooks" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h1 style="font-size: 32px; font-weight: 700; color: #1a1a2e; margin-bottom: 24px;">Browse Books</h1>

        <!-- Search & Filter -->
        <div style="display: flex; gap: 12px; margin-bottom: 28px; flex-wrap: wrap; align-items: end;">
            <div style="flex: 1; min-width: 200px;">
                <label class="form-label">Search</label>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"
                    placeholder="Search by title or author..." />
            </div>
            <div style="min-width: 160px;">
                <label class="form-label">Genre</label>
                <asp:DropDownList ID="ddlGenre" runat="server" CssClass="form-control" />
            </div>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary"
                style="height: 42px;" />
            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btn btn-outline"
                style="height: 42px;" />
        </div>

        <!-- Results Count -->
        <asp:Label ID="lblCount" runat="server"
            style="display: block; font-size: 14px; color: #888; margin-bottom: 20px;" />

        <!-- Books Grid -->
        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 24px;">
            <asp:Repeater ID="rptBooks" runat="server">
                <ItemTemplate>
                    <div
                        style="background: #fff; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 12px rgba(0,0,0,0.08); transition: transform 0.2s;">
                        <a href='<%# "BookDetails.aspx?id=" + Eval("Id") %>'>
                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>'
                                style="width: 100%; height: 280px; object-fit: cover;"
                                onerror="this.src='https://via.placeholder.com/200x280?text=No+Cover'" />
                            <div style="padding: 14px;">
                                <h3
                                    style="font-size: 14px; font-weight: 600; color: #1a1a2e; margin-bottom: 4px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                    <%# Eval("Title") %>
                                </h3>
                                <p style="font-size: 12px; color: #888; margin-bottom: 4px;">
                                    <%# Eval("Author") %>
                                </p>
                                <span
                                    style="font-size: 11px; background: #f4f1eb; color: #5a5a5a; padding: 2px 8px; border-radius: 4px;">
                                    <%# Eval("Genre") %>
                                </span>
                                <p style="font-size: 16px; font-weight: 700; color: #c45b3e; margin-top: 8px;">₹<%#
                                        Eval("Price") %>
                                </p>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </asp:Content>