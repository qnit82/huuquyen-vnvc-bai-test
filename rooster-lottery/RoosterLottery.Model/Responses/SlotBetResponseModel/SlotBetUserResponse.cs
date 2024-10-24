using RoosterLottery.DataEntity.Entity.Model;

namespace RoosterLottery.Model.Responses.SlotBetResponseModel
{
    public class SlotBetUserResponse:Bet
    {
        public DateTime SlotTime { get; set; }
        public DateTime? SpinTime { get; set; }
        public int? ResultNumber { get; set; }
    }
}
