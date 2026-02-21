using System;
using System.Web;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public class Global : HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            DataStore.Seed();
        }
    }
}
