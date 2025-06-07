using MediatR;
using Persons.Application.Models;
using Persons.Application.Persons.Queries.SearchPerson.Model;

namespace Persons.Application.Persons.Queries.SearchPerson;

public class SearchPersonQuery(string name, string lastName, string personalNumber, int page, int pageSize)
    : IRequest<PagedResult<SearchPersonResponse>>
{
    public string Name { get; set; } = name;
    public string LastName { get; set; } = lastName;
    public string PersonalNumber { get; set; } = personalNumber;
    public int Page { get; set; } = page;
    public int PageSize { get; set; } = pageSize;
}