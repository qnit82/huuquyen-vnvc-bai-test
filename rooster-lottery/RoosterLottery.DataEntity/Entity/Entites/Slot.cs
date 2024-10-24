using Microsoft.EntityFrameworkCore;
using RoosterLottery.DataEntity.Entity.Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace RoosterLottery.DataEntity.Entity.Model
{
    [Index(nameof(SlotTime), Name = "IX_SlotTime", IsUnique = true)]
    public class Slot : BaseEntity
    {
        public DateTime SlotTime { get; set; }
        public int SlotDay { get; set; }
        public int SlotHour { get; set; }
        public int SlotMinute { get; set; }
        public DateTime? SpinTime { get; set; }
        public int? ResultNumber { get; set; }
        public bool? Spined { get; set; }
        [NotMapped]
        public List<Bet>? Bets { get; set; }
    }
}
