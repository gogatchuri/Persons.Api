using Microsoft.EntityFrameworkCore;
using Persons.Application.Repositories;
using Persons.Persistence.Contexts;
using System.Linq.Expressions;

namespace Persons.Persistence.Repositories;

public class Repository<T>(PersonsDbContext context) : IRepository<T> where T : class
{
    protected readonly PersonsDbContext _context = context;
    protected readonly DbSet<T> _dbSet = context.Set<T>();

    public async Task AddAsync(T entity, CancellationToken cancellationToken) 
        => await _dbSet.AddAsync(entity, cancellationToken);

    public void Update(T entity) => _dbSet.Update(entity);
    public void Delete(T entity) => _dbSet.Remove(entity);

}