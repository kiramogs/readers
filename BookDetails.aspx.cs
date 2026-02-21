using System;
using System.Collections.Generic;
using System.Linq;
using OnlineBookStore.Models;

namespace OnlineBookStore
{
    public partial class BookDetailsPage : System.Web.UI.Page
    {
        private Book currentBook;

        protected void Page_Load(object sender, EventArgs e)
        {
            int id;
            if (!int.TryParse(Request.QueryString["id"], out id))
            {
                Response.Redirect("BrowseBooks.aspx");
                return;
            }

            currentBook = DataStore.Books.FirstOrDefault(b => b.Id == id);
            if (currentBook == null)
            {
                Response.Redirect("BrowseBooks.aspx");
                return;
            }

            if (!IsPostBack)
            {
                imgBookCover.ImageUrl = currentBook.ImageUrl;
                lblTitle.Text = currentBook.Title;
                lblAuthor.Text = "by " + currentBook.Author;
                lblGenre.Text = currentBook.Genre;
                lblPrice.Text = "Rs. " + currentBook.Price;
                lblDescription.Text = currentBook.Description;
                lblISBN.Text = "ISBN: " + currentBook.ISBN;
                Page.Title = currentBook.Title + " - Readers";
            }
        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            var cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            var existing = cart.FirstOrDefault(c => c.BookId == currentBook.Id);
            if (existing != null)
            {
                existing.Quantity++;
            }
            else
            {
                cart.Add(new CartItem
                {
                    BookId = currentBook.Id,
                    BookTitle = currentBook.Title,
                    Price = currentBook.Price,
                    Quantity = 1,
                    ImageUrl = currentBook.ImageUrl
                });
            }

            Session["Cart"] = cart;
            lblMessage.Text = "Added to cart!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Visible = true;
        }

        protected void btnWishlist_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string userName = Session["UserName"].ToString();
            bool alreadyExists = DataStore.WishlistItems.Any(w => w.UserName == userName && w.BookId == currentBook.Id);

            if (!alreadyExists)
            {
                DataStore.WishlistItems.Add(new WishlistItem
                {
                    Id = DataStore.NextWishlistId(),
                    UserName = userName,
                    BookId = currentBook.Id,
                    BookTitle = currentBook.Title,
                    BookAuthor = currentBook.Author,
                    BookPrice = currentBook.Price,
                    BookImageUrl = currentBook.ImageUrl
                });

                lblMessage.Text = "Added to wishlist!";
                lblMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#c45b3e");
            }
            else
            {
                lblMessage.Text = "Already in your wishlist";
                lblMessage.ForeColor = System.Drawing.Color.Gray;
            }

            lblMessage.Visible = true;
        }
    }
}