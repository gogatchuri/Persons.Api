using MediatR;
using Persons.Application.Persons.Commands.CreatePerson.Model;
using Persons.Application.Repositories;
using Persons.Domain.Entities;
using Persons.Domain.Enums;

namespace Persons.Application.Persons.Commands.CreatePerson;

public class CreatePersonCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<CreatePersonCommand, CreatePersonResponse>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<CreatePersonResponse> Handle(CreatePersonCommand request, CancellationToken cancellationToken)
    {
        var person = new Person
        {
            FirstName = request.FirstName,
            LastName = request.LastName,
            Gender = (Gender)request.Gender,
            PersonalNumber = request.PersonalNumber,
            DateOfBirth = request.DateOfBirth,
            CityId = request.CityId,
            PhoneNumbers = request.PhoneNumbers?.Select(p => new PhoneNumber
            {
                Number = p.Number,
                Type = (PhoneType)p.Type
            }).ToList(),
            PicturePath = request.PicturePath,
            RelatedPersons = request.RelatedPersons?.Select(p => new RelatedPerson
            {
                RelationType = (RelationType)p.RelationType,
                RelatedToId = p.RelatedToId
            }).ToList()
        };

        await _unitOfWork.Persons.AddAsync(person, cancellationToken).ConfigureAwait(false);
        await _unitOfWork.SaveAsync(cancellationToken).ConfigureAwait(false);

        return new CreatePersonResponse() { Id = person.Id };
    }
}

