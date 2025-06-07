using MediatR;
using Persons.Application.Models;
using Persons.Application.Persons.Commands.UpdatePerson.Model;
using Persons.Domain.Enums;

namespace Persons.Application.Persons.Commands.UpdatePerson;

public class UpdatePersonCommand : IRequest<UpdatePersonResponse>
{
    public int Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public Gender Gender { get; set; }
    public string PersonalNumber { get; set; }
    public DateTime DateOfBirth { get; set; }
    public int CityId { get; set; }
    public List<PhoneNumber> PhoneNumbers { get; set; }
}