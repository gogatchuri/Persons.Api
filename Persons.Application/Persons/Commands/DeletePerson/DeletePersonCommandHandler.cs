using MediatR;
using Persons.Application.Repositories;

namespace Persons.Application.Persons.Commands.DeletePerson;

public class DeletePersonCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<DeletePersonCommand, bool>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task<bool> Handle(DeletePersonCommand request, CancellationToken cancellationToken)
    {
        var person = await _unitOfWork.Persons.GetByIdAsync(request.Id, cancellationToken).ConfigureAwait(false);
        if (person is null)
            return false;

        _unitOfWork.Persons.Delete(person);
        await _unitOfWork.SaveAsync(cancellationToken).ConfigureAwait(false);
        return true;
    }
}
