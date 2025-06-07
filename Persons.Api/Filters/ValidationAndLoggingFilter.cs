using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;

namespace Persons.Api.Filters;

public class ValidationAndLoggingFilter
    (ILogger<ValidationAndLoggingFilter> logger) : IActionFilter
{
    private readonly ILogger<ValidationAndLoggingFilter> _logger = logger;

    public void OnActionExecuting(ActionExecutingContext context)
    {
        _logger.LogInformation("Executing action: {Action}", context.ActionDescriptor.DisplayName);

        if (!context.ModelState.IsValid)
        {
            _logger.LogWarning("Model state is invalid for {Action}", context.ActionDescriptor.DisplayName);
            context.Result = new BadRequestObjectResult(context.ModelState);
        }
    }

    public void OnActionExecuted(ActionExecutedContext context)
    {
        _logger.LogInformation("Executed action: {Action}", context.ActionDescriptor.DisplayName);
    }
}

