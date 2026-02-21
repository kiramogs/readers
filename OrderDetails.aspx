<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="OrderDetails.aspx.cs" Inherits="OnlineBookStore.OrderDetailsPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:Panel ID="pnlOrder" runat="server">
            <div
                style="background: #d4edda; border-radius: 12px; padding: 24px; margin-bottom: 24px; text-align: center;">
                <p style="font-size: 28px; margin-bottom: 8px;">✓</p>
                <h2 style="font-size: 22px; font-weight: 700; color: #155724; margin-bottom: 4px;">Order Placed
                    Successfully!</h2>
                <asp:Label ID="lblOrderId" runat="server" style="font-size: 14px; color: #155724;" />
            </div>

            <div style="display: flex; gap: 24px; flex-wrap: wrap;">
                <!-- Order Items -->
                <div
                    style="flex: 1; min-width: 300px; background: #fff; border-radius: 12px; padding: 24px; box-shadow: 0 2px 12px rgba(0,0,0,0.06);">
                    <h3 style="font-size: 18px; font-weight: 600; color: #1a1a2e; margin-bottom: 16px;">Order Items</h3>
                    <asp:Repeater ID="rptItems" runat="server">
                        <ItemTemplate>
                            <div
                                style="display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #f0ece4;">
                                <div>
                                    <p style="font-size: 15px; font-weight: 500; color: #1a1a2e;">
                                        <%# Eval("BookTitle") %>
                                    </p>
                                    <p style="font-size: 13px; color: #888;">Qty: <%# Eval("Quantity") %>
                                    </p>
                                </div>
                                <p style="font-size: 15px; font-weight: 600; color: #c45b3e;">₹<%# Eval("Price") %>
                                </p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div
                        style="display: flex; justify-content: space-between; padding-top: 16px; margin-top: 8px; border-top: 2px solid #1a1a2e;">
                        <span style="font-size: 18px; font-weight: 700;">Total</span>
                        <asp:Label ID="lblTotal" runat="server"
                            style="font-size: 18px; font-weight: 700; color: #c45b3e;" />
                    </div>
                </div>

                <!-- Delivery Info -->
                <div
                    style="width: 300px; background: #fff; border-radius: 12px; padding: 24px; box-shadow: 0 2px 12px rgba(0,0,0,0.06); height: fit-content;">
                    <h3 style="font-size: 18px; font-weight: 600; color: #1a1a2e; margin-bottom: 16px;">Delivery Details
                    </h3>
                    <div style="margin-bottom: 12px;">
                        <label class="form-label">Name</label>
                        <asp:Label ID="lblName" runat="server" style="display: block; font-size: 15px;" />
                    </div>
                    <div style="margin-bottom: 12px;">
                        <label class="form-label">Address</label>
                        <asp:Label ID="lblAddress" runat="server" style="display: block; font-size: 15px;" />
                    </div>
                    <div style="margin-bottom: 12px;">
                        <label class="form-label">Phone</label>
                        <asp:Label ID="lblPhone" runat="server" style="display: block; font-size: 15px;" />
                    </div>
                    <div>
                        <label class="form-label">Date</label>
                        <asp:Label ID="lblDate" runat="server" style="display: block; font-size: 15px;" />
                    </div>
                </div>
            </div>

            <div style="margin-top: 24px;">
                <a href="BrowseBooks.aspx" class="btn btn-primary">Continue Shopping</a>
                <a href="Profile.aspx" class="btn btn-outline" style="margin-left: 12px;">View All Orders</a>
            </div>
        </asp:Panel>
    </asp:Content>