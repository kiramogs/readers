using System.Collections.Generic;
using System.Linq;

namespace OnlineBookStore.Models
{
    public static class DataStore
    {
        public static List<Book> Books { get; set; }
        public static List<User> Users { get; set; }
        public static List<Order> Orders { get; set; }
        public static List<WishlistItem> WishlistItems { get; set; }
        private static int _nextOrderId = 1;
        private static int _nextUserId = 1;
        private static int _nextWishlistId = 1;
        private static readonly object _lock = new object();

        public static int NextOrderId() { lock (_lock) return _nextOrderId++; }
        public static int NextUserId() { lock (_lock) return _nextUserId++; }
        public static int NextWishlistId() { lock (_lock) return _nextWishlistId++; }

        public static void Seed()
        {
            Users = new List<User>();
            Orders = new List<Order>();
            WishlistItems = new List<WishlistItem>();

            Books = new List<Book>
            {
                // ── 13. THE SUN IS ALSO A STAR ─────────────────────────────
                new Book { Id = 13, Title = "The Sun Is Also a Star", Author = "Nicola Yoon", Genre = "Romance", Price = 329, Description = "Natasha believes in science and facts. Daniel believes in dreams and destiny. On one fateful day in New York City, they meet — and everything changes.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780553496710-L.jpg", ISBN = "978-0553496710" },

                // ── 14–15. ROMANCE ─────────────────────────────────────────
                new Book { Id = 14, Title = "The American Roommate Experiment", Author = "Elena Armas", Genre = "Romance", Price = 349, Description = "Rosie is in desperate need of a place to stay when an apartment swap leads her to Lucas — a best-selling author with a disarming smile.", ImageUrl = "https://covers.openlibrary.org/b/id/12879041-L.jpg", ISBN = "978-1668002735" },
                new Book { Id = 15, Title = "The Spanish Love Deception", Author = "Elena Armas", Genre = "Romance", Price = 349, Description = "Catalina needs a fake boyfriend to attend a family wedding in Spain, and her nemesis at work volunteers for the job.", ImageUrl = "https://covers.openlibrary.org/b/id/14425253-L.jpg", ISBN = "978-1668002513" },

                // ── 16. MARKETING ──────────────────────────────────────────
                new Book { Id = 16, Title = "The 22 Immutable Laws of Marketing", Author = "Al Ries & Jack Trout", Genre = "Non-Fiction", Price = 399, Description = "A definitive guide to the fundamental rules of marketing.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780887306662-L.jpg", ISBN = "978-0887306662" },

                // ── 17. CRUEL WINTER WITH YOU ──────────────────────────────
                new Book { Id = 17, Title = "Cruel Winter with You", Author = "Ali Hazelwood", Genre = "Romance", Price = 299, Description = "A wintery romance about two people thrown together by circumstance.", ImageUrl = "https://covers.openlibrary.org/b/id/15154444-L.jpg", ISBN = "978-0593550748" },

                // ── 18. BHAGAVAD GITA ──────────────────────────────────────
                new Book { Id = 18, Title = "Bhagavad Gita", Author = "Vyasa (Translation: Eknath Easwaran)", Genre = "Spirituality", Price = 249, Description = "The timeless Hindu scripture on duty, righteousness, and the nature of reality.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9781586380199-L.jpg", ISBN = "978-1586380199" },

                // ── 19. DOPAMINE DETOX ─────────────────────────────────────
                new Book { Id = 19, Title = "Dopamine Detox", Author = "Thibaut Meurisse", Genre = "Self-Help", Price = 299, Description = "A practical guide to overcoming dopamine-driven distractions.", ImageUrl = "https://covers.openlibrary.org/b/id/15089568-L.jpg", ISBN = "979-8648598584" },

                // ── 20. THE FINE PRINT ─────────────────────────────────────
                new Book { Id = 20, Title = "The Fine Print", Author = "Lauren Asher", Genre = "Romance", Price = 329, Description = "Rowan Kane is sent to Dreamland theme park. But falling for a park employee was never part of the plan.", ImageUrl = "https://covers.openlibrary.org/b/id/14319054-L.jpg", ISBN = "978-1728272900" },

                // ── 21. STEPHEN HAWKING ─────────────────────────────────────
                new Book { Id = 21, Title = "Black Holes: The Reith Lectures", Author = "Stephen Hawking", Genre = "Non-Fiction", Price = 199, Description = "Hawking's lectures on black holes, exploring their nature and the paradoxes they present.", ImageUrl = "https://covers.openlibrary.org/b/id/10966683-L.jpg", ISBN = "978-0857503572" },

                // ── 22. BEFORE THE COFFEE GETS COLD ────────────────────────
                new Book { Id = 22, Title = "Before the Coffee Gets Cold", Author = "Toshikazu Kawaguchi", Genre = "Fiction", Price = 349, Description = "In a small Tokyo cafe, visitors can travel back in time but only while their coffee stays warm.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9781335430991-L.jpg", ISBN = "978-1335430991" },

                // ── 23. SHANTARAM ──────────────────────────────────────────
                new Book { Id = 23, Title = "Shantaram", Author = "Gregory David Roberts", Genre = "Fiction", Price = 499, Description = "An escaped convict finds a new life in the teeming streets of Bombay.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780312330521-L.jpg", ISBN = "978-0312330521" },

                // ── 24–25. EMILY WILDE — Heather Fawcett ───────────────────
                new Book { Id = 24, Title = "Emily Wilde's Encyclopaedia of Faeries", Author = "Heather Fawcett", Genre = "Fantasy", Price = 399, Description = "Cambridge professor Emily Wilde travels to a remote Scandinavian village to complete her encyclopaedia.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780593500132-L.jpg", ISBN = "978-0593500132" },
                new Book { Id = 25, Title = "Emily Wilde's Map of the Otherlands", Author = "Heather Fawcett", Genre = "Fantasy", Price = 399, Description = "Emily Wilde embarks on a perilous journey through the Otherlands.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780593500156-L.jpg", ISBN = "978-0593500156" },

                // ── 26–28. BUSINESS & PSYCHOLOGY ────────────────────────────
                new Book { Id = 26, Title = "The Decision Book", Author = "Mikael Krogerus & Roman Tschappeler", Genre = "Non-Fiction", Price = 299, Description = "Fifty models for strategic thinking.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780393079616-L.jpg", ISBN = "978-0393079616" },
                new Book { Id = 27, Title = "The 80/20 Principle", Author = "Richard Koch", Genre = "Non-Fiction", Price = 399, Description = "How achieving more with less has become the cornerstone philosophy for productivity.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780385491747-L.jpg", ISBN = "978-0385491747" },
                new Book { Id = 28, Title = "The Psychology of Money", Author = "Morgan Housel", Genre = "Non-Fiction", Price = 349, Description = "Nineteen short stories exploring how people think about money.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780857197689-L.jpg", ISBN = "978-0857197689" },

                // ── 29. PUNK 57 ────────────────────────────────────────────
                new Book { Id = 29, Title = "Punk 57", Author = "Penelope Douglas", Genre = "Romance", Price = 329, Description = "Misha and Ryen have been pen pals since they were kids but have never met.", ImageUrl = "https://covers.openlibrary.org/b/id/10107803-L.jpg", ISBN = "978-0988413870" },

                // ── 30–32. THE CRUEL PRINCE — Holly Black ──────────────────
                new Book { Id = 30, Title = "The Cruel Prince", Author = "Holly Black", Genre = "Fantasy", Price = 379, Description = "Jude must fight for her place among the treacherous High Court of Faerie.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780316310277-L.jpg", ISBN = "978-0316310277" },
                new Book { Id = 31, Title = "The Wicked King", Author = "Holly Black", Genre = "Fantasy", Price = 379, Description = "Jude has bound Cardan to her will. But Faerie is on the brink of war.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780316310352-L.jpg", ISBN = "978-0316310352" },
                new Book { Id = 32, Title = "The Queen of Nothing", Author = "Holly Black", Genre = "Fantasy", Price = 379, Description = "Exiled from Faerie, Jude returns for a final confrontation with Cardan.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780316310420-L.jpg", ISBN = "978-0316310420" },

                // ── 33–36. THE INHERITANCE GAMES — Jennifer Lynn Barnes ────
                new Book { Id = 33, Title = "The Inheritance Games", Author = "Jennifer Lynn Barnes", Genre = "Mystery", Price = 349, Description = "Avery Grambs is a nobody — until a billionaire dies and leaves her his fortune.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780759555402-L.jpg", ISBN = "978-0759555402" },
                new Book { Id = 34, Title = "The Hawthorne Legacy", Author = "Jennifer Lynn Barnes", Genre = "Mystery", Price = 349, Description = "Avery uncovers deeper Hawthorne family secrets.", ImageUrl = "https://covers.openlibrary.org/b/id/10703547-L.jpg", ISBN = "978-0759555440" },
                new Book { Id = 35, Title = "The Final Gambit", Author = "Jennifer Lynn Barnes", Genre = "Mystery", Price = 349, Description = "Someone from the Hawthorne past has resurfaced with a vengeance.", ImageUrl = "https://covers.openlibrary.org/b/id/13217735-L.jpg", ISBN = "978-0759555488" },
                new Book { Id = 36, Title = "The Brothers Hawthorne", Author = "Jennifer Lynn Barnes", Genre = "Mystery", Price = 379, Description = "Grayson and Jameson Hawthorne each face their own impossible challenges.", ImageUrl = "https://covers.openlibrary.org/b/id/13234588-L.jpg", ISBN = "978-0316136617" },

                // ── 37. LITTLE WOMEN ───────────────────────────────────────
                new Book { Id = 37, Title = "Little Women", Author = "Louisa May Alcott", Genre = "Classic", Price = 249, Description = "The March sisters — Meg, Jo, Beth, and Amy — growing up during the Civil War.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780147514011-L.jpg", ISBN = "978-0147514011" },

                // ── 38. A ROOM OF ONE'S OWN ────────────────────────────────
                new Book { Id = 38, Title = "A Room of One's Own", Author = "Virginia Woolf", Genre = "Classic", Price = 199, Description = "Woolf's landmark essay on women, fiction, and intellectual freedom.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780156787338-L.jpg", ISBN = "978-0156787338" },

                // ── 39–41. RUSKIN BOND ──────────────────────────────────────
                new Book { Id = 39, Title = "The Blue Umbrella", Author = "Ruskin Bond", Genre = "Fiction", Price = 149, Description = "A girl in the Himalayas acquires a beautiful blue umbrella that becomes the envy of her village.", ImageUrl = "https://covers.openlibrary.org/b/id/10389985-L.jpg", ISBN = "978-8171674510" },
                new Book { Id = 40, Title = "The Room on the Roof", Author = "Ruskin Bond", Genre = "Fiction", Price = 179, Description = "Rusty, a young orphan, discovers life, love, and friendship in Dehra Dun.", ImageUrl = "https://covers.openlibrary.org/b/id/6763274-L.jpg", ISBN = "978-0140116830" },
                new Book { Id = 41, Title = "A Flight of Pigeons", Author = "Ruskin Bond", Genre = "Fiction", Price = 179, Description = "Set during the 1857 Indian uprising, a British family seeks refuge.", ImageUrl = "https://covers.openlibrary.org/b/id/2546960-L.jpg", ISBN = "978-0143063124" },

                // ── 42. MRS. DALLOWAY ──────────────────────────────────────
                new Book { Id = 42, Title = "Mrs. Dalloway", Author = "Virginia Woolf", Genre = "Classic", Price = 229, Description = "A single day in the life of Clarissa Dalloway as she prepares for a party.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780156628709-L.jpg", ISBN = "978-0156628709" },

                // ── 43. TO THE LIGHTHOUSE ──────────────────────────────────
                new Book { Id = 43, Title = "To the Lighthouse", Author = "Virginia Woolf", Genre = "Classic", Price = 229, Description = "A modernist masterpiece centered on the Ramsay family.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780156907392-L.jpg", ISBN = "978-0156907392" },

                // ── 44. TOMORROW, AND TOMORROW, AND TOMORROW ───────────────
                new Book { Id = 44, Title = "Tomorrow, and Tomorrow, and Tomorrow", Author = "Gabrielle Zevin", Genre = "Fiction", Price = 399, Description = "Two friends find their way back to each other through video game design.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780593321201-L.jpg", ISBN = "978-0593321201" },

                // ── 45–51. HARRY POTTER — J.K. Rowling ─────────────────────
                new Book { Id = 45, Title = "Harry Potter and the Philosopher's Stone", Author = "J.K. Rowling", Genre = "Fantasy", Price = 399, Description = "Harry discovers he is a wizard on his eleventh birthday.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780747532743-L.jpg", ISBN = "978-0747532743" },
                new Book { Id = 46, Title = "Harry Potter and the Chamber of Secrets", Author = "J.K. Rowling", Genre = "Fantasy", Price = 399, Description = "Harry returns to Hogwarts where a mysterious force is petrifying students.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780747538493-L.jpg", ISBN = "978-0747538493" },
                new Book { Id = 47, Title = "Harry Potter and the Prisoner of Azkaban", Author = "J.K. Rowling", Genre = "Fantasy", Price = 429, Description = "An escaped prisoner threatens Hogwarts.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780747542155-L.jpg", ISBN = "978-0747542155" },
                new Book { Id = 48, Title = "Harry Potter and the Goblet of Fire", Author = "J.K. Rowling", Genre = "Fantasy", Price = 449, Description = "Harry is entered into the dangerous Triwizard Tournament.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780747546245-L.jpg", ISBN = "978-0747546245" },
                new Book { Id = 49, Title = "Harry Potter and the Order of the Phoenix", Author = "J.K. Rowling", Genre = "Fantasy", Price = 499, Description = "Harry battles the Ministry's denial of Voldemort's return.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780747551003-L.jpg", ISBN = "978-0747551003" },
                new Book { Id = 50, Title = "Harry Potter and the Half-Blood Prince", Author = "J.K. Rowling", Genre = "Fantasy", Price = 479, Description = "Harry discovers a mysterious textbook and Voldemort's Horcruxes.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780747581086-L.jpg", ISBN = "978-0747581086" },
                new Book { Id = 51, Title = "Harry Potter and the Deathly Hallows", Author = "J.K. Rowling", Genre = "Fantasy", Price = 499, Description = "Harry, Ron, and Hermione embark on a quest to destroy Voldemort's Horcruxes.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780747591054-L.jpg", ISBN = "978-0747591054" },

                // ── 52–55. HUNGER GAMES — Suzanne Collins ──────────────────
                new Book { Id = 52, Title = "The Hunger Games", Author = "Suzanne Collins", Genre = "Dystopian", Price = 349, Description = "Katniss Everdeen volunteers to take her sister's place in a televised fight to the death.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780439023481-L.jpg", ISBN = "978-0439023481" },
                new Book { Id = 53, Title = "Catching Fire", Author = "Suzanne Collins", Genre = "Dystopian", Price = 349, Description = "Katniss becomes the symbol of a growing rebellion.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780439023498-L.jpg", ISBN = "978-0439023498" },
                new Book { Id = 54, Title = "Mockingjay", Author = "Suzanne Collins", Genre = "Dystopian", Price = 349, Description = "Katniss must decide who she can trust as the revolution reaches its climax.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780439023511-L.jpg", ISBN = "978-0439023511" },
                new Book { Id = 55, Title = "The Ballad of Songbirds and Snakes", Author = "Suzanne Collins", Genre = "Dystopian", Price = 399, Description = "A prequel revealing the origins of Coriolanus Snow.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9781338635171-L.jpg", ISBN = "978-1338635171" },

                // ── 56–58. DUNE — Frank Herbert ────────────────────────────
                new Book { Id = 56, Title = "Dune", Author = "Frank Herbert", Genre = "Science Fiction", Price = 459, Description = "The story of young Paul Atreides on the desert planet Arrakis.", ImageUrl = "https://covers.openlibrary.org/b/id/12467702-L.jpg", ISBN = "978-0441013593" },
                new Book { Id = 57, Title = "Dune Messiah", Author = "Frank Herbert", Genre = "Science Fiction", Price = 399, Description = "Paul Atreides rules as Emperor but is caught in political conspiracies.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780441172696-L.jpg", ISBN = "978-0441172696" },
                new Book { Id = 58, Title = "Children of Dune", Author = "Frank Herbert", Genre = "Science Fiction", Price = 399, Description = "The twin children of Paul Atreides face tremendous challenges on Arrakis.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780441104024-L.jpg", ISBN = "978-0441104024" },

                // ── 59–60. A COURT OF THORNS AND ROSES — Sarah J. Maas ─────
                new Book { Id = 59, Title = "A Court of Thorns and Roses", Author = "Sarah J. Maas", Genre = "Fantasy", Price = 399, Description = "Feyre is a huntress drawn into the magical land of the Fae.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9781635575552-L.jpg", ISBN = "978-1635575552" },
                new Book { Id = 60, Title = "A Court of Mist and Fury", Author = "Sarah J. Maas", Genre = "Fantasy", Price = 429, Description = "Feyre navigates a world of magic, politics, and love in the Night Court.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9781635575576-L.jpg", ISBN = "978-1635575576" },

                // ── 61–65. CLASSICS ────────────────────────────────────────
                new Book { Id = 61, Title = "Jane Eyre", Author = "Charlotte Bronte", Genre = "Classic", Price = 229, Description = "An orphaned governess falls in love with her mysterious employer, Mr. Rochester.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780141441146-L.jpg", ISBN = "978-0141441146" },
                new Book { Id = 62, Title = "Wuthering Heights", Author = "Emily Bronte", Genre = "Classic", Price = 219, Description = "A tale of passionate and destructive love on the Yorkshire moors.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780141439556-L.jpg", ISBN = "978-0141439556" },
                new Book { Id = 63, Title = "Great Expectations", Author = "Charles Dickens", Genre = "Classic", Price = 239, Description = "Pip's journey from humble origins to gentleman in Victorian England.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780141439563-L.jpg", ISBN = "978-0141439563" },
                new Book { Id = 64, Title = "The Picture of Dorian Gray", Author = "Oscar Wilde", Genre = "Classic", Price = 209, Description = "A young man's portrait ages while he remains beautiful, hiding his sins.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780141439570-L.jpg", ISBN = "978-0141439570" },
                new Book { Id = 65, Title = "Sense and Sensibility", Author = "Jane Austen", Genre = "Classic", Price = 219, Description = "The Dashwood sisters navigate love, heartbreak, and society.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780141439662-L.jpg", ISBN = "978-0141439662" },

                // ── 66. PERCY JACKSON ──────────────────────────────────────
                new Book { Id = 66, Title = "Percy Jackson and the Lightning Thief", Author = "Rick Riordan", Genre = "Fantasy", Price = 349, Description = "Percy discovers he's a demigod and must retrieve Zeus's stolen lightning bolt.", ImageUrl = "https://covers.openlibrary.org/b/isbn/9780786838653-L.jpg", ISBN = "978-0786838653" }
            };
        }

        public static List<string> GetGenres()
        {
            return Books.Select(b => b.Genre).Distinct().OrderBy(g => g).ToList();
        }
    }
}

