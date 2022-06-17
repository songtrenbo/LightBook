using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using lightbook_backend_API.Model;
using lightbook_shared;
using lightbook_shared.Dtos.AuthorDtos;
using lightbook_shared.Dtos.BookDtos;

namespace lightbook_backend_API.Interfaces
{
    public interface IAuthorService
    {
        Task<PagedResponseModel<AuthorDto>> GetByPageAsync(
            AuthorQueryCriteria authorQueryCriteria,
            CancellationToken cancellationToken);
        Task<AuthorDto> PostAuthor(AuthorDto authorDto);
        Task<AuthorDto> PutAuthor(AuthorDto authorDto);
    }
}