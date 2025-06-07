using MediatR;

namespace Persons.Application.Persons.Commands.DeletePerson;

public class DeletePersonCommand : IRequest<bool>
{
    public int Id { get; set; }
}

