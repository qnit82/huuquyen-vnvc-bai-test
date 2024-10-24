using Microsoft.Extensions.DependencyInjection;
using RoosterLottery.Repository.Implemention;
using RoosterLottery.Repository.Interface;

namespace RoosterLottery.Repository
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddRepository(this IServiceCollection services)
        {
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<ISlotRepository, SlotRepository>();
            services.AddScoped<IBetRepository, BetRepository>();
            return services;
        }
    }
}
