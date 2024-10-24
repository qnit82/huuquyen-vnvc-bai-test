using RoosterLottery.DataEntity.Entity.Model;

namespace RoosterLottery.Model.Responses.SlotBetResponseModel
{
    public class SlotWithBetInfoResponse
    {
        public Slot? Slot { get; set; }
        public int TotalBets { get; set; }
        public int WinningBets { get; set; }
    }
}
