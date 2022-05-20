using System.Threading;
using System.Threading.Tasks;
using lightbook_shared;
using lightbook_shared.Dtos.CatalogDtos;

namespace lightbook_backend_API.Interfaces
{
    public interface ICatalogService
    {
        Task<PagedResponseModel<CatalogDto>> GetByPageAsync(
            CatalogQueryCriteria catalogQueryCriteria,
            CancellationToken cancellationToken);
    }
}