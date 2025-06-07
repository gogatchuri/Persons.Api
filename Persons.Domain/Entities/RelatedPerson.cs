using Persons.Domain.Enums;

namespace Persons.Domain.Entities;

public class RelatedPerson
{
    public int Id { get; set; }
    public RelationType RelationType { get; set; }

    public int PersonId { get; set; }
    public Person Person { get; set; }

    public int RelatedToId { get; set; }
    public Person RelatedTo { get; set; }
}

