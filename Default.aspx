<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineBookStore._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <div style="background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%); border-radius: 16px; padding: 60px 50px; margin-bottom: 40px; color: #fff; text-align: center;">
        <h1 style="font-size: 42px; font-weight: 700; margin-bottom: 12px;">Welcome to Readers</h1>
        <p style="font-size: 18px; color: #c9a87c; margin-bottom: 28px;">Discover your next favourite book from our curated collection</p>
        <a href="BrowseBooks.aspx" class="btn btn-primary" style="font-size: 16px; padding: 14px 36px;">Browse All Books</a>
    </div>

    <!-- AdRotator -->
    <div style="text-align: center; margin-bottom: 40px;">
        <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/AdRotator.xml"
            style="max-width: 728px; height: auto; border-radius: 12px; box-shadow: 0 4px 16px rgba(0,0,0,0.1);" />
    </div>

    <!-- Featured Books -->
    <h2 style="font-size: 28px; font-weight: 700; color: #1a1a2e; margin-bottom: 24px;">Featured Books</h2>
    <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 24px;">
        <asp:Repeater ID="rptFeatured" runat="server">
            <ItemTemplate>
                <div style="background: #fff; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 12px rgba(0,0,0,0.08); transition: transform 0.2s, box-shadow 0.2s;">
                    <a href='<%# "BookDetails.aspx?id=" + Eval("Id") %>'>
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>'
                            style="width: 100%; height: 280px; object-fit: cover;" onerror="this.src='https://via.placeholder.com/200x280?text=No+Cover'" />
                        <div style="padding: 14px;">
                            <h3 style="font-size: 14px; font-weight: 600; color: #1a1a2e; margin-bottom: 4px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%# Eval("Title") %></h3>
                            <p style="font-size: 12px; color: #888; margin-bottom: 6px;"><%# Eval("Author") %></p>
                            <p style="font-size: 16px; font-weight: 700; color: #c45b3e;">₹<%# Eval("Price") %></p>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
