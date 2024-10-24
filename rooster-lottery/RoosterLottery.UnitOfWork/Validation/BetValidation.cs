using FluentValidation;
using RoosterLottery.DataEntity.Entity.Model;

namespace RoosterLottery.UnitOfWork.Validation
{
    public class BetValidation : AbstractValidator<Bet>
    {
        public BetValidation()
        {
            RuleFor(x => x.SlotId).Null().WithMessage("Slot id require");
        }
    }
}
