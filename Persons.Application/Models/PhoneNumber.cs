using Persons.Application.Enums;

namespace Persons.Application.Models;

public class PhoneNumber
{
    public string Number { get; set; }
    public PhoneType Type { get; set; }
}