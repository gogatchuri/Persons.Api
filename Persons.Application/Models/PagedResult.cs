namespace Persons.Application.Models;

public class PagedResult<T>
{
    public int Page { get; set; }
    public int PageSize { get; set; }
    public List<T> Data { get; set; }
}
