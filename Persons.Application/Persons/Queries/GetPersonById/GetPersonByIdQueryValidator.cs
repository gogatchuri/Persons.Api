using FluentValidation;

namespace Persons.Application.Persons.Queries.GetPersonById;

public class GetPersonByIdQueryValidator : AbstractValidator<GetPersonByIdQuery>
{
    public GetPersonByIdQueryValidator()
    {
        RuleFor(x => x.Id)
            .NotEmpty()
            .WithMessage("Id ველი სავალდებულოა");
    }
}

