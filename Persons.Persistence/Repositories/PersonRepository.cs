using Microsoft.EntityFrameworkCore;
using Persons.Application.Repositories;
using Persons.Domain.Entities;
using Persons.Persistence.Contexts;
using System.Linq.Expressions;

namespace Persons.Persistence.Repositories;

public class PersonRepository(PersonsDbContext context) : Repository<Person>(context), IPersonRepository
{

    public async Task<IEnumerable<Person>> GetAllByConditionAsync(Expression<Func<Person, bool>> filter, CancellationToken cancellationToken)
        => await _dbSet
            .Include(p => p.City)
            .Include(p => p.PhoneNumbers)
            .Include(p => p.RelatedPersons)
            .ThenInclude(r => r.RelatedTo)
            .Where(filter)
            .ToListAsync(cancellationToken).ConfigureAwait(false);

    public async Task<Person> GetByIdAsync(int id, CancellationToken cancellationToken) 
        => await _dbSet
            .Include(p => p.City)
            .Include(p => p.PhoneNumbers)
            .Include(p => p.RelatedPersons)
            .ThenInclude(r => r.RelatedTo)
            .FirstOrDefaultAsync(p => p.Id == id, cancellationToken);

    public void Update(Person entity) => _dbSet.Update(entity);

}

