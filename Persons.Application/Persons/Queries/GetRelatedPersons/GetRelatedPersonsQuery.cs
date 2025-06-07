using MediatR;
using Persons.Application.Enums;
using Persons.Application.Persons.Queries.GetRelatedPersons.Model;

namespace Persons.Application.Persons.Queries.GetRelatedPersons;

public class GetRelatedPersonsQuery : IRequest<List<RelatedPersonsQueryResponse>>
{
    public RelationType? RelationType { get; set; }
}

