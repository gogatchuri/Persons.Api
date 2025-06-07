using MediatR;
using Persons.Application.Persons.Commands.UpdatePerson.Model;
using Persons.Application.Repositories;
using Persons.Domain.Entities;
using Persons.Domain.Enums;

namespace Persons.Application.Persons.Commands.UpdatePerson;

public class UpdatePersonCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<UpdatePersonCommand, UpdatePersonResponse>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<UpdatePersonResponse> Handle(UpdatePersonCommand request, CancellationToken cancellationToken)
    {
        var existing = await _unitOfWork.Persons.GetByIdAsync(request.Id, cancellationToken).ConfigureAwait(false);
        if (existing is null)
            return null;


        existing.FirstName = request.FirstName;
        existing.LastName = request.LastName;
        existing.Gender = (Gender)request.Gender;
        existing.PersonalNumber = request.PersonalNumber;
        existing.DateOfBirth = request.DateOfBirth;
        existing.CityId = request.CityId;
        existing.PhoneNumbers = request.PhoneNumbers?.Select(p => new PhoneNumber
        {
            Number = p.Number,
            Type = (PhoneType)p.Type
        }).ToList();

        _unitOfWork.Persons.Update(existing);
        await _unitOfWork.SaveAsync(cancellationToken).ConfigureAwait(false);

        return new UpdatePersonResponse() { Success = true };
    }
}
