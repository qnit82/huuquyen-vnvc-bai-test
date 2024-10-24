namespace RoosterLottery.Model.Base
{
    public class BasePagingResponse<T>
    {
        public int Total { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public IEnumerable<T>? Items { get; set; }

        public BasePagingResponse()
        {
            
        }

        public BasePagingResponse(int total, int page, int pageSize, IEnumerable<T> items)
        {
            Page = page;
            PageSize = pageSize;
            Total = total;
            Items = items;
        }

        public BasePagingResponse(int pageSize)
        {
            Page = 0;
            PageSize = pageSize;
        }
    }
}
