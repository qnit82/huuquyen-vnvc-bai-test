using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Responses.Base;

namespace RoosterLottery.UnitOfWork.Interfaces
{
    public interface IUserUnitOfWork
    {
        Task<string> GenerateTokenJwt(long idUser);
        Task<ApiBaseResponse> GetUserAsync(long id, CancellationToken cancellationToken);
        Task<ApiBaseResponse?> GetByPhoneNumberAsync(string phoneNumber, CancellationToken cancellationToken);
        Task<ApiBaseResponse> RegisterUser(User user, CancellationToken cancellationToken);
    }
}
