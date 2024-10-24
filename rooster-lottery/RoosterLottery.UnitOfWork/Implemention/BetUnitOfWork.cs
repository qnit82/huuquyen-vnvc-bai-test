using FluentValidation;
using Microsoft.AspNetCore.SignalR;
using RoosterLottery.DataEntity.Entity.Model;
using RoosterLottery.Model.Base;
using RoosterLottery.Model.Responses.Base;
using RoosterLottery.Repository.Interface;
using RoosterLottery.UnitOfWork.Hubs;
using RoosterLottery.UnitOfWork.Interfaces;
using RoosterLottery.Utils;

namespace RoosterLottery.UnitOfWork.Implemention
{
    public class BetUnitOfWork : IBetUnitOfWork
    {
        private readonly IBetRepository _betRepository;
        private readonly ISlotRepository _slotRepository;
        private readonly IValidator<Bet> _validateBet;
        private readonly IHubContext<RoosterLotteryHub> _anonymousHub;

        public BetUnitOfWork(IBetRepository betRepository, IValidator<Bet> validateBet, ISlotRepository slotRepository, IHubContext<RoosterLotteryHub> anonymousHub)
        {
            _betRepository = betRepository;
            _validateBet = validateBet;
            _slotRepository = slotRepository;
            _anonymousHub = anonymousHub;
        }

        public async Task<ApiBaseResponse<Bet>> GetBetAsync(long id, CancellationToken cancellationToken)
        {
            var result = await _betRepository.GetBetAsync(id, cancellationToken);
            return new ApiBaseResponse<Bet> { Status = true, Message = Message.Success, Data = result };
        }

        public async Task<ApiBaseResponse<IEnumerable<Bet>>> GetBetsByUserAsync(long createdBy, long slotId, CancellationToken cancellationToken)
        {
            var response = new ApiBaseResponse<IEnumerable<Bet>>();
            var result = await _betRepository.GetBetsByUserAsync(createdBy, slotId, cancellationToken);
            if (result == null)
            {
                response.Fail(Message.Fail);
                return response;
            }

            response.Success(result, Message.Success);
            return response;
        }

        public async Task<ApiBaseResponse<BasePagingResponse<Bet>>> GetBetsAsync(long userId, string key, long slotId, int page, int pageSize, CancellationToken cancellationToken)
        {
            var result = await _betRepository.GetBetsAsync(userId, key ?? "", slotId, page, pageSize, cancellationToken);
            return new ApiBaseResponse<BasePagingResponse<Bet>> { Status = true, Message = Message.Success, Data = result };
        }

        public async Task<ApiBaseResponse> AddAsync(Bet bet, CancellationToken cancellationToken)
        {
            var response = new ApiBaseResponse<object>();

            var slot = await _slotRepository.GetSlotAsync(bet.SlotId ?? 0, cancellationToken);
            if (slot != null)
            {
                DateTime slotTime = slot.SlotTime;
                DateTime currentTime = DateTime.Now;

                /**
                * A slot is only allowed to be bet on if its draw time is less than 1 hour away.
                * This means if the draw is at 00:00 the next day, betting is allowed from 23:01 to 23:59 the day before.
                * If the draw is at 1:00, betting is only allowed from 00:01 to 00:59.
                * If the draw is at 2:00, betting is allowed from 01:01 to 01:59.
                */

                if (slotTime.AddHours(-1) <= currentTime && currentTime < slotTime)
                {
                    await _betRepository.InsertAsync(bet, cancellationToken);

                    //Send message to all clients when there is a spin result
                    var slotWithBetInfo = await _slotRepository.GetSlotsInfoAsync(bet.SlotId??0, cancellationToken);
                    if (slotWithBetInfo != null)
                    {
                        await _anonymousHub.Clients.All.SendAsync("ReceiveBetMessage", slotWithBetInfo);
                    }

                    response.Success(Message.Success);
                }
                else
                {
                    response.Fail("You are only allowed to place a bet within 1 hour before the slot's draw time.");
                }
            }
            else
            {
                response.Fail(Message.Fail);
            }

            return response;
        }

    }
}
