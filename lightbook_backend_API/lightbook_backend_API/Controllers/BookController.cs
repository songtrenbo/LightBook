using System.Threading;
using System.Threading.Tasks;
using lightbook_backend_API.Interfaces;
using lightbook_shared;
using lightbook_shared.Dtos.BookDtos;
using Microsoft.AspNetCore.Mvc;

namespace lightbook_backend_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        private readonly IBookService _bookService;
        public BookController(IBookService bookService){
            _bookService = bookService;
        }

        [HttpGet]
        public async Task<ActionResult<PagedResponseModel<BookDto>>> GetBooks([FromQuery] BookQueryCriteria bookQueryCriteria, CancellationToken cancellationToken){
            var response = await _bookService.GetByPageAsync(bookQueryCriteria, cancellationToken);

            return Ok(response);
        }
    }
}