namespace lightbook_shared.Dtos.BookDtos
{
    public class BookQueryCriteria : BaseQueryCriteria
    {
        public int? categoryId { get; set; }
        public int? catalogId { get; set; }
        public int? authorId { get; set; }
        public int? Id { get; set; }
    }
}