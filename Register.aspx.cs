using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string userName = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string confirm = txtConfirmPassword.Text;

            lblMessage.Visible = false;

            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#dc3545");
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.Visible = true;
                return;
            }

            if (password != confirm)
            {
                lblMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#dc3545");
                lblMessage.Text = "Passwords do not match.";
                lblMessage.Visible = true;
                return;
            }

            if (password.Length < 6)
            {
                lblMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#dc3545");
                lblMessage.Text = "Password must be at least 6 characters.";
                lblMessage.Visible = true;
                return;
            }

            if (DataStore.Users.Any(u => u.UserName == userName))
            {
                lblMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#dc3545");
                lblMessage.Text = "Username already exists.";
                lblMessage.Visible = true;
                return;
            }

            DataStore.Users.Add(new User
            {
                Id = DataStore.NextUserId(),
                UserName = userName,
                Email = email,
                PasswordHash = HashPassword(password)
            });

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Account created! You can now sign in.";
            lblMessage.Visible = true;
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