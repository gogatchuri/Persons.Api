using Persons.Application.Repositories;
using Persons.Domain.Entities;
using Persons.Persistence.Contexts;

namespace Persons.Persistence.Repositories;

public class UnitOfWork(PersonsDbContext context) : IUnitOfWork
{
    private readonly PersonsDbContext _context = context;

    public IPersonRepository Persons { get; } = new PersonRepository(context);
    public IRelatedPersonRepository RelatedPersons { get; } = new RelatedPersonRepository(context);

    public async Task<int> SaveAsync(CancellationToken cancellationToken) => await _context.SaveChangesAsync(cancellationToken).ConfigureAwait(false);

    public void Dispose() => _context.Dispose();
}
