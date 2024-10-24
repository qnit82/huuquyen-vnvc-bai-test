namespace RoosterLottery.Model.Responses.Base
{
    public class ApiBaseResponse
    {
        public bool Status { get; set; }
        public string? Message { get; set; }
    }

    public class ApiBaseResponse<T> : ApiBaseResponse
    {
        public T? Data { get; set; }
        public ApiBaseResponse()
        {
        }

        public ApiBaseResponse(bool status, string message)
        {
            Status = status;
            Message = message;
        }

        public void Success(T data, string message = "")
        {
            Status = true;
            Data = data;
            Message = message;
        }   

        public void Fail(string message)
        {
            Status = false;
            Message = message;
        }

        public void Fail( T data, string message)
        {
            Status = false;
            Message = message;
            Data = data;
        }
    }
}
