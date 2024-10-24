using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Model.Responses.Base;

namespace RoosterLottery.UnitOfWork.Interfaces
{
    public interface IBetUnitOfWork
    {
        Task<ApiBaseResponse<Bet>> GetBetAsync(long userId, CancellationToken cancellationToken);
        Task<ApiBaseResponse<IEnumerable<Bet>>> GetBetsByUserAsync(long userId, long slotId, CancellationToken cancellationToken);
        /// <summary>
        /// -Does the GetBetsAsync method use the userId to compare if this Bets was created by this userId?
        /// -If this userId was created, display the result so that the logged in User knows if he won or not?
        /// </summary>
        Task<ApiBaseResponse<BasePagingResponse<Bet>>> GetBetsAsync(long userId, string key, long slotId, int page, int pageSize, CancellationToken cancellationToken);
        Task<ApiBaseResponse> AddAsync(Bet bet, CancellationToken cancellationToken);
    }
}
