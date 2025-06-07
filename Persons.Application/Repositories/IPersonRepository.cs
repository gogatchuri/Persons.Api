using Persons.Domain.Entities;
using System.Linq.Expressions;

namespace Persons.Application.Repositories;

public interface IPersonRepository : IRepository<Person>
{
    Task<Person> GetByIdAsync(int id, CancellationToken cancellationToken);
    Task<IEnumerable<Person>> GetAllByConditionAsync(Expression<Func<Person, bool>> filter, CancellationToken cancellationToken);
    void Update(Person entity);
}
