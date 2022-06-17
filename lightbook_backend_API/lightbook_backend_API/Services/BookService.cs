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
        private readonly IBaseRepository<BookUser> _bookUserRepository;
        private readonly IBaseRepository<CatalogBook> _catalogBookRepository;
        private readonly IBaseRepository<AuthorBook> _authorBookRepository;
        private readonly IMapper _mapper;
        public BookService(IBaseRepository<Book> bookRepository, 
                        IBaseRepository<BookUser> bookUserRepository,
                        IBaseRepository<CatalogBook> catalogBookRepository,
                        IBaseRepository<AuthorBook> authorBookRepository,
                        IMapper mapper)
        {
            _bookRepository = bookRepository;
            _bookUserRepository = bookUserRepository;
            _authorBookRepository = authorBookRepository;
            _catalogBookRepository = catalogBookRepository;
            _mapper = mapper;
        }

        public async Task<BookUser> AddBookFreeToLibrary(int bookId, int userid)
        {
            var check = _bookUserRepository.Entities.Where(x => x.BookID == bookId && x.UserID == userid).FirstOrDefault();
            if (check != null)
            {
                return check;
            }
            var book = await _bookRepository.GetById(bookId);
            if (book == null) return null;
            if (book.Price == 0)
            {
                await _bookUserRepository.Add(new BookUser()
                {
                    BookID = bookId,
                    UserID = userid,
                });
            }
            return check;
        }
        public async Task<List<BookDto>> GetAll()
        {
            var bookQuery = BookFilter(_bookRepository.Entities.AsQueryable(), new BookQueryCriteria());
            return _mapper.Map<List<BookDto>>(bookQuery);
        }

        public async Task<List<BookDto>> GetBookByCategoryId(int categoryId)
        {
            var bookQuery = BookFilter(_bookRepository.Entities.AsQueryable(), new BookQueryCriteria { categoryId = categoryId });
            return _mapper.Map<List<BookDto>>(bookQuery);
        }

        public async Task<List<BookUser>> GetBooksLibrary(int userid)
        {
            var bookUsers = _bookUserRepository.Entities
                                    .Where(x => x.UserID == userid)
                                    .Include(x => x.Book).ToList();
            return bookUsers;
        }

        public async Task<PagedResponseModel<BookDto>> GetByPageAsync(BookQueryCriteria bookQueryCriteria, CancellationToken cancellationToken)
        {
            var bookQuery = BookFilter(_bookRepository.Entities
                                            .Include(b=>b.Category)
                                            .Include(b=>b.AuthorBooks)
                                            .ThenInclude(at=>at.Author)
                                            .AsQueryable(), 
                                            bookQueryCriteria
                                        );

            var books = await bookQuery
                            .AsNoTracking()
                            .PaginateAsync(
                                bookQueryCriteria,
                                cancellationToken
                            );

            var bookDto = _mapper.Map<IList<BookDto>>(books.Items);

            return new PagedResponseModel<BookDto>
            {
                CurrentPage = books.CurrentPage,
                TotalItems = books.TotalItems,
                TotalPages = books.TotalPages,
                Items = bookDto
            };
        }

        public async Task<BookDto> CreateBook(BookCreateDto bookCreateDto){
            var book = _mapper.Map<Book>(bookCreateDto);
            var result = await _bookRepository.Add(book);
            if(result!=null){
                foreach(int authorId in bookCreateDto.Authors){
                    await _authorBookRepository.Add(new AuthorBook(){
                        AuthorID= authorId,
                        BookID= result.ID
                    });
                }
                await _catalogBookRepository.Add(new CatalogBook(){
                    CatalogID= 3,
                    BookID= result.ID
                });
                if(result.Price==0){
                   await _catalogBookRepository.Add(new CatalogBook(){
                    CatalogID= 4,
                    BookID= result.ID
                }); 
                }
                return _mapper.Map<BookDto>(result);
            } else {
                return null;
            }
        }
        public async Task<BookDto> EditBook(BookCreateDto bookCreateDto){
            var book = _mapper.Map<Book>(bookCreateDto);
            var getBook = await _bookRepository.GetById(book.ID);
            getBook.Name = book.Name;
            getBook.Price = book.Price;
            getBook.Picture = book.Picture;
            getBook.Review = book.Review;
            getBook.Chapter = book.Chapter;
            getBook.CategoryID = book.CategoryID;
            var result = await _bookRepository.Update(getBook);
            if(result!=null){
                var authorBookList = await _authorBookRepository.GetListByAsync(ab=>ab.BookID==result.ID);
                foreach(var authorBook in authorBookList){
                    await _authorBookRepository.Delete(authorBook);
                }
                foreach(int authorId in bookCreateDto.Authors){
                    await _authorBookRepository.Add(new AuthorBook(){
                        AuthorID= authorId,
                        BookID= result.ID
                    });
                }
                return _mapper.Map<BookDto>(result);
            } else {
                return null;
            }
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
                    b.ID == bookQueryCriteria.Id
                );
            }

            if (bookQueryCriteria.categoryId != null)
            {
                bookQuery = bookQuery.Where(bq => bq.CategoryID == bookQueryCriteria.categoryId);
            }

            if (bookQueryCriteria.catalogId != null)
            {
                bookQuery = bookQuery.Where(bq => bq.CatalogBooks.Any(cb => cb.CatalogID == bookQueryCriteria.catalogId));
            }

            if (bookQueryCriteria.authorId != null)
            {
                bookQuery = bookQuery.Where(bq => bq.AuthorBooks.Any(ab => ab.AuthorID == bookQueryCriteria.authorId));
            }

            return bookQuery;
        }
    }

}