using Microsoft.AspNetCore.Mvc;
using RoosterLottery.Model.Responses.Base;

namespace RoosterLottery.CoreApi.Controllers
{
    public abstract class BaseController : ControllerBase
    {
        protected ObjectResult UpdateData(ApiBaseResponse response)
        {
            return response.Status ? Ok(response) : BadRequest(response);
        }

        protected (bool Status, long UserId) GetUserId()
        {
            var userId = HttpContext.Items["userId"] as long?;
            if(userId == null)
            {
                return (false, 0);
            }
            return (true, userId ?? 0);
        }
    }
}
