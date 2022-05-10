﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class Category
    {
        public int ID { get; set; }
        public string Name { get; set; }

        public List<Book> Books { get; set; }
    }
}
