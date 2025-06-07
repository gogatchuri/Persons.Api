using MediatR;
using Microsoft.AspNetCore.Http;
using Persons.Application.Persons.Commands.UploadPersonImage.Model;

namespace Persons.Application.Persons.Commands.UploadPersonImage;

public class UploadPersonImageCommand : IRequest<UploadPersonImageResponse>
{
    public int PersonId { get; set; }
    public IFormFile File { get; set; }
}