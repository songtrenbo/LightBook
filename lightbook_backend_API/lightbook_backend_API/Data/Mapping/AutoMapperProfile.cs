using AutoMapper;
using lightbook_backend_API.Model;
using lightbook_shared.Dtos.BookDtos;

namespace lightbook_backend_API.Data.Mapping
{
    public class AutoMapperProfile: Profile
    {
        public AutoMapperProfile(){
            CreateMap<Book, BookDto>().ReverseMap();
                // .ForMember(src => src.Picture,
                //            opts => opts
                //                     .MapFrom(src => ImageHelper
                //                                         .GetFileUrl(src.Image)
                //                                     ));  
            CreateMap<Category,CategoryDto>().ReverseMap();
        }
        
    }
}