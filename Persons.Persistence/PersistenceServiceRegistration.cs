using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Persons.Application.Repositories;
using Persons.Persistence.Contexts;
using Persons.Persistence.Repositories;

namespace Persons.Persistence;

public static class PersistenceServiceRegistration
{
    public static IServiceCollection AddPersistenceService(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<PersonsDbContext>(opt =>
            opt.UseSqlServer(
                configuration.GetConnectionString("DefaultConnection")));


        services.AddScoped<IUnitOfWork, UnitOfWork>();

        return services;
    }
}