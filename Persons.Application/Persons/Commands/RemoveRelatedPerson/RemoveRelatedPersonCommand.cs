using MediatR;

namespace Persons.Application.Persons.Commands.RemoveRelatedPerson;

public class RemoveRelatedPersonCommand : IRequest<bool>
{
    public int PersonId { get; set; }
    public int RelatedToId { get; set; }
}
