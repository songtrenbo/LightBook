using System.Threading;
using System.Threading.Tasks;
using lightbook_backend_API.Interfaces;
using lightbook_shared;
using lightbook_shared.Dtos.CategoryDtos;
using Microsoft.AspNetCore.Authorization;
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
        public async Task<ActionResult<PagedResponseModel<CategoryDto>>> GetCategories([FromQuery] CategoryQueryCriteria categoryQueryCriteria, CancellationToken cancellationToken){
            var response = await _categoryService.GetByPageAsync(categoryQueryCriteria, cancellationToken);

            return Ok(response);
        }
        [HttpPost]
        [Authorize(Roles="Admin")]
        public async Task<ActionResult> CreateCategory([FromBody]CategoryDto categoryDto){
            if(categoryDto ==null){
                return BadRequest();
            }
            else {
                var createCategory = await _categoryService.PostCategory(categoryDto);
                if(createCategory==null){
                    return BadRequest();
                }
                return Ok(createCategory);
            }
        }
        [HttpPut]
        [Authorize(Roles="Admin")]
        public async Task<ActionResult> EditCategory([FromBody]CategoryDto categoryDto){
            if(categoryDto ==null){
                return BadRequest();
            }
            else {
                var createCategory = await _categoryService.PutCategory(categoryDto);
                if(createCategory==null){
                    return BadRequest();
                }
                return Ok(createCategory);
            }
        }
    }
}