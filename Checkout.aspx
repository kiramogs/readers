<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Checkout.aspx.cs" Inherits="OnlineBookStore.CheckoutPage" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h1 style="font-size: 32px; font-weight: 700; color: #1a1a2e; margin-bottom: 24px;">Checkout</h1>

        <div style="display: flex; gap: 30px; flex-wrap: wrap;">
            <!-- Delivery Details -->
            <div
                style="flex: 1; min-width: 300px; background: #fff; border-radius: 16px; padding: 30px; box-shadow: 0 2px 12px rgba(0,0,0,0.06);">
                <h2 style="font-size: 20px; font-weight: 600; color: #1a1a2e; margin-bottom: 20px;">Delivery Details
                </h2>

                <asp:Label ID="lblError" runat="server" CssClass="alert-danger" Visible="false"
                    style="display: block; margin-bottom: 16px;" />

                <div style="margin-bottom: 16px;">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your full name" />
                </div>
                <div style="margin-bottom: 16px;">
                    <label class="form-label">Delivery Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"
                        placeholder="Street, City, PIN code" />
                </div>
                <div style="margin-bottom: 24px;">
                    <label class="form-label">Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"
                        placeholder="10-digit phone number" />
                </div>
                <asp:Button ID="btnPlace" runat="server" Text="Place Order" OnClick="btnPlace_Click"
                    CssClass="btn btn-primary" style="width: 100%; padding: 14px; font-size: 16px;" />
            </div>

            <!-- Order Summary -->
            <div
                style="width: 340px; background: #fff; border-radius: 16px; padding: 30px; box-shadow: 0 2px 12px rgba(0,0,0,0.06); height: fit-content;">
                <h2 style="font-size: 20px; font-weight: 600; color: #1a1a2e; margin-bottom: 20px;">Order Summary</h2>
                <asp:Repeater ID="rptSummary" runat="server">
                    <ItemTemplate>
                        <div
                            style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #f0ece4;">
                            <span style="font-size: 14px; color: #555;">
                                <%# Eval("BookTitle") %> ×<%# Eval("Quantity") %>
                            </span>
                            <span style="font-size: 14px; font-weight: 600; color: #1a1a2e;">₹<%# Eval("Price") %>
                                    </span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div
                    style="display: flex; justify-content: space-between; padding-top: 16px; margin-top: 8px; border-top: 2px solid #1a1a2e;">
                    <span style="font-size: 18px; font-weight: 700; color: #1a1a2e;">Total</span>
                    <asp:Label ID="lblTotal" runat="server"
                        style="font-size: 18px; font-weight: 700; color: #c45b3e;" />
                </div>
            </div>
        </div>
    </asp:Content>