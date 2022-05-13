using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace lightbook_shared.Dtos.BookDtos
{
    public class BookDto
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Price { get; set; }
        public string Review { get; set; }
        public Nullable<int> Pages { get; set; }
        public string Picture { get; set; }
        public string Chapter {get;set;}
        public int CategoryID { get; set; }
        public CategoryDto Category {get;set;}
    }
}