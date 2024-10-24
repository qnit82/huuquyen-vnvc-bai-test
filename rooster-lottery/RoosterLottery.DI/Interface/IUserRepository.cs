using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Repository.Interface.BaseInterface;

namespace RoosterLottery.Repository.Interface
{
    public interface IUserRepository : IBaseRepository<User>
    {
        Task<User?> GetUserAsync(long id, CancellationToken cancellationToken);
        Task<User?> GetByPhoneNumberAsync(string phoneNumber, CancellationToken cancellationToken);
        Task<BasePagingResponse<User>> GetUsersAsync(string key, int page, int pageSize, CancellationToken cancellationToken);
    }
}
