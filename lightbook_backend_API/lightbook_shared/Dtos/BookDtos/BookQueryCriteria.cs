namespace lightbook_shared.Dtos.BookDtos
{
    public class BookQueryCriteria:BaseQueryCriteria
    {
        public int[] Category{get;set;}
        public int? Id {get;set;}
    }
}