using System.Threading;
using System.Threading.Tasks;
using lightbook_backend_API.Interfaces;
using lightbook_shared;
using lightbook_shared.Dtos.CategoryDtos;
using Microsoft.AspNetCore.Mvc;

namespace lightbook_backend_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryService _categoryService;
        public CategoryController(ICategoryService categoryService){
            _categoryService = categoryService;
        }

        [HttpGet]
        public async Task<ActionResult<PagedResponseModel<CategoryDto>>> GetCategorys([FromQuery] CategoryQueryCriteria categoryQueryCriteria, CancellationToken cancellationToken){
            var response = await _categoryService.GetByPageAsync(categoryQueryCriteria, cancellationToken);

            return Ok(response);
        }
    }
}