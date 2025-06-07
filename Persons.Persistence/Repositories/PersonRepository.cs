using Microsoft.EntityFrameworkCore;
using Persons.Application.Persons.Queries.GetRelatedPersons;
using Persons.Application.Persons.Queries.SearchPerson;
using Persons.Application.Repositories;
using Persons.Domain.Entities;
using Persons.Persistence.Contexts;
using System;

namespace Persons.Persistence.Repositories;

public class PersonRepository(PersonsDbContext context) : Repository<Person>(context), IPersonRepository
{

    public async Task<IEnumerable<Person>> GetAllByConditionAsync(SearchPersonQuery request, CancellationToken cancellationToken)
    {
        IQueryable<Person> query = _dbSet
            .Include(p => p.City)
            .Include(p => p.PhoneNumbers)
            .Include(p => p.RelatedPersons)
                .ThenInclude(r => r.RelatedTo)
            .OrderByDescending(s => s.Id)
            .Skip((request.Page - 1) * request.PageSize)
            .Take(request.PageSize);

        if (!string.IsNullOrWhiteSpace(request.Name))
        {
            query = query.Where(p => EF.Functions.Like(p.FirstName, $"%{request.Name}%"));
        }

        if (!string.IsNullOrWhiteSpace(request.LastName))
        {
            query = query.Where(p => EF.Functions.Like(p.LastName, $"%{request.LastName}%"));
        }

        if (!string.IsNullOrWhiteSpace(request.PersonalNumber))
        {
            query = query.Where(p => EF.Functions.Like(p.PersonalNumber, $"%{request.PersonalNumber}%"));
        }

        return await query.ToListAsync(cancellationToken).ConfigureAwait(false);
    }

    public async Task<IEnumerable<Person>> GetByRelationTypeAsync(GetRelatedPersonsQuery request, CancellationToken cancellationToken)
    {
        IQueryable<Person> query = _dbSet
            .Include(p => p.City)
            .Include(p => p.PhoneNumbers)
            .Include(p => p.RelatedPersons)
                .ThenInclude(r => r.RelatedTo);

        if (request.RelationType.HasValue)
        {
            query = query.Where(p => p.RelatedPersons.Any(r => r.RelationType.ToString() == request.RelationType.ToString()));
        }

        return await query.ToListAsync(cancellationToken).ConfigureAwait(false);
    }

    public async Task<Person> GetByIdAsync(int id, CancellationToken cancellationToken) 
        => await _dbSet
            .Include(p => p.City)
            .Include(p => p.PhoneNumbers)
            .Include(p => p.RelatedPersons)
            .ThenInclude(r => r.RelatedTo)
            .FirstOrDefaultAsync(p => p.Id == id, cancellationToken);
}

