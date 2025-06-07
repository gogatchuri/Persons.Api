using MediatR;
using Persons.Application.Repositories;

namespace Persons.Application.Persons.Commands.RemoveRelatedPerson;

public class RemoveRelatedPersonCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<RemoveRelatedPersonCommand, bool>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<bool> Handle(RemoveRelatedPersonCommand request, CancellationToken cancellationToken)
    {
        var relation = await _unitOfWork.RelatedPersons
            .GetByConditionAsync(r => r.PersonId == request.PersonId
                                    && r.RelatedToId == request.RelatedToId).ConfigureAwait(false);

        if (relation is null)
            return false;

        _unitOfWork.RelatedPersons.Delete(relation);
        await _unitOfWork.SaveAsync(cancellationToken).ConfigureAwait(false);

        return true;
    }
}
