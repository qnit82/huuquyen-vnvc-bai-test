using FluentValidation;
using Microsoft.AspNetCore.SignalR;
using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Model.Responses.Base;
using RoosterLottery.Model.Responses.SlotBetResponseModel;
using RoosterLottery.Repository.Interface;
using RoosterLottery.UnitOfWork.Hubs;
using RoosterLottery.UnitOfWork.Interfaces;
using RoosterLottery.Utils;

namespace RoosterLottery.UnitOfWork.Implemention
{
    public class SlotUnitOfWork : ISlotUnitOfWork
    {
        private readonly ISlotRepository _slotRepository;
        private readonly IHubContext<RoosterLotteryHub> _anonymousHub;
        private readonly IValidator<Slot> _validateSlot;
        public SlotUnitOfWork(ISlotRepository slotRepository, IValidator<Slot> validateSlot, IHubContext<RoosterLotteryHub> anonymousHub)
        {
            _slotRepository = slotRepository;
            _validateSlot = validateSlot;
            _anonymousHub = anonymousHub;
        }

        /// <summary>
        /// Only create Slot for the next hour of the current time of that day: For example, before 1:00, create Slot for 1:00, 
        /// before 2:00, create slot for 2:00
        /// - Only create 1 slot for 1 hour at a time, if that hour already has a slot, do not create another one
        /// </summary>
        public async Task CreateSlotForNextTimeAsync(CancellationToken cancellationToken)
        {
            var currentTime = DateTime.Now;
            // Get the next hour from the current time
            var nextSlotHour = currentTime.Hour + 1;

            // If it is past 23:00, do not create any more slots for today
            if (nextSlotHour >= 24)
            {
                return;
            }

            // Create slot time for the next hour of the current day
            var slotTime = new DateTime(currentTime.Year, currentTime.Month, currentTime.Day, nextSlotHour, 0, 0);

            // Check if the slot already exists
            var currentSlot = await _slotRepository.GetSlotAsync(slotTime, cancellationToken);

            // Create Slot for this hour if it does not exist
            if (currentSlot == null)
            {
                var slot = new Slot
                {
                    CreatedAt = DateTime.Now,
                    SlotTime = slotTime,
                    SlotDay = slotTime.Day,
                    SlotHour = slotTime.Hour,
                    SlotMinute = 0,
                    ResultNumber = null
                };

                await _slotRepository.InsertAsync(slot, cancellationToken);
            }
        }

        /// <summary>
        /// Slot Spins
        /// </summary>
        public async Task SpinSlotAsync(CancellationToken cancellationToken)
        {
            var currentHour = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, 0, 0);

            var slots = await _slotRepository.GetUnspinedSlotsForTodayAsync(1, 100, cancellationToken);

            foreach (var slot in slots)
            {
                var slotHour = new DateTime(slot.SlotTime.Year, slot.SlotTime.Month, slot.SlotTime.Day, slot.SlotTime.Hour, 0, 0);

                if (currentHour >= slotHour && currentHour < slotHour.AddHours(1))
                {
                    var resultNumber = Util.GenerateLotteryNumber();
                    slot.ResultNumber = resultNumber;
                    slot.SpinTime = DateTime.Now;
                    slot.UpdatedAt = DateTime.Now;
                    slot.Spined = true;

                    var query = $"BEGIN TRANSACTION;" +
                        $"BEGIN TRY " +
                        $"update Slots set ResultNumber={resultNumber}, Spined=1, SpinTime=GETDATE(), UpdatedAt=GETDATE() where Id={slot.Id} " +
                        $"update Bets set UpdatedAt=GETDATE(), Spined=1, IsWinner=case BetNumber when {resultNumber} then 1 else 0 end where SlotId={slot.Id} " +
                        $"COMMIT TRANSACTION; " +
                        $"PRINT 'Spin committed successfully'; " +
                        $"END TRY " +
                        $"BEGIN CATCH " +
                        $"ROLLBACK TRANSACTION; " +
                        $"PRINT 'Spin error'; " +
                        $"END CATCH; ";

                    int executeQueryUpdateBets = await _slotRepository.ExecuteCommandText(query);

                    //Send message to all clients when there is a spin result
                    var slotWithBetInfo = await _slotRepository.GetSlotsInfoAsync(slot.Id, cancellationToken);
                    if (slotWithBetInfo!=null)
                    {
                        await _anonymousHub.Clients.All.SendAsync("ReceiveMessageSpinSlot", slotWithBetInfo);
                    }
                    
                    Console.WriteLine($"Spin for Slot: {slot.Id} at hour {currentHour}. Result: {resultNumber}");
                }
            }
        }

        public async Task<ApiBaseResponse<Slot>> GetSlotAsync(long id, CancellationToken cancellationToken)
        {
            var result = await _slotRepository.GetSlotAsync(id, cancellationToken);
            return new ApiBaseResponse<Slot> { Status = true, Message = Message.Success, Data = result };
        }

        public async Task<ApiBaseResponse<BasePagingResponse<Slot>>> GetSlotsAsync(string key, int page, int pageSize, CancellationToken cancellationToken)
        {
            var result = await _slotRepository.GetSlotsAsync(key, page, pageSize, cancellationToken);
            return new ApiBaseResponse<BasePagingResponse<Slot>> { Status = true, Message = Message.Success, Data = result };
        }

        public async Task<ApiBaseResponse<IEnumerable<SlotWithBetInfoResponse>>> GetSlotsForDayAsync(DateTime day, bool spined, CancellationToken cancellationToken)
        {
            var response = new ApiBaseResponse<IEnumerable<SlotWithBetInfoResponse>>();
            var result = await _slotRepository.GetSlotsForDayAsync(day, spined, cancellationToken);
            if (result == null)
            {
                response.Fail(Message.Fail);
                return response;
            }

            response.Success(result, Message.Success);
            return response;
        }

        public async Task<ApiBaseResponse<IEnumerable<SlotBetUserResponse>>> GetSlotBetUserAsync(long userId, int page, int pageSize, CancellationToken cancellationToken)
        {
            var response = new ApiBaseResponse<IEnumerable<SlotBetUserResponse>>();
            var result = await _slotRepository.GetSlotBetUserAsync(userId, page, pageSize, cancellationToken);
            if (result == null)
            {
                response.Fail(Message.Fail);
                return response;
            }

            response.Success(result, Message.Success);
            return response;
        }

    }
}
