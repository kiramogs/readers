using System;
using System.Collections.Generic;
using System.Linq;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class CheckoutPage : System.Web.UI.Page
    {
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
                rptSummary.DataSource = cart;
                rptSummary.DataBind();
                lblTotal.Text = "₹" + cart.Sum(c => c.Price * c.Quantity);
            }
        }

        protected void btnPlace_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string address = txtAddress.Text.Trim();
            string phone = txtPhone.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(address) || string.IsNullOrEmpty(phone))
            {
                lblError.Text = "Please fill in all delivery details.";
                lblError.Visible = true;
                return;
            }

            var cart = Session["Cart"] as List<CartItem>;
            if (cart == null || cart.Count == 0) return;

            var order = new Order
            {
                Id = DataStore.NextOrderId(),
                UserName = Session["UserName"].ToString(),
                DeliveryName = name,
                DeliveryAddress = address,
                DeliveryPhone = phone,
                TotalAmount = cart.Sum(c => c.Price * c.Quantity)
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
