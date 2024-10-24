using Hangfire;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using RoosterLottery.UnitOfWork.Interfaces;

namespace RoosterLottery.UnitOfWork.WorkerService
{
    public class SlotCreationService : BackgroundService
    {
        private readonly IServiceProvider _serviceProvider;

        public SlotCreationService(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public void CreateSlotForNextTime()
        {
            using (var scope = _serviceProvider.CreateScope())
            {
                var slotUnitOfWork = scope.ServiceProvider.GetRequiredService<ISlotUnitOfWork>();
                try
                {
                    slotUnitOfWork.CreateSlotForNextTimeAsync(CancellationToken.None).Wait();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.GetType());
                }
            }
        }

        public void SpinSlotToDay()
        {
            using (var scope = _serviceProvider.CreateScope())
            {
                var slotUnitOfWork = scope.ServiceProvider.GetRequiredService<ISlotUnitOfWork>();
                slotUnitOfWork.SpinSlotAsync(CancellationToken.None).Wait();
            }
        }

        /// <summary>
        /// * * * * * = every minute of every hour of every day of every month of every year
        /// </summary>
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            RecurringJob.AddOrUpdate("create-slot-next-time", () => CreateSlotForNextTime(), "*/2 * * * *");
            //RecurringJob.RemoveIfExists("spin-slot");
            RecurringJob.AddOrUpdate("spin-slot", () => SpinSlotToDay(), "*/5 * * * *");
            await Task.CompletedTask;
        }

    }
}
