using Persons.Domain.Entities;
using System.Linq.Expressions;

namespace Persons.Application.Repositories;

public interface IRelatedPersonRepository : IRepository<RelatedPerson>
{
    Task<RelatedPerson> GetByConditionAsync(int personId, int relatedToId);
}
