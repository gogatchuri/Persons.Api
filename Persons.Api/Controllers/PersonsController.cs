using MediatR;
using Microsoft.AspNetCore.Mvc;
using Persons.Application.Persons.Commands.AddRelatedPerson;
using Persons.Application.Persons.Commands.CreatePerson.Model;
using Persons.Application.Persons.Commands.CreatePerson;
using Persons.Application.Persons.Commands.DeletePerson;
using Persons.Application.Persons.Commands.RemoveRelatedPerson;
using Persons.Application.Persons.Commands.UpdatePerson;
using Persons.Application.Persons.Commands.UploadPersonImage;
using Persons.Application.Persons.Queries.GetPersonById.Model;
using Persons.Application.Persons.Queries.GetPersonById;
using Persons.Application.Persons.Queries.GetRelatedPersons;
using Persons.Application.Persons.Queries.SearchPerson.Model;
using Persons.Application.Persons.Queries.SearchPerson;
using Persons.Domain.Enums;

namespace Persons.Api.Controllers;

[ApiController]
[Route("Api/[controller]")]
public class PersonsController(IMediator mediator) : ControllerBase
{
    private readonly IMediator _mediator = mediator;

    [HttpPost]
    public async Task<ActionResult<CreatePersonResponse>> CreatePerson([FromBody] CreatePersonCommand request, CancellationToken cancellationToken)
        => Ok(await _mediator.Send(request, cancellationToken).ConfigureAwait(false));

    [HttpPut]
    public async Task<IActionResult> UpdatePerson([FromBody] UpdatePersonCommand request, CancellationToken cancellationToken)
    {
        var result = await _mediator.Send(request, cancellationToken).ConfigureAwait(false);
        if (result is null)
            return NotFound();

        return Ok(result);
    }

    [HttpPost("{personId}/Upload-image")]
    public async Task<IActionResult> UploadPersonImage(int personId, IFormFile file)
    {
        var command = new UploadPersonImageCommand
        {
            PersonId = personId,
            File = file
        };

        var result = await _mediator.Send(command).ConfigureAwait(false);
        if (result is null)
            return NotFound();

        return Ok(result);
    }

    [HttpPost("RelatedPerson")]
    public async Task<IActionResult> AddRelatedPerson([FromBody] AddRelatedPersonCommand request, CancellationToken cancellationToken)
    {
        var result = await _mediator.Send(request, cancellationToken).ConfigureAwait(false);

        if (result == 0)
            return NotFound();

        return Ok(result);

    }

    [HttpDelete("{personId}/Related/{relatedToId}")]
    public async Task<IActionResult> RemoveRelatedPerson(int personId, int relatedToId, CancellationToken cancellationToken)
    {
        var command = new RemoveRelatedPersonCommand
        {
            PersonId = personId,
            RelatedToId = relatedToId
        };

        var result = await _mediator.Send(command, cancellationToken).ConfigureAwait(false);

        if (!result)
            return NotFound();

        return NoContent();
    }


    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id, CancellationToken cancellationToken)
    {
        var command = new DeletePersonCommand { Id = id };
        var result = await _mediator.Send(command, cancellationToken).ConfigureAwait(false);

        if (!result)
            return NotFound();

        return NoContent();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<GetPersonByIdResponse>> GetPersonById(int id, CancellationToken cancellationToken)
    {
        var query = new GetPersonByIdQuery
        {
            Id = id
        };

        var result = await _mediator.Send(query, cancellationToken).ConfigureAwait(false);
        if (result is null)
            return NotFound();

        return Ok(result);
    }

    [HttpGet("Search")]
    public async Task<IActionResult> Search([FromQuery] SearchPersonQuery request, CancellationToken cancellationToken)
    {
        var result = await _mediator.Send(request, cancellationToken).ConfigureAwait(false);

        return Ok(result);
    }

    [HttpGet("related-count")]
    public async Task<IActionResult> GetRelatedPersonsReport([FromQuery] RelationType? relationType, CancellationToken cancellationToken)
    {
        var query = new GetRelatedPersonsQuery
        {
            RelationType = relationType
        };

        var result = await _mediator.Send(query, cancellationToken).ConfigureAwait(false);

        if (result.Count == 0)
            return NotFound();

        return Ok(result);
    }
}

