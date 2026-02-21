<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Cart.aspx.cs" Inherits="OnlineBookStore.CartPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h1 style="font-size: 32px; font-weight: 700; color: #1a1a2e; margin-bottom: 24px;">🛒 Shopping Cart</h1>

        <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
            <div style="text-align: center; padding: 60px 0;">
                <p style="font-size: 18px; color: #888; margin-bottom: 20px;">Your cart is empty</p>
                <a href="BrowseBooks.aspx" class="btn btn-primary">Browse Books</a>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlCart" runat="server">
            <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                <ItemTemplate>
                    <div
                        style="display: flex; align-items: center; gap: 20px; background: #fff; padding: 16px 20px; border-radius: 12px; margin-bottom: 12px; box-shadow: 0 1px 6px rgba(0,0,0,0.06);">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("BookTitle") %>'
                            style="width: 60px; height: 85px; object-fit: cover; border-radius: 6px;" />
                        <div style="flex: 1;">
                            <h3 style="font-size: 16px; font-weight: 600; color: #1a1a2e; margin-bottom: 4px;">
                                <%# Eval("BookTitle") %>
                            </h3>
                            <p style="font-size: 14px; color: #888;">Qty: <%# Eval("Quantity") %>
                            </p>
                        </div>
                        <p
                            style="font-size: 18px; font-weight: 700; color: #c45b3e; min-width: 80px; text-align: right;">
                            ₹<%# Eval("Price") %>
                        </p>
                        <asp:LinkButton ID="btnRemove" runat="server" CommandName="Remove"
                            CommandArgument='<%# Eval("BookId") %>'
                            style="color: #dc3545; font-size: 13px; font-weight: 600; padding: 6px 12px; border: 1px solid #dc3545; border-radius: 6px;">
                            Remove</asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div
                style="background: #fff; border-radius: 12px; padding: 24px; margin-top: 20px; box-shadow: 0 1px 6px rgba(0,0,0,0.06); display: flex; justify-content: space-between; align-items: center;">
                <div>
                    <p style="font-size: 14px; color: #888;">Total Amount</p>
                    <asp:Label ID="lblTotal" runat="server"
                        style="font-size: 28px; font-weight: 700; color: #1a1a2e;" />
                </div>
                <div style="display: flex; gap: 12px;">
                    <asp:Button ID="btnClear" runat="server" Text="Clear Cart" OnClick="btnClear_Click"
                        CssClass="btn btn-danger" />
                    <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" OnClick="btnCheckout_Click"
                        CssClass="btn btn-primary" />
                </div>
            </div>
        </asp:Panel>
    </asp:Content>