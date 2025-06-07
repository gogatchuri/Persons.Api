using Persons.Domain.Entities;

namespace Persons.Application.Repositories;

public interface IUnitOfWork
{
    IPersonRepository Persons { get; }
    IRelatedPersonRepository RelatedPersons { get; }
    Task<int> SaveAsync(CancellationToken cancellationToken);
}

