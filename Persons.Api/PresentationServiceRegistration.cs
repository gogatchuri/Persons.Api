using Microsoft.AspNetCore.Localization;
using Persons.Api.Filters;
using System.Globalization;
using System.Text.Json.Serialization;
using System.Text.Json;

namespace Persons.Api;

public static class PresentationServiceRegistration
{
    public static IServiceCollection AddPresentationServices(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddControllers(options =>
        {
            options.Filters.Add<ValidationAndLoggingFilter>();
        })
        .AddJsonOptions(opt =>
        {
            opt.JsonSerializerOptions.Converters.Add(
            new JsonStringEnumConverter(JsonNamingPolicy.CamelCase, allowIntegerValues: false));
        });

        services.AddLocalization();

        services.Configure<RequestLocalizationOptions>(options =>
        {
            var supportedCultures = new[] { "en-US", "ka-GE" }
                .Select(c => new CultureInfo(c))
                .ToList();

            options.DefaultRequestCulture = new RequestCulture("en-US");
            options.SupportedCultures = supportedCultures;
            options.SupportedUICultures = supportedCultures;
        });

        return services;
    }
}
