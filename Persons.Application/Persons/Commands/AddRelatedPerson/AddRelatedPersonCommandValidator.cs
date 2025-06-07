using FluentValidation;
using Persons.Application.Resources;
using Microsoft.Extensions.Localization;

namespace Persons.Application.Persons.Commands.AddRelatedPerson;

public class AddRelatedPersonCommandValidator : AbstractValidator<AddRelatedPersonCommand>
{
    public AddRelatedPersonCommandValidator(IStringLocalizer<SharedResource> localizer)
    {
        RuleFor(x => x.RelationType)
            .IsInEnum()
            .WithMessage(localizer["RelationTypeAllowedValidation"]);
    }
}

