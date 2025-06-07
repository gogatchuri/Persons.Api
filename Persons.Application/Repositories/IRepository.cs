using System.Linq.Expressions;

namespace Persons.Application.Repositories;

public interface IRepository<T> where T : class
{
    Task AddAsync(T entity, CancellationToken cancellationToken);
    void Delete(T entity);
}