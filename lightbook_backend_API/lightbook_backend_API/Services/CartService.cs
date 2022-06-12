using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using lightbook_backend_API.Interfaces;
using lightbook_backend_API.Model;
using lightbook_shared.Dtos.BookDtos;

namespace lightbook_backend_API.Services
{
    public class CartService : ICartService
    {
        private readonly IBaseRepository<Cart> _cartRepository;
        private readonly IBaseRepository<CartDetail> _cartDetailRepository;
        private readonly IBaseRepository<Book> _bookRepository;
        private readonly IMapper _mapper;
        public CartService(
            IBaseRepository<Cart> cartRepository,
            IBaseRepository<CartDetail> cartDetailRepository,
            IBaseRepository<Book> bookRepository,
            IMapper mapper
        )
        {
            _cartRepository = cartRepository;
            _cartDetailRepository = cartDetailRepository;
            _bookRepository = bookRepository;
            _mapper = mapper;
        }

        public async Task<bool> SaveCart(List<BookDto> bookDtos, int userid)
        {
            var totalPrice = 0;
            foreach (var item in bookDtos)
            {
                totalPrice += item.Price;
            }
            var newCart = new Cart()
            {
                UserID = userid,
                TotalPrice = totalPrice,
            };
            await _cartRepository.Add(newCart);

            foreach (var item in bookDtos)
            {
                var newCartDetail = new CartDetail()
                {
                    CartID = newCart.ID,
                    BookID = item.ID,
                    TotalPrice = item.Price,
                };
                await _cartDetailRepository.Add(newCartDetail);
            }
            return true;
        }
    }

}