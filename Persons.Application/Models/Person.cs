using Persons.Application.Enums;

namespace Persons.Application.Models;

public class Person
{
    public int Id { get; set; }

    public string FirstName { get; set; }

    public string LastName { get; set; }
    public Gender Gender { get; set; }
    public string PersonalNumber { get; set; }
    public DateTime DateOfBirth { get; set; }
    public int CityId { get; set; }
    public City City { get; set; }

    public List<PhoneNumber> PhoneNumbers { get; set; }

    public string PicturePath { get; set; }

    public List<RelatedPerson> RelatedPersons { get; set; }
}
