using MediatR;
using Persons.Application.Persons.Queries.GetPersonById.Model;

namespace Persons.Application.Persons.Queries.GetPersonById;

public class GetPersonByIdQuery : IRequest<GetPersonByIdResponse>
{
    public int Id { get; set; }
}
