using RoosterLottery.DataEntity.Entity.Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace RoosterLottery.DataEntity.Entity.Model
{
    public class User : BaseEntity
    {
        public string FullName { get; set; } = default!;
        public DateTime DateOfBirth { get; set; }
        public string PhoneNumber { get; set; } = default!;
        public string? AccessToken { get; set; } = default!;
        [NotMapped]
        public List<Bet>? Bets { get; set; }
    }
}
