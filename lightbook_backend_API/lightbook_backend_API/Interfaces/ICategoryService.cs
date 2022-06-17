using System.Threading;
using System.Threading.Tasks;
using lightbook_shared;
using lightbook_shared.Dtos.CategoryDtos;

namespace lightbook_backend_API.Interfaces
{
    public interface ICategoryService
    {
        Task<PagedResponseModel<CategoryDto>> GetByPageAsync(
            CategoryQueryCriteria categoryQueryCriteria,
            CancellationToken cancellationToken);
        Task<CategoryDto> PostCategory(CategoryDto categoryDto);
        Task<CategoryDto> PutCategory(CategoryDto categoryDto);

    }
}