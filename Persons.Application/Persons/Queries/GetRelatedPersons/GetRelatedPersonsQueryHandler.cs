using MediatR;
using Microsoft.EntityFrameworkCore;
using Persons.Application.Persons.Queries.GetRelatedPersons.Model;
using Persons.Application.Repositories;
using Persons.Domain.Entities;
using Persons.Domain.Enums;
using System.Linq.Expressions;

namespace Persons.Application.Persons.Queries.GetRelatedPersons;

public class GetRelatedPersonsQueryHandler(IUnitOfWork unitOfWork)
    : IRequestHandler<GetRelatedPersonsQuery, List<RelatedPersonsQueryResponse>>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<List<RelatedPersonsQueryResponse>> Handle(GetRelatedPersonsQuery request, CancellationToken cancellationToken)
    {
        Expression<Func<Person, bool>> predicate = p => true;

        if (request.RelationType.HasValue)
        {
            predicate = p => p.RelatedPersons.Any(r => r.RelationType.ToString() == request.RelationType.ToString());
        }

        var persons = await _unitOfWork.Persons.GetAllByConditionAsync(predicate, cancellationToken);

        var report = persons
            .Select(p => new RelatedPersonsQueryResponse
            {
                PersonId = p.Id,
                FullName = $"{p.FirstName} {p.LastName}",
                RelatedPersons = [.. p.RelatedPersons
                .Where(r => r.RelationType.ToString() == request.RelationType.ToString() || !request.RelationType.HasValue)
                .Select(s => new RelatedPersonModel
                {
                    RelatedPersonFullName = $"{s.RelatedTo.FirstName} {s.RelatedTo.LastName}",
                    RelationType = (Enums.RelationType)s.RelationType
                })]
            })
            .ToList();



        return report;
    }
}
