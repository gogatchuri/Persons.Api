using MediatR;
using Persons.Application.Enums;

namespace Persons.Application.Persons.Commands.AddRelatedPerson;

public class AddRelatedPersonCommand : IRequest<int>
{
    public RelationType RelationType { get; set; }
    public int PersonId { get; set; }
    public int RelatedToId { get; set; }
}
