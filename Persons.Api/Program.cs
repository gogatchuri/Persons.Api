using Persons.Api;
using Persons.Api.Filters;
using Persons.Api.Middlewares;
using Persons.Application;
using Persons.Persistence;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddApplication()
                .AddPersistenceService(builder.Configuration)
                .AddPresentationServices(builder.Configuration);



builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.OperationFilter<AcceptLanguageHeaderOperationFilter>();
});


var app = builder.Build();

app.UseRequestLocalization();

app.UseMiddleware<ExceptionLoggingMiddleware>();

app.UseSwagger();
app.UseSwaggerUI();

// Configure the HTTP request pipeline.

app.UseHttpsRedirection();
app.MapControllers();



app.Run();

