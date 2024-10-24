using Microsoft.AspNetCore.SignalR;

namespace RoosterLottery.UnitOfWork.Hubs
{
    public class RoosterLotteryHub : Hub
    {
        public async Task SendMessage(string user, string message)
        {
            //Send message to all clients connected to the Hub  
            await Clients.All.SendAsync("ReceiveMessage", user, message);
        }

    }
}
