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
            CreateMap<BookCreateDto, Book>()
                // .ForMember(des=>des.Name,opt=>opt.MapFrom(src=>src.Name))
                // .ForMember(des=>des.Price,opt=>opt.MapFrom(src=>src.Price))
                // .ForMember(des=>des.Review,opt=>opt.MapFrom(src=>src.Review))
                // .ForMember(des=>des.Picture,opt=>opt.MapFrom(src=>src.Picture))
                // .ForMember(des=>des.Chapter,opt=>opt.MapFrom(src=>src.Chapter))
                // .ForMember(des=>des.CategoryID,opt=>opt.MapFrom(src=>src.Chapter))
                // .ForMember(des=>des.AuthorBooks,opt=>opt.Ignore())
                .ReverseMap();
            CreateMap<Category,CategoryDto>().ReverseMap();
            CreateMap<Catalog,CatalogDto>().ReverseMap();
            CreateMap<Author,AuthorDto>().ReverseMap();
            CreateMap<AuthorBook,AuthorBookDto>().ReverseMap();
        }
        
    }
}