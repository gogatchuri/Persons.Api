using MediatR;
using Persons.Application.Enums;
using Persons.Application.Models;
using Persons.Application.Persons.Commands.CreatePerson.Model;

namespace Persons.Application.Persons.Commands.CreatePerson;

public class CreatePersonCommand : IRequest<CreatePersonResponse>
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public Gender Gender { get; set; }
    public string PersonalNumber { get; set; }
    public DateTime DateOfBirth { get; set; }
    public int CityId { get; set; }
    public List<PhoneNumber> PhoneNumbers { get; set; }
    public string PicturePath { get; set; }
    public List<RelatedPerson> RelatedPersons { get; set; }
}
