using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.UnitOfWork.Interfaces;

namespace RoosterLottery.CoreApi.Controllers
{
    [Route("api/v1/bet")]
    [Authorize]
    [ApiController]
    public class BetController : BaseController
    {
        private readonly IBetUnitOfWork _betUnitOfWork;

        public BetController(IBetUnitOfWork betUnitOfWork)
        {
            _betUnitOfWork = betUnitOfWork;
        }

        /// <summary>
        /// API Submit Bet
        /// </summary>
        [HttpPost("bet")]
        public async Task<IActionResult> BetAsync([FromBody] Bet bet, CancellationToken cancellationToken)
        {
            var (status, userId) = GetUserId();
            if (!status) return BadRequest();

            bet.CreatedBy = userId;
            bet.CreatedAt = DateTime.Now;
            var result = await _betUnitOfWork.AddAsync(bet, cancellationToken);
            return UpdateData(result);
        }

        /// <summary>
        /// API Get Bets by User
        /// </summary>

        [HttpPost("user-bets")]
        public async Task<IActionResult> GetBetsByUserAsync(long slotId, CancellationToken cancellationToken)
        {
            var (status, userId) = GetUserId();
            if (!status) return BadRequest();

            var result = await _betUnitOfWork.GetBetsByUserAsync(userId, slotId, cancellationToken);
            return UpdateData(result);
        }

        /// <summary>
        /// API Get Bets by Slot
        /// </summary>
        [HttpPost("slot-bets")]
        public async Task<IActionResult> GetBetsAsync(string key, long slotId, int page, int pageSize, CancellationToken cancellationToken)
        {
            var (status, userId) = GetUserId();
            if (!status) return BadRequest();

            var result = await _betUnitOfWork.GetBetsAsync(userId,key, slotId, page, pageSize, cancellationToken);
            return UpdateData(result);
        }

    }
}
