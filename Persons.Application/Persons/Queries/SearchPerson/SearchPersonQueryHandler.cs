using MediatR;
using Persons.Application.Enums;
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

        var total = personsList.Count();

        var result = personsList
            .OrderByDescending(s => s.Id)
            .Skip((request.Page - 1) * request.PageSize)
            .Take(request.PageSize)
            .OrderBy(s => s.Id)
            .Select(p => new SearchPersonResponse
            {
                FirstName = p.FirstName,
                LastName = p.LastName,
                PersonalNumber = p.PersonalNumber,
                CityId = p.City.Id,
                CityName = p.City.Name,
                Gender = (Gender)p.Gender,
                DateOfBirth = p.DateOfBirth,
                PicturePath = p.PicturePath,
                PhoneNumbers = p.PhoneNumbers?.Select(pn => new Models.PhoneNumber
                {
                    Number = pn.Number,
                    Type = (PhoneType)pn.Type
                }).ToList() ?? new List<Models.PhoneNumber>(),
                RelatedPersons = p.RelatedPersons?.Select(rp => new Models.RelatedPerson
                {
                    RelatedToId = rp.RelatedToId,
                    RelationType = (RelationType)rp.RelationType
                }).ToList() ?? new List<Models.RelatedPerson>()
            })
            .ToList();

        return new PagedResult<SearchPersonResponse>
        {
            Total = total,
            Page = request.Page,
            PageSize = request.PageSize,
            Data = result
        };
    }
}