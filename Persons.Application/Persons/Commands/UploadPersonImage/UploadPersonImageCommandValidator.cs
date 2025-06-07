using FluentValidation;

namespace Persons.Application.Persons.Commands.UploadPersonImage;

public class UploadPersonImageCommandValidator : AbstractValidator<UploadPersonImageCommand>
{
    public UploadPersonImageCommandValidator()
    {
        RuleFor(x => x.File)
            .NotEmpty()
            .WithMessage("File is missing.");
    }
}
