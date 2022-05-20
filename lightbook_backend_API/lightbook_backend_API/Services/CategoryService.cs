using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using lightbook_backend_API.Extentions;
using lightbook_backend_API.Interfaces;
using lightbook_backend_API.Model;
using lightbook_shared;
using lightbook_shared.Dtos.CategoryDtos;
using Microsoft.EntityFrameworkCore;

namespace lightbook_backend_API.Services
{
    public class CategoryService : ICategoryService
    {
        private readonly IBaseRepository<Category> _categoryRepository;
        private readonly IMapper _mapper;
        public CategoryService(IBaseRepository<Category> categoryRepository,
                            IMapper mapper){
            _categoryRepository=categoryRepository;
            _mapper=mapper;
        }

        public async Task<PagedResponseModel<CategoryDto>> GetByPageAsync(CategoryQueryCriteria categoryQueryCriteria, CancellationToken cancellationToken)
        {
            var categoryQuery = CategoryFilter(_categoryRepository.Entities.AsQueryable(), categoryQueryCriteria);

            var categories = await categoryQuery
                            .AsNoTracking()
                            .PaginateAsync(
                                categoryQueryCriteria,
                                cancellationToken
                            );

            var categoryDto = _mapper.Map<IList<CategoryDto>>(categories.Items);

            return new PagedResponseModel<CategoryDto>{
                CurrentPage = categories.CurrentPage,
                TotalItems = categories.TotalItems,
                TotalPages = categories.TotalPages,
                Items = categoryDto
            };                      
        }
        private IQueryable<Category> CategoryFilter(
            IQueryable<Category> categoryQuery,
            CategoryQueryCriteria categoryQueryCriteria)
        {
            if (!String.IsNullOrEmpty(categoryQueryCriteria.Search))
            {                
                categoryQuery = categoryQuery.Where(b => b.Name.Contains(categoryQueryCriteria.Search));
                
            }
            if (categoryQueryCriteria.Id != null)
            {
                categoryQuery = categoryQuery.Where(b =>
                    b.ID==categoryQueryCriteria.Id
                );
            }
            return categoryQuery;
        }
    }
    
}