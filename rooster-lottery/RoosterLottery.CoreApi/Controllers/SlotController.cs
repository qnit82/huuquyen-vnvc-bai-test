using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RoosterLottery.UnitOfWork.Interfaces;

namespace RoosterLottery.CoreApi.Controllers
{
    [Route("api/v1/slot")]
    [Authorize]
    [ApiController]
    public class SlotController : BaseController
    {
        private readonly ISlotUnitOfWork _slotUnitOfWork;

        public SlotController(ISlotUnitOfWork slotUnitOfWork)
        {
            _slotUnitOfWork = slotUnitOfWork;
        }

        /// <summary>
        /// Kích hoạt quay thưởng đễ test: xong sẽ xóa
        /// </summary>
        [HttpGet("spin-test")]
        [AllowAnonymous]
        public async Task<IActionResult> TriggerSpinForTest(CancellationToken cancellationToken)
        {
            await _slotUnitOfWork.SpinSlotAsync(cancellationToken);
            return Ok(true);
        }

        [HttpGet("slots")]
        public async Task<IActionResult> GetSlotsForDayAsync(bool? spined, DateTime? slotDate, CancellationToken cancellationToken)
        {
            var (status, userId) = GetUserId();
            if (!status) return BadRequest();

            var result = await _slotUnitOfWork.GetSlotsForDayAsync(slotDate ?? DateTime.Now, spined ?? false, cancellationToken);
            return UpdateData(result);
        }
        
        [HttpGet("user-slot-bets")]
        public async Task<IActionResult> GetSlotBetUserAsync(int page, int pageSize, CancellationToken cancellationToken)
        {
            var (status, userId) = GetUserId();
            if (!status) return BadRequest();

            var result = await _slotUnitOfWork.GetSlotBetUserAsync(userId, page, pageSize, cancellationToken);
            return UpdateData(result);
        }


    }
}
