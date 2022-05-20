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
using lightbook_shared.Dtos.CatalogDtos;
using Microsoft.EntityFrameworkCore;

namespace lightbook_backend_API.Services
{
    public class CatalogService : ICatalogService
    {
        private readonly IBaseRepository<Catalog> _catalogRepository;
        private readonly IMapper _mapper;
        public CatalogService(IBaseRepository<Catalog> catalogRepository,
                            IMapper mapper){
            _catalogRepository=catalogRepository;
            _mapper=mapper;
        }

        public async Task<PagedResponseModel<CatalogDto>> GetByPageAsync(CatalogQueryCriteria catalogQueryCriteria, CancellationToken cancellationToken)
        {
            var catalogQuery = CatalogFilter(_catalogRepository.Entities.AsQueryable(), catalogQueryCriteria);

            var catalogs = await catalogQuery
                            .AsNoTracking()
                            .PaginateAsync(
                                catalogQueryCriteria,
                                cancellationToken
                            );

            var catalogDto = _mapper.Map<IList<CatalogDto>>(catalogs.Items);

            return new PagedResponseModel<CatalogDto>{
                CurrentPage = catalogs.CurrentPage,
                TotalItems = catalogs.TotalItems,
                TotalPages = catalogs.TotalPages,
                Items = catalogDto
            };                      
        }
        private IQueryable<Catalog> CatalogFilter(
            IQueryable<Catalog> catalogQuery,
            CatalogQueryCriteria catalogQueryCriteria)
        {
            if (!String.IsNullOrEmpty(catalogQueryCriteria.Search))
            {                
                string searchStr = UnSignExtension.ConvertToUnSign(catalogQueryCriteria.Search).ToLower();
                catalogQuery = catalogQuery.Where(delegate (Catalog c)
                {
                    if (UnSignExtension.ConvertToUnSign(c.Name).IndexOf(searchStr, StringComparison.CurrentCultureIgnoreCase) >= 0)
                        return true;
                    else
                        return false;
                }).AsQueryable();
            }
            if (catalogQueryCriteria.Id != null)
            {
                catalogQuery = catalogQuery.Where(b =>
                    b.ID==catalogQueryCriteria.Id
                );
            }
            return catalogQuery;
        }
    }
    
}