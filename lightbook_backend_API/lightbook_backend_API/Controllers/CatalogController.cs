using System.Threading;
using System.Threading.Tasks;
using lightbook_backend_API.Interfaces;
using lightbook_shared;
using lightbook_shared.Dtos.CatalogDtos;
using Microsoft.AspNetCore.Mvc;

namespace lightbook_backend_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CatalogController : ControllerBase
    {
        private readonly ICatalogService _catalogService;
        public CatalogController(ICatalogService catalogService){
            _catalogService = catalogService;
        }

        [HttpGet]
        public async Task<ActionResult<PagedResponseModel<CatalogDto>>> GetCatalogs([FromQuery] CatalogQueryCriteria catalogQueryCriteria, CancellationToken cancellationToken){
            var response = await _catalogService.GetByPageAsync(catalogQueryCriteria, cancellationToken);

            return Ok(response);
        }
    }
}