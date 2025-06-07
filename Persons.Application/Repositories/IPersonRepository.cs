using Persons.Application.Persons.Queries.GetRelatedPersons;
using Persons.Application.Persons.Queries.SearchPerson;
using Persons.Domain.Entities;
using System.Linq.Expressions;

namespace Persons.Application.Repositories;

public interface IPersonRepository : IRepository<Person>
{
    Task<Person> GetByIdAsync(int id, CancellationToken cancellationToken);
    Task<IEnumerable<Person>> GetAllByConditionAsync(SearchPersonQuery request, CancellationToken cancellationToken);
    Task<IEnumerable<Person>> GetByRelationTypeAsync(GetRelatedPersonsQuery request, CancellationToken cancellationToken);
}
