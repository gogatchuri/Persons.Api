using Persons.Application.Models;
using Persons.Domain.Enums;

namespace Persons.Application.Persons.Queries.SearchPerson.Model;

public class SearchPersonResponse
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public Gender Gender { get; set; }
    public string PersonalNumber { get; set; }
    public DateTime DateOfBirth { get; set; }
    public int CityId { get; set; }
    public string CityName { get; set; }
    public List<PhoneNumber> PhoneNumbers { get; set; }
    public string PicturePath { get; set; }
    public List<RelatedPerson> RelatedPersons { get; set; }
}
