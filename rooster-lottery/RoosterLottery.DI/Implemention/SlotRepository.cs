using Microsoft.EntityFrameworkCore;
using RoosterLottery.DataEntity.Entity.DataContext;
using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Model.Responses.SlotBetResponseModel;
using RoosterLottery.Repository.Implemention.Base;
using RoosterLottery.Repository.Interface;

namespace RoosterLottery.Repository.Implemention
{
    public class SlotRepository : BaseRepository<Slot>, ISlotRepository
    {
        public SlotRepository(RoosterLotteryDBContext dbContext) : base(dbContext)
        {
        }

        public async Task<Slot?> GetSlotAsync(long id, CancellationToken cancellationToken)
        {
            var result = await _dbContext.Slots.FirstOrDefaultAsync(x => x.Id == id, cancellationToken: cancellationToken);
            return result;
        }

        public async Task<Slot?> GetSlotAsync(DateTime slotTime, CancellationToken cancellationToken)
        {
            var truncatedSlotTime = new DateTime(slotTime.Year, slotTime.Month, slotTime.Day, slotTime.Hour, slotTime.Minute, 0);

            var result = await _dbContext.Slots
                .FirstOrDefaultAsync(x => x.SlotTime == truncatedSlotTime, cancellationToken: cancellationToken);

            return result;
        }

        public async Task<IEnumerable<Slot>> GetUnspinedSlotsForTodayAsync(int page, int pageSize, CancellationToken cancellationToken)
        {
            var today = DateTime.Today;
            var startOfToday = today;
            var endOfToday = today.AddDays(1);

            var query = _dbContext.Slots.AsQueryable();

            /**
            * If the slot has not been drawn yet, only take slots with a time greater than the current time.
            */
            var currentTime = DateTime.Now.Hour;
            var result = await query
                .Where(s => s.Spined != true && s.SlotTime >= startOfToday && s.SlotTime < endOfToday && s.SlotTime.Hour >= currentTime)
                .OrderByDescending(x => x.SlotTime)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync(cancellationToken);

            return result;
        }

        public async Task<BasePagingResponse<Slot>> GetSlotsAsync(string key, int page, int pageSize, CancellationToken cancellationToken)
        {
            var query = _dbContext.Slots.AsQueryable();
            if (page <= 0) page = 1;
            if (pageSize <= 5) pageSize = 5;

            var totalItems = await query.CountAsync(cancellationToken);

            var slots = await query.Skip((page - 1) * pageSize)
                                   .Take(pageSize)
                                   .ToListAsync(cancellationToken);
            var result = new BasePagingResponse<Slot>(page, pageSize, totalItems, slots);

            return result;
        }


        public async Task<IEnumerable<SlotBetUserResponse>> GetSlotBetUserAsync(long userId, int page, int pageSize, CancellationToken cancellationToken)
        {
            if (page <= 0) page = 1;
            if (pageSize <= 0) pageSize = 10;

            var result=await (from b in _dbContext.Bets
                             join s in _dbContext.Slots on b.SlotId equals s.Id
                             where b.CreatedBy == userId
                             select new SlotBetUserResponse
                             {
                                 Id = b.Id,
                                 SlotId = b.SlotId,
                                 SlotTime = s.SlotTime,
                                 ResultNumber = s.ResultNumber,
                                 BetNumber = b.BetNumber,
                                 Spined = s.Spined,
                                 SpinTime= s.SpinTime,
                                 IsWinner = b.IsWinner,
                             }).OrderByDescending(b=>b.Id).Skip((page - 1) * pageSize).Take(pageSize).ToListAsync(cancellationToken);
            return result;
        }

        public async Task<IEnumerable<SlotWithBetInfoResponse>> GetSlotsForDayAsync(DateTime day, bool spined, CancellationToken cancellationToken)
        {
            var result = await _dbContext.Slots
                    .Where(s => s.SlotTime.Year == day.Year && s.SlotTime.Month == day.Month && s.SlotTime.Day == day.Day && (s.Spined ?? false) == spined)
                    .Select(slot => new SlotWithBetInfoResponse
                    {
                        Slot = slot,
                        TotalBets = _dbContext.Bets.Count(bet => bet.SlotId == slot.Id),
                        WinningBets = _dbContext.Bets.Count(bet => bet.SlotId == slot.Id && bet.IsWinner == true)
                    }).ToListAsync(cancellationToken);

            if (!spined)
            {
                /**
                 * If the slot has not been drawn yet, only take slots with a time greater than the current time.
                 */
                var currentTime = DateTime.Now.Hour;
                result = result.Where(s => s.Slot?.SlotTime.Hour > currentTime).ToList();
            }

            return result;
        }

        public async Task<SlotWithBetInfoResponse> GetSlotsInfoAsync(long id, CancellationToken cancellationToken)
        {
            var result = await _dbContext.Slots
                    .Where(s => s.Id == id)
                    .Select(slot => new SlotWithBetInfoResponse
                    {
                        Slot = slot,
                        TotalBets = _dbContext.Bets.Count(bet => bet.SlotId == slot.Id),
                        WinningBets = _dbContext.Bets.Count(bet => bet.SlotId == slot.Id && bet.IsWinner == true)
                    }).FirstOrDefaultAsync(cancellationToken);

            return result ?? new SlotWithBetInfoResponse();
        }
    }

}
