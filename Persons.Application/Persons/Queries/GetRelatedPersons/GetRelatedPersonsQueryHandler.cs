using MediatR;
using Persons.Application.Persons.Queries.GetRelatedPersons.Model;
using Persons.Application.Repositories;

namespace Persons.Application.Persons.Queries.GetRelatedPersons;

public class GetRelatedPersonsQueryHandler(IUnitOfWork unitOfWork)
    : IRequestHandler<GetRelatedPersonsQuery, List<RelatedPersonsQueryResponse>>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<List<RelatedPersonsQueryResponse>> Handle(GetRelatedPersonsQuery request, CancellationToken cancellationToken)
    {
        var persons = await _unitOfWork.Persons.GetByRelationTypeAsync(request, cancellationToken);

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
                    RelationType = s.RelationType
                })]
            })
            .ToList();



        return report;
    }
}
