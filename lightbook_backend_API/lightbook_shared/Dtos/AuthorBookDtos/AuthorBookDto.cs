using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using lightbook_shared.Dtos.AuthorDtos;
using lightbook_shared.Dtos.BookDtos;

namespace lightbook_shared.Dtos.AuthorBookDtos
{
    public class AuthorBookDto
    {
        public int ID { get; set; }
        public int AuthorID { get; set; }
        public int BookID { get; set; }

        public AuthorDto Author { get; set; }
        public BookDto Book { get; set; }
    }
}