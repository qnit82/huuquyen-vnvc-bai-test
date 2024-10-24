namespace RoosterLottery.DataEntity.Entity.Base
{
    public abstract class BaseEntity
    {
        public long Id { get; set; }
        public long CreatedBy { get; set; } = default!;
        public long? UpdatedBy { get; set; }
        public DateTime? CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }
    }
}
