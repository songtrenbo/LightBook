using System;
using System.Threading;
using System.Threading.Tasks;
using lightbook_shared;
using lightbook_shared.Constants;
using lightbook_shared.Dtos.EnumDtos;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Linq.Dynamic.Core;

namespace lightbook_backend_API.Extensions{
    public static class DataPagerExtension{
        public static async Task<PagedModel<TModel>> PaginateAsync<TModel>(
            this IQueryable<TModel> query,
            BaseQueryCriteria criteriaDto,
            CancellationToken cancellationToken)
            where TModel:class{
                var paged = new PagedModel<TModel>();
                
                paged.CurrentPage = (criteriaDto.Page<0)?1:criteriaDto.Page;
                paged.PageSize = criteriaDto.Limit;

                if(!string.IsNullOrEmpty(criteriaDto.SortOrder.ToString()) &&
                    !string.IsNullOrEmpty(criteriaDto.SortColumn)){
                        var sortOrder = criteriaDto.SortOrder == (int)SortOrderEnumDto.Accsending ? PagingSortingConstants.ASC : PagingSortingConstants.DESC;
                        var orderString = $"{criteriaDto.SortColumn} {sortOrder}";
                        query = query.OrderBy(orderString);
                    }

                var startRow = (paged.CurrentPage -1) * paged.PageSize;

                var result = query.Skip(startRow)
                                .Take(paged.PageSize);

                paged.Items = await Task.FromResult(result.ToList());

                paged.TotalItems = await Task.FromResult(result.Count());
                paged.TotalPages = (int)Math.Ceiling(paged.TotalItems / (double)paged.PageSize);

                return paged;
            } 
    }
}