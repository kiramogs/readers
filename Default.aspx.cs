using System;
using System.Linq;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var featured = DataStore.Books.OrderBy(x => Guid.NewGuid()).Take(8).ToList();
                rptFeatured.DataSource = featured;
                rptFeatured.DataBind();
            }
        }
    }
}
