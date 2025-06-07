using MediatR;
using Persons.Application.Repositories;
using Persons.Domain.Enums;

namespace Persons.Application.Persons.Commands.AddRelatedPerson;

public class AddRelatedPersonCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<AddRelatedPersonCommand, int>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<int> Handle(AddRelatedPersonCommand request, CancellationToken cancellationToken)
    {
        if (await _unitOfWork.Persons.GetByIdAsync(request.PersonId, cancellationToken) is null
           || await _unitOfWork.Persons.GetByIdAsync(request.RelatedToId, cancellationToken) is null)
            return 0;

        var related = new Domain.Entities.RelatedPerson
        {
            RelationType = (RelationType)request.RelationType,
            PersonId = request.PersonId,
            RelatedToId = request.RelatedToId
        };

        await _unitOfWork.RelatedPersons.AddAsync(related, cancellationToken).ConfigureAwait(false);
        await _unitOfWork.SaveAsync(cancellationToken).ConfigureAwait(false);

        return related.Id;
    }
}
