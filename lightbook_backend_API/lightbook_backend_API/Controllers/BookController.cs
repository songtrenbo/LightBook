using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using lightbook_backend_API.Interfaces;
using lightbook_backend_API.Model;
using lightbook_shared;
using lightbook_shared.Dtos.BookDtos;
using Microsoft.AspNetCore.Authorization;
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
        public async Task<ActionResult<PagedResponseModel<BookDto>>> GetBooks([FromQuery] BookQueryCriteria bookQueryCriteria, CancellationToken cancellationToken)
        {
            var response = await _bookService.GetByPageAsync(bookQueryCriteria, cancellationToken);

            return Ok(response);
        }

        [HttpGet("library")]
        [Authorize]
        public async Task<ActionResult<List<BookUser>>> GetBooksLibrary(int userid)
        {
            var response = await _bookService.GetBooksLibrary(userid);

            return Ok(response);
        }

        [HttpPost("{bookId}")]
        [Authorize]
        public async Task<ActionResult<BookUser>> AddBookFreeToLibrary(int bookId, int userid)
        {
            var response = await _bookService.AddBookFreeToLibrary(bookId, userid);

            return Ok(response);
        }

        [HttpGet("all")]
        public async Task<ActionResult<PagedResponseModel<BookDto>>> GetAllBooks()
        {
            var response = await _bookService.GetAll();

            return Ok(response);
        }

        [HttpGet("category/{categoryId}")]
        public async Task<ActionResult<PagedResponseModel<BookDto>>> GetBookByCategoryId(int categoryId)
        {
            var response = await _bookService.GetBookByCategoryId(categoryId);

            return Ok(response);
        }

    }
}