namespace Persons.Application.Persons.Queries.SearchPerson.Model;

public class SearchPersonRequest
{
    public string Name { get; set; }
    public string LastName { get; set; }
    public string PersonalNumber { get; set; }
    public int Page { get; set; } = 1;
    public int PageSize { get; set; } = 10;
}
