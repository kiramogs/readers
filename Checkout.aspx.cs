using System;
using System.Collections.Generic;
using System.Linq;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class CheckoutPage : System.Web.UI.Page
    {
        private const decimal ShippingCharge = 50m;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            var cart = Session["Cart"] as List<CartItem>;
            if (cart == null || cart.Count == 0)
            {
                Response.Redirect("Cart.aspx");
                return;
            }

            if (!IsPostBack)
            {
                rptOrderSummary.DataSource = cart;
                rptOrderSummary.DataBind();

                decimal subtotal = cart.Sum(c => c.Price * c.Quantity);
                lblSubtotal.Text = "Rs. " + subtotal;
                lblTotal.Text = "Rs. " + (subtotal + ShippingCharge);
            }
        }

        protected void btnPlace_Click(object sender, EventArgs e)
        {
            string name = txtFullName.Text.Trim();
            string address = txtAddress.Text.Trim();
            string city = txtCity.Text.Trim();
            string postalCode = txtPostalCode.Text.Trim();
            string cardNumber = txtCardNumber.Text.Trim();
            string expiry = txtExpiry.Text.Trim();
            string cvv = txtCVV.Text.Trim();

            lblError.Visible = false;

            if (string.IsNullOrEmpty(name) ||
                string.IsNullOrEmpty(address) ||
                string.IsNullOrEmpty(city) ||
                string.IsNullOrEmpty(postalCode) ||
                string.IsNullOrEmpty(cardNumber) ||
                string.IsNullOrEmpty(expiry) ||
                string.IsNullOrEmpty(cvv))
            {
                lblError.Text = "Please fill in all checkout details.";
                lblError.Visible = true;
                return;
            }

            var cart = Session["Cart"] as List<CartItem>;
            if (cart == null || cart.Count == 0)
            {
                Response.Redirect("Cart.aspx");
                return;
            }

            decimal subtotal = cart.Sum(c => c.Price * c.Quantity);
            var order = new Order
            {
                Id = DataStore.NextOrderId(),
                UserName = Session["UserName"].ToString(),
                DeliveryName = name,
                DeliveryAddress = address + ", " + city + " - " + postalCode,
                DeliveryPhone = string.Empty,
                TotalAmount = subtotal + ShippingCharge
            };

            foreach (var item in cart)
            {
                order.Items.Add(new OrderItem
                {
                    BookId = item.BookId,
                    BookTitle = item.BookTitle,
                    Price = item.Price,
                    Quantity = item.Quantity,
                    OrderId = order.Id
                });
            }

            DataStore.Orders.Add(order);
            Session["Cart"] = new List<CartItem>();
            Response.Redirect("OrderDetails.aspx?id=" + order.Id);
        }
    }
}