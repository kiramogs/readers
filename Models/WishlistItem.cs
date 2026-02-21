using System;

namespace OnlineBookStore.Models
{
    public class WishlistItem
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public int BookId { get; set; }
        public string BookTitle { get; set; }
        public string BookAuthor { get; set; }
        public decimal BookPrice { get; set; }
        public string BookImageUrl { get; set; }
        public DateTime AddedAt { get; set; }

        public WishlistItem()
        {
            AddedAt = DateTime.Now;
        }
    }
}
