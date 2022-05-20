using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace lightbook_shared.Dtos.CatalogDtos
{
    public class CatalogDto
    {
        public int ID { get; set; }
        public string Name { get; set; }
    }
}