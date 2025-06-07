using Persons.Application.Enums;

namespace Persons.Application.Persons.Queries.GetRelatedPersons.Model;

public class RelatedPersonsQueryResponse
{
    public int PersonId { get; set; }
    public string FullName { get; set; }
    public List<RelatedPersonModel> RelatedPersons { get; set; }
}


public class RelatedPersonModel
{
    public string RelatedPersonFullName { get; set; }
    public RelationType RelationType { get; set; }
}

