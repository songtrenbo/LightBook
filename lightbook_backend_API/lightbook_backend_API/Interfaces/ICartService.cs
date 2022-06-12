using System.Collections.Generic;
using System.Threading.Tasks;
using lightbook_shared.Dtos.BookDtos;

namespace lightbook_backend_API.Interfaces
{
    public interface ICartService
    {
        Task<bool> SaveCart(List<BookDto> bookDtos, int userid);
    }
}