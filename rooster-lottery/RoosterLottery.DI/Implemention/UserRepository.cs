using Microsoft.EntityFrameworkCore;
using RoosterLottery.DataEntity.Entity.DataContext;
using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Repository.Implemention.Base;
using RoosterLottery.Repository.Interface;

namespace RoosterLottery.Repository.Implemention
{
    public class UserRepository : BaseRepository<User>, IUserRepository
    {
        public UserRepository(RoosterLotteryDBContext dbContext) : base(dbContext)
        {
        }

        public async Task<User?> GetByPhoneNumberAsync(string phoneNumber, CancellationToken cancellationToken)
        {
            var result = await _dbContext.Users.FirstOrDefaultAsync(u => u.PhoneNumber == phoneNumber, cancellationToken);
            return result;
        }

        public async Task<User?> GetUserAsync(long id, CancellationToken cancellationToken)
        {
            var result = await _dbContext.Users.FirstOrDefaultAsync(x => x.Id == id, cancellationToken: cancellationToken);
            return result;
        }

        public async Task<BasePagingResponse<User>> GetUsersAsync(string key, int page, int pageSize, CancellationToken cancellationToken)
        {
            var query = _dbContext.Users.AsQueryable();
            if (page <= 0) page = 1;
            if (pageSize <= 5) pageSize = 5;

            if (!string.IsNullOrEmpty(key))
            {
                query = query.Where(u => u.FullName.Contains(key) || u.PhoneNumber.Contains(key));
            }

            var totalItems = await query.CountAsync(cancellationToken);

            var users = await query.Skip((page - 1) * pageSize)
                                   .Take(pageSize)
                                   .ToListAsync(cancellationToken);
            var result = new BasePagingResponse<User>(page, pageSize, totalItems, users);

            return result;
        }
    }

}
