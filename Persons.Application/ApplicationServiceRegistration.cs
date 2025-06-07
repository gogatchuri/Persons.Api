using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.Extensions.DependencyInjection;
using System.Reflection;

namespace Persons.Application;

public static class ApplicationServiceRegistration
{
    public static IServiceCollection AddApplication(this IServiceCollection services)
    {
        Assembly[] assemblies = AppDomain.CurrentDomain.GetAssemblies();

        AddMediatR(services, assemblies);
        AddFluentValidation(services, assemblies);

        return services;
    }

    public static void AddFluentValidation(IServiceCollection services, Assembly[] assemblies)
    {
        services.AddFluentValidationAutoValidation();
        services.AddFluentValidationClientsideAdapters();
        services.AddValidatorsFromAssemblies(assemblies);
    }

    public static void AddMediatR(IServiceCollection services, Assembly[] assemblies)
    {
        foreach (var item in assemblies)
        {
            services.AddMediatR(cfg => {
                cfg.RegisterServicesFromAssembly(item);
            });
        }
    }
}
