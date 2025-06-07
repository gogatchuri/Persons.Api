using MediatR;
using Persons.Application.Enums;
using Persons.Application.Persons.Queries.GetPersonById.Model;
using Persons.Application.Repositories;

namespace Persons.Application.Persons.Queries.GetPersonById;

public class GetPersonByIdQueryHandler(IUnitOfWork unitOfWork)
    : IRequestHandler<GetPersonByIdQuery, GetPersonByIdResponse>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<GetPersonByIdResponse> Handle(GetPersonByIdQuery request, CancellationToken cancellationToken)
    {
        var person = await _unitOfWork.Persons.GetByIdAsync(request.Id, cancellationToken).ConfigureAwait(false);
        if (person == null)
            return null;


        return new GetPersonByIdResponse
        {
            FirstName = person.FirstName,
            LastName = person.LastName,
            Gender = (Gender)person.Gender,
            PersonalNumber = person.PersonalNumber,
            DateOfBirth = person.DateOfBirth,
            City = person.City == null
            ? null
            : new Models.City
            {
                Id = person.City.Id,
                Name = person.City.Name
            },
            PhoneNumbers = person.PhoneNumbers?.Select(p => new Models.PhoneNumber
            {
                Number = p.Number,
                Type = (PhoneType)p.Type
            }).ToList(),
            PicturePath = person.PicturePath,
            RelatedPersons = person.RelatedPersons?.Select(p => new Models.RelatedPerson
            {
                RelatedToId = p.RelatedToId,
                RelationType = (RelationType)p.RelationType
            }).ToList()
        };

    }
}

