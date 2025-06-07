using MediatR;
using Persons.Application.Persons.Queries.GetRelatedPersons.Model;
using Persons.Domain.Enums;

namespace Persons.Application.Persons.Queries.GetRelatedPersons;

public class GetRelatedPersonsQuery : IRequest<List<RelatedPersonsQueryResponse>>
{
    public RelationType? RelationType { get; set; }
}

