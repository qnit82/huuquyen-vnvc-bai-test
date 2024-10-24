using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Repository.Interface.BaseInterface;

namespace RoosterLottery.Repository.Interface
{
    public interface IBetRepository : IBaseRepository<Bet>
    {
        Task<Bet?> GetBetAsync(long id, CancellationToken cancellationToken);
        Task<IEnumerable<Bet>> GetBetsByUserAsync(long userid, long slotId, CancellationToken cancellationToken);
        Task<BasePagingResponse<Bet>> GetBetsAsync(long userid, string key, long slotId, int page, int pageSize, CancellationToken cancellationToken);
    }
}
