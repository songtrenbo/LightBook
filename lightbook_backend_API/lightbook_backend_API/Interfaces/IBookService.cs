using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using lightbook_shared;
using lightbook_shared.Dtos.BookDtos;

namespace lightbook_backend_API.Interfaces
{
    public interface IBookService
    {
        Task<PagedResponseModel<BookDto>> GetByPageAsync(
            BookQueryCriteria bookQueryCriteria,
            CancellationToken cancellationToken);
        Task<List<BookDto>> GetAll();
        Task<List<BookDto>> GetBookByCategoryId(int categoryId);
    }
}