using Persons.Domain.Entities;
using System.Linq.Expressions;

namespace Persons.Application.Repositories;

public interface IRelatedPersonRepository : IRepository<RelatedPerson>
{
    Task<RelatedPerson> GetByConditionAsync(Expression<Func<RelatedPerson, bool>> filter);
}
