using System;
using System.Linq;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class OrderDetailsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int id;
            if (!int.TryParse(Request.QueryString["id"], out id))
            {
                Response.Redirect("Profile.aspx");
                return;
            }

            var order = DataStore.Orders.FirstOrDefault(o => o.Id == id && o.UserName == Session["UserName"].ToString());
            if (order == null)
            {
                Response.Redirect("Profile.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblOrderId.Text = "Order #" + order.Id;
                rptItems.DataSource = order.Items;
                rptItems.DataBind();
                lblTotal.Text = "₹" + order.TotalAmount;
                lblName.Text = order.DeliveryName;
                lblAddress.Text = order.DeliveryAddress;
                lblPhone.Text = order.DeliveryPhone;
                lblDate.Text = order.OrderDate.ToString("dd MMM yyyy, hh:mm tt");
            }
        }
    }
}
