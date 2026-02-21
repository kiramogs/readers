using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class CartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            var cart = Session["Cart"] as List<CartItem>;
            if (cart == null || cart.Count == 0)
            {
                pnlEmptyCart.Visible = true;
                pnlCartContent.Visible = false;
                return;
            }

            pnlEmptyCart.Visible = false;
            pnlCartContent.Visible = true;

            rptCart.DataSource = cart;
            rptCart.DataBind();

            lblItemCount.Text = cart.Sum(c => c.Quantity).ToString();
            lblTotal.Text = "Rs. " + cart.Sum(c => c.Price * c.Quantity);
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int bookId = int.Parse(e.CommandArgument.ToString());
                var cart = Session["Cart"] as List<CartItem>;
                if (cart != null)
                {
                    cart.RemoveAll(c => c.BookId == bookId);
                    Session["Cart"] = cart;
                }

                BindCart();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Session["Cart"] = new List<CartItem>();
            BindCart();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            Response.Redirect("Checkout.aspx");
        }
    }
}