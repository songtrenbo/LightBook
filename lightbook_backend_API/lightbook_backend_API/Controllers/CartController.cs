using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using lightbook_backend_API.Interfaces;
using lightbook_shared;
using lightbook_shared.Dtos.BookDtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace lightbook_backend_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CartController : ControllerBase
    {
        private readonly ICartService _cartService;
        public CartController(ICartService cartService)
        {
            _cartService = cartService;
        }

        [HttpPost]
        public async Task<ActionResult> GetBooks([FromBody] List<BookDto> bookDtos, int userid)
        {
            var response = _cartService.SaveCart(bookDtos, userid);

            return Ok(true);
        }
    }
}