using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using lightbook_shared.Dtos.CategoryDtos;
using lightbook_shared.Dtos.AuthorBookDtos;

namespace lightbook_shared.Dtos.BookDtos
{
    public class BookDto
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Price { get; set; }
        public string Review { get; set; }
        public Nullable<double> RatePoint { get; set; }
        public string Picture { get; set; }
        public string Chapter {get;set;}
        public int CategoryID { get; set; }
        public CategoryDto Category {get;set;}
        public List<AuthorBookDto> AuthorBooks { get; set; }
    }
}