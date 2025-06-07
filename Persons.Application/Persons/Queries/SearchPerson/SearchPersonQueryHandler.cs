using MediatR;
using Microsoft.EntityFrameworkCore;
using Persons.Application.Enums;
using Persons.Application.Helpers;
using Persons.Application.Models;
using Persons.Application.Persons.Queries.SearchPerson.Model;
using Persons.Application.Repositories;
using Persons.Domain.Entities;
using System.Linq.Expressions;

namespace Persons.Application.Persons.Queries.SearchPerson;

public class SearchPersonQueryHandler(IUnitOfWork unitOfWork)
    : IRequestHandler<SearchPersonQuery, PagedResult<SearchPersonResponse>>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<PagedResult<SearchPersonResponse>> Handle(SearchPersonQuery request, CancellationToken cancellationToken)
    {
        Expression<Func<Domain.Entities.Person, bool>> predicate = p => true;

        if (!string.IsNullOrWhiteSpace(request.Name))
        {
            Expression<Func<Domain.Entities.Person, bool>> nameCondition = p => EF.Functions.Like(p.FirstName, $"%{request.Name}%");
            predicate = PredicateHelper.CombinePredicates(predicate, nameCondition);
        }

        if (!string.IsNullOrWhiteSpace(request.LastName))
        {
            Expression<Func<Domain.Entities.Person, bool>> lastNameCondition = p => EF.Functions.Like(p.LastName, $"%{request.LastName}%");
            predicate = PredicateHelper.CombinePredicates(predicate, lastNameCondition);
        }

        if (!string.IsNullOrWhiteSpace(request.PersonalNumber))
        {
            Expression<Func<Domain.Entities.Person, bool>> personalNumberCondition = p => EF.Functions.Like(p.PersonalNumber, $"%{request.PersonalNumber}%");
            predicate = PredicateHelper.CombinePredicates(predicate, personalNumberCondition);
        }

        var personsList = await _unitOfWork.Persons.GetAllByConditionAsync(predicate, cancellationToken).ConfigureAwait(false);

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