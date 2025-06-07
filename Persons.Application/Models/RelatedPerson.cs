using Persons.Domain.Enums;

namespace Persons.Application.Models;

public class RelatedPerson
{
    public RelationType RelationType { get; set; }
    public int RelatedToId { get; set; }
}
