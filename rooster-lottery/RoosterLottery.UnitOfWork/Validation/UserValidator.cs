using FluentValidation;
using RoosterLottery.DataEntity.Entity.Model;

namespace RoosterLottery.UnitOfWork.Validation
{
    public class UserValidator : AbstractValidator<User>
    {
        public UserValidator()
        {
            RuleFor(x => x.FullName)
             .NotEmpty().WithMessage("Yêu cầu họ tên")
             .Length(2, 50).WithMessage("Họ tên phải trên 2 ký tự.");

            //RuleFor(x => x.Email)
            //    .NotEmpty().WithMessage("Email is required.")
            //    .EmailAddress().WithMessage("Invalid email format.");

            RuleFor(x => x.DateOfBirth)
                .LessThan(DateTime.Now.AddYears(-18)).WithMessage("Bạn chưa đủ 18 tuổi.");

            RuleFor(x => x.PhoneNumber)
                .NotEmpty().WithMessage("Yêu cầu số điện thoại.")
                .Matches(@"^\d{10,11}$").WithMessage("Số điện thoại phải có 10 hoặc 11 chữ số.")
                .WithMessage("Số điện thoại không hợp lệ.");
        }
    }
}
