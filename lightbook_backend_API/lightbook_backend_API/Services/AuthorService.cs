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
using lightbook_shared.Dtos.AuthorDtos;
using lightbook_shared.Dtos.BookDtos;
using Microsoft.EntityFrameworkCore;

namespace lightbook_backend_API.Services
{
    public class AuthorService : IAuthorService
    {
        private readonly IBaseRepository<Author> _authorRepository;
        private readonly IMapper _mapper;
        public AuthorService(IBaseRepository<Author> authorRepository,
                            IMapper mapper)
        {
            _authorRepository = authorRepository;
            _mapper = mapper;
        }
        public async Task<PagedResponseModel<AuthorDto>> GetByPageAsync(AuthorQueryCriteria authorQueryCriteria, CancellationToken cancellationToken)
        {
            var authorQuery = AuthorFilter(_authorRepository.Entities.AsQueryable(), authorQueryCriteria);

            var authors = await authorQuery
                            .AsNoTracking()
                            .PaginateAsync(
                                authorQueryCriteria,
                                cancellationToken
                            );

            var authorDto = _mapper.Map<IList<AuthorDto>>(authors.Items);

            return new PagedResponseModel<AuthorDto>
            {
                CurrentPage = authors.CurrentPage,
                TotalItems = authors.TotalItems,
                TotalPages = authors.TotalPages,
                Items = authorDto
            };
        }
        public async Task<AuthorDto> PostAuthor(AuthorDto authorDto){
            var author = _mapper.Map<Author>(authorDto);
            var result = await _authorRepository.Add(author);
            if(result!=null){
                return _mapper.Map<AuthorDto>(result);
            } else {
                return null;
            }
        }
        public async Task<AuthorDto> PutAuthor(AuthorDto authorDto){
            var author = _mapper.Map<Author>(authorDto);
            var getAuthor = await _authorRepository.GetById(author.ID);
            getAuthor.Name = author.Name;
            var result = await _authorRepository.Update(getAuthor);
            if(result!=null){
                return _mapper.Map<AuthorDto>(result);
            } else {
                return null;
            }
        }
        private IQueryable<Author> AuthorFilter(
            IQueryable<Author> authorQuery,
            AuthorQueryCriteria authorQueryCriteria)
        {
            if (!String.IsNullOrEmpty(authorQueryCriteria.Search))
            {
                string searchStr = UnSignExtension.ConvertToUnSign(authorQueryCriteria.Search).ToLower();
                authorQuery = authorQuery.Where(delegate (Author c)
                {
                    if (UnSignExtension.ConvertToUnSign(c.Name).IndexOf(searchStr, StringComparison.CurrentCultureIgnoreCase) >= 0)
                        return true;
                    else
                        return false;
                }).AsQueryable();
            }
            if (authorQueryCriteria.Id != null)
            {
                authorQuery = authorQuery.Where(b =>
                    b.ID == authorQueryCriteria.Id
                );
            }

            return authorQuery;
        }
    }

}