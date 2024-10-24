using FluentValidation;
using Hangfire;
using Hangfire.SqlServer;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using RoosterLottery.DataEntity.Entity.DataContext;
using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Repository;
using RoosterLottery.UnitOfWork.Implemention;
using RoosterLottery.UnitOfWork.Interfaces;
using RoosterLottery.UnitOfWork.Validation;
using RoosterLottery.UnitOfWork.WorkerService;
using RoosterLottery.Utils;
using System.Text;

namespace RoosterLottery.UnitOfWork
{
    public static class DependencyInjection
    {
        private static IServiceCollection AddUserUnitOfWork(this IServiceCollection services)
        {
            services.AddScoped<IUserUnitOfWork, UserUnitOfWork>();
            services.AddScoped<ISlotUnitOfWork, SlotUnitOfWork>();
            services.AddScoped<IBetUnitOfWork, BetUnitOfWork>();
            return services;
        }

        private static IServiceCollection AddBetUnitOfWork(this IServiceCollection services)
        {
            return services;
        }

        private static IServiceCollection AddValidate(this IServiceCollection services)
        {
            services.AddScoped<IValidator<User>, UserValidator>();
            services.AddScoped<IValidator<Slot>, SlotValidation>();
            services.AddScoped<IValidator<Bet>, BetValidation>();
            return services;
        }

        private static IServiceCollection AddDbContext(this IServiceCollection services, ConfigurationManager configurationManager)
        {
            services.AddDbContext<RoosterLotteryDBContext>(options =>
            {
                string connectionString = configurationManager.GetConnectionString("RoosterLotteryDb");
                options.UseSqlServer(connectionString, b => b.MigrationsAssembly("RoosterLottery.CoreApi"));
            });

            return services;
        }

        private static IServiceCollection AddAuthentication(this IServiceCollection services, ConfigurationManager configurationManager)
        {
            var appSettingsSection = configurationManager.GetSection("AppSettings");
            services.Configure<AppSettings>(appSettingsSection);
            //configure jwt authentication
            var appSettings = appSettingsSection.Get<AppSettings>();
            var key = Encoding.ASCII.GetBytes(appSettings.SecretKey);

            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = false,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    RequireExpirationTime = true,
                    ValidateLifetime = true,
                    ValidAudience = appSettings.Audience,
                    ValidIssuer = appSettings.Issuer
                };
                x.Events = new JwtBearerEvents
                {
                    OnTokenValidated = async context =>
                    {
                        var userService = context.HttpContext.RequestServices.GetRequiredService<IUserUnitOfWork>();
                        _ = long.TryParse(context.Principal.Identity.Name, out var userId);
                        if (userId == 0)
                        {
                            context.Fail("Unauthorized");
                        }
                        var user = await userService.GetUserAsync(userId, CancellationToken.None);
                        if (user == null)
                        {
                            // return unauthorized if user no longer exists
                            context.Fail("Unauthorized");
                        }
                        
                        context.HttpContext.Items["userId"] = userId;   
                    }
                };
            });
            return services;
        }

        public static IServiceCollection AddHangfire(this IServiceCollection services, ConfigurationManager configurationManager)
        {
            services.AddHangfire(configuration =>
                    configuration.SetDataCompatibilityLevel(CompatibilityLevel.Version_170)
                 .UseSimpleAssemblyNameTypeSerializer()
                 .UseRecommendedSerializerSettings()
                 .UseSqlServerStorage(configurationManager.GetConnectionString("RoosterLotteryDbHangfire"), new SqlServerStorageOptions
                 {
                     CommandBatchMaxTimeout = TimeSpan.FromMinutes(5),
                     SlidingInvisibilityTimeout = TimeSpan.FromMinutes(5),
                     QueuePollInterval = TimeSpan.Zero,
                     UseRecommendedIsolationLevel = true,
                     DisableGlobalLocks = true
                 }));

            services.AddHangfireServer();
            return services;
        }

        public static IServiceCollection AddUnitOfWork(this IServiceCollection services, ConfigurationManager configurationManager)
        {
            services.AddUserUnitOfWork()
                    .AddBetUnitOfWork()
                    .AddRepository()
                    .AddValidate()
                    .AddDbContext(configurationManager)
                    .AddAuthentication(configurationManager)
                    .AddHangfire(configurationManager);

            services.AddHostedService<SlotCreationService>();
            return services;
        }
    }
}
