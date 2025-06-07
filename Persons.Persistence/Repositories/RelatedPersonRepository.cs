using Azure.Core;
using Microsoft.EntityFrameworkCore;
using Persons.Application.Repositories;
using Persons.Domain.Entities;
using Persons.Persistence.Contexts;
using System.Linq.Expressions;

namespace Persons.Persistence.Repositories;

public class RelatedPersonRepository(PersonsDbContext context) : Repository<RelatedPerson>(context), IRelatedPersonRepository
{
    public async Task<RelatedPerson> GetByConditionAsync(int personId, int relatedToId) 
        => await _dbSet.FirstOrDefaultAsync(r => r.PersonId == personId && r.RelatedToId == relatedToId);
}
