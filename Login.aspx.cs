using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.Visible = true;
                return;
            }

            string hash = HashPassword(password);
            var user = DataStore.Users.FirstOrDefault(u => u.UserName == userName && u.PasswordHash == hash);

            if (user != null)
            {
                Session["UserName"] = user.UserName;
                Session["UserId"] = user.Id;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
                lblMessage.Visible = true;
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder sb = new StringBuilder();
                foreach (byte b in bytes)
                {
                    sb.Append(b.ToString("x2"));
                }

                return sb.ToString();
            }
        }
    }
}