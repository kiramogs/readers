using System;
using System.Collections.Generic;
using System.Linq;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class BrowseBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlGenre.Items.Clear();
                ddlGenre.Items.Add(new System.Web.UI.WebControls.ListItem("All Genres", ""));
                foreach (var genre in DataStore.GetGenres())
                    ddlGenre.Items.Add(genre);

                BindBooks();
            }
        }

        private void BindBooks()
        {
            var books = DataStore.Books.AsEnumerable();
            string search = txtSearch.Text.Trim().ToLower();
            string genre = ddlGenre.SelectedValue;

            if (!string.IsNullOrEmpty(search))
                books = books.Where(b => b.Title.ToLower().Contains(search) || b.Author.ToLower().Contains(search));

            if (!string.IsNullOrEmpty(genre))
                books = books.Where(b => b.Genre == genre);

            var result = books.ToList();
            lblNoResults.Visible = result.Count == 0;
            rptBooks.DataSource = result;
            rptBooks.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindBooks();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlGenre.SelectedIndex = 0;
            BindBooks();
        }
    }
}
