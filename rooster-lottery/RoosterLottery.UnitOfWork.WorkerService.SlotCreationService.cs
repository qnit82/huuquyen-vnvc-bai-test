using Microsoft.Extensions.Hosting;

namespace RoosterLottery.UnitOfWork.WorkerService
{
    public class SlotCreationService : BackgroundService
    {
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                var currentTime = DateTime.Now;

                if (currentTime.Hour == 9 && (currentTime.Minute == 27 || currentTime.Minute == 29 || currentTime.Minute == 31))
                {
                    CreateSlot(currentTime);
                }

                await Task.Delay(60000, stoppingToken);
            }

        }

        private void CreateSlot(DateTime time)
        {
            Console.WriteLine($"Slot created for {time.ToString("HH:mm")}");
        }
    }
}
