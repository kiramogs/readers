using System;
using System.Linq;
using System.Web.UI.WebControls;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                SetActiveTab("profile");
                LoadProfile();
            }
        }

        private void SetActiveTab(string active)
        {
            string activeStyle = "background: #1a1a2e; color: #fff;";
            string inactiveStyle = "background: #e0dcd4; color: #555;";

            tabProfile.Attributes["style"] = (active == "profile" ? activeStyle : inactiveStyle) + " padding: 10px 24px; border-radius: 8px 8px 0 0; font-size: 14px; font-weight: 600; cursor: pointer; border: none;";
            tabOrders.Attributes["style"] = (active == "orders" ? activeStyle : inactiveStyle) + " padding: 10px 24px; border-radius: 8px 8px 0 0; font-size: 14px; font-weight: 600; cursor: pointer; border: none;";
            tabWishlist.Attributes["style"] = (active == "wishlist" ? activeStyle : inactiveStyle) + " padding: 10px 24px; border-radius: 8px 8px 0 0; font-size: 14px; font-weight: 600; cursor: pointer; border: none;";

            pnlProfile.Visible = active == "profile";
            pnlOrders.Visible = active == "orders";
            pnlWishlist.Visible = active == "wishlist";
        }

        private void LoadProfile()
        {
            string userName = Session["UserName"].ToString();
            var user = DataStore.Users.FirstOrDefault(u => u.UserName == userName);
            if (user != null)
            {
                lblUsername.Text = user.UserName;
                lblEmail.Text = user.Email;
            }
        }

        private void LoadOrders()
        {
            string userName = Session["UserName"].ToString();
            var orders = DataStore.Orders.Where(o => o.UserName == userName).OrderByDescending(o => o.OrderDate).ToList();

            if (orders.Count == 0)
            {
                pnlNoOrders.Visible = true;
            }
            else
            {
                pnlNoOrders.Visible = false;
                rptOrders.DataSource = orders;
                rptOrders.DataBind();
            }
        }

        private void LoadWishlist()
        {
            string userName = Session["UserName"].ToString();
            var wishlist = DataStore.WishlistItems.Where(w => w.UserName == userName).OrderByDescending(w => w.AddedAt).ToList();

            if (wishlist.Count == 0)
            {
                pnlNoWishlist.Visible = true;
            }
            else
            {
                pnlNoWishlist.Visible = false;
                rptWishlist.DataSource = wishlist;
                rptWishlist.DataBind();
            }
        }

        protected void tabProfile_Click(object sender, EventArgs e)
        {
            SetActiveTab("profile");
            LoadProfile();
        }

        protected void tabOrders_Click(object sender, EventArgs e)
        {
            SetActiveTab("orders");
            LoadOrders();
        }

        protected void tabWishlist_Click(object sender, EventArgs e)
        {
            SetActiveTab("wishlist");
            LoadWishlist();
        }

        protected void rptWishlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "RemoveWish")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                DataStore.WishlistItems.RemoveAll(w => w.Id == id);
                SetActiveTab("wishlist");
                LoadWishlist();
            }
        }
    }
}
