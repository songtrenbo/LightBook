using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using lightbook_backend_API.Model;
using lightbook_shared;
using lightbook_shared.Dtos.BookDtos;

namespace lightbook_backend_API.Interfaces
{
    public interface IBookService
    {
        Task<PagedResponseModel<BookDto>> GetByPageAsync(
            BookQueryCriteria bookQueryCriteria,
            CancellationToken cancellationToken);
        Task<List<BookUser>> GetBooksLibrary(int userid);
        Task<List<BookDto>> GetAll();
        Task<List<BookDto>> GetBookByCategoryId(int categoryId);
        Task<BookUser> AddBookFreeToLibrary(int bookId, int userid);
        Task<BookDto> CreateBook(BookCreateDto bookCreateDto);
        Task<BookDto> EditBook(BookCreateDto bookCreateDto);

    }
}