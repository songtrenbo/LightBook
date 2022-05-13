using System.Collections.Generic;

namespace lightbook_shared
{
    public class PagedResponseModel<TModel>
    {
        public int CurrentPage {get;set;}
        public int TotalItems{get;set;}
        public int TotalPages{get;set;}
        public IEnumerable<TModel> Items{get;set;}   
    }
}