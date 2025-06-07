using FluentValidation;
using Microsoft.Extensions.Localization;
using Persons.Application.Resources;
using System.Text.RegularExpressions;

namespace Persons.Application.Persons.Commands.UpdatePerson;

public class UpdatePersonCommandValidator : AbstractValidator<UpdatePersonCommand>
{
    public UpdatePersonCommandValidator(IStringLocalizer<SharedResource> localizer)
    {
        RuleFor(x => x.FirstName)
            .NotEmpty()
            .WithMessage(localizer["FirstNameMandatoryValidation"])
            .MinimumLength(2)
            .WithMessage(localizer["FirstNameMinMaxValidation"])
            .MaximumLength(50)
            .WithMessage(localizer["FirstNameMinMaxValidation"])
            .Must(BeOnlyEnglishOrOnlyGeorgian)
            .WithMessage(localizer["FirstNameLetterValidation"]);

        RuleFor(x => x.LastName)
            .NotEmpty()
            .WithMessage(localizer["LastNameMandatoryValidation"])
            .MinimumLength(2)
            .WithMessage(localizer["LastNameMinMaxValidation"])
            .MaximumLength(50)
            .WithMessage(localizer["LastNameMinMaxValidation"])
            .Must(BeOnlyEnglishOrOnlyGeorgian)
            .WithMessage(localizer["LastNameLetterValidation"]);

        RuleFor(x => x.Gender)
            .IsInEnum()
            .WithMessage(localizer["GenderAllowedValidation"]);

        RuleFor(x => x.PersonalNumber)
            .NotEmpty()
            .WithMessage(localizer["PersonalNumberMandatoryValidation"])
            .Matches(@"^\d{11}$")
            .WithMessage(localizer["PersonalNumberDigitValidation"]); ;

        RuleFor(x => x.DateOfBirth)
            .NotEmpty()
            .WithMessage(localizer["DateOfBirthMandatoryValidation"])
            .LessThanOrEqualTo(DateTime.Today.AddYears(-18))
            .WithMessage(localizer["PersonAgeValidation"]);


        RuleFor(x => x.CityId)
            .NotEqual(0)
            .WithMessage(localizer["CityIdValidation"]);

        RuleForEach(x => x.PhoneNumbers).ChildRules(phone =>
        {
            phone.RuleFor(p => p.Number)
                .MinimumLength(4)
                .WithMessage(localizer["NumberMinMaxValidation"])
                .MaximumLength(50)
                .WithMessage(localizer["NumberMinMaxValidation"]);

            phone.RuleFor(p => p.Type)
                .IsInEnum()
                .WithMessage(localizer["NumberAllowedValidation"]);
        });

    }

    private bool BeOnlyEnglishOrOnlyGeorgian(string name)
    {
        if (string.IsNullOrWhiteSpace(name))
            return false;

        var isEnglish = Regex.IsMatch(name, @"^[a-zA-Z\s\-]+$");
        var isGeorgian = Regex.IsMatch(name, @"^[ა-ჰ\s\-]+$");

        return isEnglish || isGeorgian;
    }
}
