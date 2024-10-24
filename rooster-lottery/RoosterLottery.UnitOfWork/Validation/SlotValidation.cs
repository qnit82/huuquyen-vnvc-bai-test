using FluentValidation;
using RoosterLottery.DataEntity.Entity.Model;

namespace RoosterLottery.UnitOfWork.Validation
{
    public class SlotValidation : AbstractValidator<Slot>
    {
        public SlotValidation()
        {
            RuleFor(x => x.SlotTime.ToString())
             .Empty().WithMessage("Slot time require")
             .Null().WithMessage("Slot time require");
        }
    }
}
