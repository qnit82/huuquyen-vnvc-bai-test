using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.UnitOfWork.Interfaces;

namespace RoosterLottery.CoreApi.Controllers
{
    [Route("api/v1/user")]
    [Authorize]
    [ApiController]
    public class UserController : BaseController
    {
        private readonly IUserUnitOfWork _userUnitOfWork;

        public UserController(IUserUnitOfWork userUnitOfWork)
        {
            _userUnitOfWork = userUnitOfWork;
        }

        [HttpGet("info")]
        public async Task<IActionResult> GetUserAsync(CancellationToken cancellationToken)
        {
            var (status, userId) = GetUserId();
            if (!status) return BadRequest();
            var user = await _userUnitOfWork.GetUserAsync(userId, cancellationToken);
            return UpdateData(user);
        }

        [HttpGet("id/{id}")]
        public async Task<IActionResult> GetUserAsync(long id, CancellationToken cancellationToken)
        {
            var user = await _userUnitOfWork.GetUserAsync(id, cancellationToken);
            if (user == null)
            {
                return BadRequest();
            }
            return Ok(user);
        }

        [HttpGet("phone-number")]
        [AllowAnonymous]
        public async Task<IActionResult> GetByPhoneNumberAsync(string phoneNumber, CancellationToken cancellationToken)
        {
            var result = await _userUnitOfWork.GetByPhoneNumberAsync(phoneNumber, cancellationToken);
            return UpdateData(result);
        }

        [HttpPost("register")]
        [AllowAnonymous]
        public async Task<IActionResult> AddAsync([FromBody] User user, CancellationToken cancellationToken)
        {
            var result = await _userUnitOfWork.RegisterUser(user, cancellationToken);
            return UpdateData(result);
        }
    }
}
