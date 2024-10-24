using RoosterLottery.DataEntity.Entity.Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace RoosterLottery.DataEntity.Entity.Model
{
    public class Bet : BaseEntity
    {
        public long? SlotId { get; set; }
        public long? BetNumber { get; set; }
        public DateTime? BetTime { get; set; } = DateTime.Now;
        public bool? Spined { get; set; }
        public bool? IsWinner { get; set; }

        [NotMapped]
        public User? User { get; set; }
        [NotMapped]
        public Slot? Slot { get; set; }

    }
}
