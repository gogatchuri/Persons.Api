using MediatR;
using Persons.Application.Models;
using Persons.Application.Persons.Queries.SearchPerson.Model;
using Persons.Application.Repositories;

namespace Persons.Application.Persons.Queries.SearchPerson;

public class SearchPersonQueryHandler(IUnitOfWork unitOfWork)
    : IRequestHandler<SearchPersonQuery, PagedResult<SearchPersonResponse>>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<PagedResult<SearchPersonResponse>> Handle(SearchPersonQuery request, CancellationToken cancellationToken)
    {
        var personsList = await _unitOfWork.Persons.GetAllByConditionAsync(request, cancellationToken).ConfigureAwait(false);

        var result = personsList
            .Select(p => new SearchPersonResponse
            {
                FirstName = p.FirstName,
                LastName = p.LastName,
                PersonalNumber = p.PersonalNumber,
                CityId = p.City.Id,
                CityName = p.City.Name,
                Gender = p.Gender,
                DateOfBirth = p.DateOfBirth,
                PicturePath = p.PicturePath,
                PhoneNumbers = p.PhoneNumbers?.Select(pn => new PhoneNumber
                {
                    Number = pn.Number,
                    Type = pn.Type
                }).ToList() ?? [],
                RelatedPersons = p.RelatedPersons?.Select(rp => new RelatedPerson
                {
                    RelatedToId = rp.RelatedToId,
                    RelationType = rp.RelationType
                }).ToList() ?? []
            })
            .ToList();

        return new PagedResult<SearchPersonResponse>
        {
            Page = request.Page,
            PageSize = request.PageSize,
            Data = result
        };
    }
}