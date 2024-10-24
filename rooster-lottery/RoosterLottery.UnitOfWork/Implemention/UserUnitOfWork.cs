using FluentValidation;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Responses.Base;
using RoosterLottery.Repository.Interface;
using RoosterLottery.UnitOfWork.Interfaces;
using RoosterLottery.Utils;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace RoosterLottery.UnitOfWork.Implemention
{
    public class UserUnitOfWork : IUserUnitOfWork
    {
        private readonly IUserRepository _userRepository;
        private readonly IOptions<AppSettings> _appSettings;
        private readonly IValidator<User> _validateUser;

        public UserUnitOfWork(IUserRepository userRepository, IOptions<AppSettings> appSettings, IValidator<User> validateUser)
        {
            _userRepository = userRepository;
            this._appSettings = appSettings;
            _validateUser = validateUser;
        }

        private string GenerateToken(long idUser)
        {
            var secret = _appSettings.Value.SecretKey ?? "";

            var key = Encoding.ASCII.GetBytes(secret);
            var tokenHandler = new JwtSecurityTokenHandler();

            var exp = DateTime.Now.AddDays(7);

            var claims = new List<Claim>
               {
                    new Claim(ClaimTypes.Name, idUser.ToString()),
                    new Claim(ClaimTypes.NameIdentifier, idUser.ToString()),
                    new Claim(ClaimTypes.GroupSid, idUser.ToString()),
               };

            var result = tokenHandler.WriteToken(GetToken(claims, key, exp));
            return result;
        }

        private JwtSecurityToken GetToken(List<Claim> authClaims, byte[] secret, DateTime expire)
        {
            var authSigningKey = new SymmetricSecurityKey(secret);

            var token = new JwtSecurityToken(
                issuer: _appSettings.Value.Issuer,
                audience: _appSettings.Value.Audience,
                expires: expire,
                claims: authClaims,
                signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
                );

            return token;
        }


        public Task<string> GenerateTokenJwt(long idUser)
        {
           var result = GenerateToken(idUser);
            return Task.FromResult(result);
        }

        public async Task<ApiBaseResponse> GetUserAsync(long id, CancellationToken cancellationToken)
        {
            var result = await _userRepository.GetUserAsync(id, cancellationToken);
            return new ApiBaseResponse<User> { Status = true, Message = Message.Success, Data = result };
        }

        public async Task<ApiBaseResponse?> GetByPhoneNumberAsync(string phoneNumber, CancellationToken cancellationToken)
        {
            var result = await _userRepository.GetByPhoneNumberAsync(phoneNumber, cancellationToken);
            return new ApiBaseResponse<User> { Status = true, Message = Message.Success, Data = result };

        }

        public async Task<ApiBaseResponse> RegisterUser(User user, CancellationToken cancellationToken)
        {

            var response = new ApiBaseResponse<object>();
            var resultValidate = _validateUser.Validate(user);
            if (!resultValidate.IsValid)
            {
                response.Fail(resultValidate.ToDictionary(), resultValidate.Errors?.FirstOrDefault()?.ErrorMessage ?? "");
                return response;
            }

            var userData = await _userRepository.GetByPhoneNumberAsync(user.PhoneNumber, cancellationToken);
            if (userData != null)
            {
                response.Success(userData, Message.Success);
                return response;
            }

            await _userRepository.InsertAsync(user, cancellationToken);

            userData = await _userRepository.GetByPhoneNumberAsync(user.PhoneNumber, cancellationToken);
            if (userData != null)
            {
                userData.CreatedBy = userData.Id;

                var tokenTask = await this.GenerateTokenJwt(userData.Id);
                userData.AccessToken = tokenTask;
                await _userRepository.UpdateAsync(userData, cancellationToken);
            }

            response.Success(userData ?? new object { }, Message.Success);
            return response;

        }

    }
}
