using AutoMapper;
using lightbook_backend_API.Model;
using lightbook_shared.Dtos.BookDtos;
using lightbook_shared.Dtos.CatalogDtos;
using lightbook_shared.Dtos.CategoryDtos;
using lightbook_shared.Dtos.AuthorDtos;
using lightbook_shared.Dtos.AuthorBookDtos;

namespace lightbook_backend_API.Data.Mapping
{
    public class AutoMapperProfile: Profile
    {
        public AutoMapperProfile(){
            CreateMap<Book, BookDto>().ReverseMap();
            CreateMap<Category,CategoryDto>().ReverseMap();
            CreateMap<Catalog,CatalogDto>().ReverseMap();
            CreateMap<Author,AuthorDto>().ReverseMap();
            CreateMap<AuthorBook,AuthorBookDto>().ReverseMap();
        }
        
    }
}