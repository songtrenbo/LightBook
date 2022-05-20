using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using lightbook_backend_API.Extensions;
using lightbook_backend_API.Interfaces;
using lightbook_backend_API.Model;
using lightbook_shared;
using lightbook_shared.Dtos.BookDtos;
using Microsoft.EntityFrameworkCore;

namespace lightbook_backend_API.Services
{
    public class BookService : IBookService
    {
        private readonly IBaseRepository<Book> _bookRepository;
        private readonly IMapper _mapper;
        public BookService(IBaseRepository<Book> bookRepository,
                            IMapper mapper){
            _bookRepository=bookRepository;
            _mapper=mapper;
        }

        public async Task<PagedResponseModel<BookDto>> GetByPageAsync(BookQueryCriteria bookQueryCriteria, CancellationToken cancellationToken)
        {
            var bookQuery = BookFilter(_bookRepository.Entities.AsQueryable(), bookQueryCriteria);

            var books = await bookQuery
                            .AsNoTracking()
                            .Include(b => b.Category)
                            .PaginateAsync(
                                bookQueryCriteria,
                                cancellationToken
                            );

            var bookDto = _mapper.Map<IList<BookDto>>(books.Items);

            return new PagedResponseModel<BookDto>{
                CurrentPage = books.CurrentPage,
                TotalItems = books.TotalItems,
                TotalPages = books.TotalPages,
                Items = bookDto
            };                      
        }
        private IQueryable<Book> BookFilter(
            IQueryable<Book> bookQuery,
            BookQueryCriteria bookQueryCriteria)
        {
            if (!String.IsNullOrEmpty(bookQueryCriteria.Search))
            {                
                string searchStr = UnSignExtension.ConvertToUnSign(bookQueryCriteria.Search).ToLower();
                bookQuery = bookQuery.Where(delegate (Book c)
                {
                    if (UnSignExtension.ConvertToUnSign(c.Name).IndexOf(searchStr, StringComparison.CurrentCultureIgnoreCase) >= 0)
                        return true;
                    else
                        return false;
                }).AsQueryable();
            }
            if (bookQueryCriteria.Id != null)
            {
                bookQuery = bookQuery.Where(b =>
                    b.ID==bookQueryCriteria.Id
                );
            }

            if(bookQueryCriteria.categoryId != null) {
                bookQuery = bookQuery.Where(bq => bq.CategoryID == bookQueryCriteria.categoryId);
            }

            if(bookQueryCriteria.catalogId != null) {
                bookQuery = bookQuery.Where(bq=>bq.CatalogBooks.Any(cb=>cb.CatalogID==bookQueryCriteria.catalogId));
            }

            if(bookQueryCriteria.authorId!=null){
                bookQuery = bookQuery.Where(bq=>bq.AuthorBooks.Any(ab=>ab.AuthorID==bookQueryCriteria.authorId));
            }

            return bookQuery;
        }
    }
    
}