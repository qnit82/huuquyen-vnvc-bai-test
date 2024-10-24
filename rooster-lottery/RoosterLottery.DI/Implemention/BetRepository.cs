using Microsoft.EntityFrameworkCore;
using RoosterLottery.DataEntity.Entity.DataContext;
using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Repository.Implemention.Base;
using RoosterLottery.Repository.Interface;

namespace RoosterLottery.Repository.Implemention
{
    public class BetRepository : BaseRepository<Bet>, IBetRepository
    {
        public BetRepository(RoosterLotteryDBContext dbContext) : base(dbContext)
        {
        }

        public async Task<Bet?> GetBetAsync(long id, CancellationToken cancellationToken)
        {
            var result = await _dbContext.Bets.FirstOrDefaultAsync(x => x.Id == id, cancellationToken: cancellationToken);
            return result;
        }

        public async Task<IEnumerable<Bet>> GetBetsByUserAsync(long createdBy, long slotId, CancellationToken cancellationToken)
        {
            var query = _dbContext.Bets.AsQueryable();

            var result = await query
                .Where(s => s.CreatedBy == createdBy)
                .OrderByDescending(x => x.Id)
                .ToListAsync(cancellationToken);

            return result;
        }

        public async Task<BasePagingResponse<Bet>> GetBetsAsync(long userId, string key, long slotId, int page, int pageSize, CancellationToken cancellationToken)
        {
            var query = from b in _dbContext.Bets
                        join s in _dbContext.Slots on b.SlotId equals s.Id
                        where s.Id == slotId
                        select new Bet
                        {
                            Id = b.Id,
                            SlotId = s.Id,
                            BetNumber = b.BetNumber,
                            BetTime = b.BetTime,
                            Spined = b.Spined,
                            IsWinner =(b.BetNumber == s.ResultNumber && b.CreatedBy==userId)
                        };

            if (page <= 0) page = 1;
            if (pageSize <= 5) pageSize = 5;

            var totalItems = await query.CountAsync(cancellationToken);

            var slots = await query.Skip((page - 1) * pageSize)
                                   .Take(pageSize)
                                   .ToListAsync(cancellationToken);
            var result = new BasePagingResponse<Bet>(page, pageSize, totalItems, slots);

            return result;
        }

        //public async Task<BasePagingResponse<Bet>> GetBetsAsync(long userid, string key, long slotId, int page, int pageSize, CancellationToken cancellationToken)
        //{
        //    var query = _dbContext.Bets.AsQueryable();
        //    query = query.Where(x => x.SlotId == slotId).OrderByDescending(x => x.Id);

        //    if (page <= 0) page = 1;
        //    if (pageSize <= 5) pageSize = 5;

        //    var totalItems = await query.CountAsync(cancellationToken);

        //    var slots = await query.Skip((page - 1) * pageSize)
        //                           .Take(pageSize)
        //                           .ToListAsync(cancellationToken);
        //    var result = new BasePagingResponse<Bet>(page, pageSize, totalItems, slots);

        //    return result;
        //}
    }
}
