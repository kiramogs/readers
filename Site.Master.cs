using System;
using System.Collections.Generic;
using System.Web.UI;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Update cart count
            var cart = Session["Cart"] as List<CartItem>;
            lblCartCount.Text = cart != null ? cart.Count.ToString() : "0";

            // Update login/logout panels
            if (Session["UserName"] != null)
            {
                pnlLoggedIn.Visible = true;
                pnlLoggedOut.Visible = false;
                lblUser.Text = "Hello, " + Session["UserName"].ToString();
            }
            else
            {
                pnlLoggedIn.Visible = false;
                pnlLoggedOut.Visible = true;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}
