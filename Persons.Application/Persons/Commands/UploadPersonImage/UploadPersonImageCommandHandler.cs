using MediatR;
using Microsoft.AspNetCore.Hosting;
using Persons.Application.Persons.Commands.UploadPersonImage.Model;
using Persons.Application.Repositories;

namespace Persons.Application.Persons.Commands.UploadPersonImage;

public class UploadPersonImageCommandHandler
    (IUnitOfWork unitOfWork, IWebHostEnvironment environment)
    : IRequestHandler<UploadPersonImageCommand, UploadPersonImageResponse>
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;
    private readonly IWebHostEnvironment _environment = environment;

    public async Task<UploadPersonImageResponse> Handle(UploadPersonImageCommand request, CancellationToken cancellationToken)
    {
        var person = await _unitOfWork.Persons.GetByIdAsync(request.PersonId, cancellationToken).ConfigureAwait(false);
        if (person is null)
            return null;

        var uploadsFolder = Path.Combine(_environment.WebRootPath ?? "wwwroot", "images");
        if (!Directory.Exists(uploadsFolder))
            Directory.CreateDirectory(uploadsFolder);

        var fileName = $"{Guid.NewGuid()}_{request.File.FileName}";
        var filePath = Path.Combine(uploadsFolder, fileName);

        using (var stream = new FileStream(filePath, FileMode.Create))
        {
            await request.File.CopyToAsync(stream, cancellationToken);
        }

        person.PicturePath = Path.Combine("images", fileName);
        _unitOfWork.Persons.Update(person);
        await _unitOfWork.SaveAsync(cancellationToken).ConfigureAwait(false);

        return new UploadPersonImageResponse
        {
            Message = "Image uploaded successfully.",
            Path = person.PicturePath
        };
    }
}