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
    [Authorize]
    public class CartController : ControllerBase
    {
        private readonly ICartService _cartService;
        public CartController(ICartService cartService)
        {
            _cartService = cartService;
        }

        [HttpPost]
        public async Task<ActionResult> Payment([FromBody] List<BookDto> bookDtos, int userid)
        {
            var response = _cartService.SaveCart(bookDtos, userid);

            return Ok(response);
        }
        [HttpGet("cart")]
        [Authorize]
        public async Task<ActionResult<List<Cart>>> GetCartByUserId(int userid)
        {
            var response = await _cartService.GetCartByUserId(userid);

            return Ok(response);
        }
        [HttpGet("cartDetail")]
        [Authorize]
        public async Task<ActionResult<List<CartDetail>>> GetCartDetailByCartId(int cartId, int userid)
        {
            var response = await _cartService.GetCartDetailByCartId(cartId, userid);

            return Ok(response);
        }
    }
}