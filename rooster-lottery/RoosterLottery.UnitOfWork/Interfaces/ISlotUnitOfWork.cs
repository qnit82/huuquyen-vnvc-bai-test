using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Model.Responses.Base;
using RoosterLottery.Model.Responses.SlotBetResponseModel;

namespace RoosterLottery.UnitOfWork.Interfaces
{
    public interface ISlotUnitOfWork
    {
        Task<ApiBaseResponse<Slot>> GetSlotAsync(long id, CancellationToken cancellationToken);
        Task<ApiBaseResponse<BasePagingResponse<Slot>>> GetSlotsAsync(string key, int page, int pageSize, CancellationToken cancellationToken);
        Task CreateSlotForNextTimeAsync(CancellationToken cancellationToken);
        Task SpinSlotAsync(CancellationToken cancellationToken);
        Task<ApiBaseResponse<IEnumerable<SlotWithBetInfoResponse>>> GetSlotsForDayAsync(DateTime day, bool spined, CancellationToken cancellationToken);
        Task<ApiBaseResponse<IEnumerable<SlotBetUserResponse>>> GetSlotBetUserAsync(long userId, int page, int pageSize, CancellationToken cancellationToken);

    }
}
