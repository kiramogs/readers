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
                lblOrderId.Text = order.Id.ToString();
                lblOrderDate.Text = order.OrderDate.ToString("dd MMM yyyy, hh:mm tt");
                lblStatus.Text = "Placed";

                rptOrderItems.DataSource = order.Items;
                rptOrderItems.DataBind();

                lblTotalItems.Text = order.Items.Sum(i => i.Quantity).ToString();
                lblTotal.Text = "Rs. " + order.TotalAmount;
                lblAddress.Text = order.DeliveryName + "<br/>" + order.DeliveryAddress;
            }
        }
    }
}