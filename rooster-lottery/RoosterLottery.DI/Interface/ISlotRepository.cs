using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Model.Responses.SlotBetResponseModel;
using RoosterLottery.Repository.Interface.BaseInterface;

namespace RoosterLottery.Repository.Interface
{
    public interface ISlotRepository : IBaseRepository<Slot>
    {
        Task<Slot?> GetSlotAsync(long id, CancellationToken cancellationToken);
        Task<Slot?> GetSlotAsync(DateTime slotTime, CancellationToken cancellationToken);
        Task<SlotWithBetInfoResponse> GetSlotsInfoAsync(long id, CancellationToken cancellationToken);
        Task<BasePagingResponse<Slot>> GetSlotsAsync(string key, int page, int pageSize, CancellationToken cancellationToken);
        Task<IEnumerable<Slot>> GetUnspinedSlotsForTodayAsync(int page, int pageSize, CancellationToken cancellationToken);
        Task<IEnumerable<SlotWithBetInfoResponse>> GetSlotsForDayAsync(DateTime day, bool spined, CancellationToken cancellationToken);
        Task<IEnumerable<SlotBetUserResponse>> GetSlotBetUserAsync(long userId, int page, int pageSize, CancellationToken cancellationToken);
    }
}
