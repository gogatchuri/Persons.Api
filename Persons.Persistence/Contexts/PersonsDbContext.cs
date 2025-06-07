using Microsoft.EntityFrameworkCore;
using Persons.Domain.Entities;

namespace Persons.Persistence.Contexts;

public class PersonsDbContext(DbContextOptions<PersonsDbContext> options) : DbContext(options)
{
    public DbSet<Person> Persons { get; set; }
    public DbSet<City> Cities { get; set; }
    public DbSet<PhoneNumber> PhoneNumbers { get; set; }
    public DbSet<RelatedPerson> RelatedPersons { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Person>()
            .HasMany(p => p.PhoneNumbers)
            .WithOne(p => p.Person)
            .HasForeignKey(p => p.PersonId)
            .OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<Person>()
            .HasMany(p => p.RelatedPersons)
            .WithOne(r => r.Person)
            .HasForeignKey(r => r.PersonId)
            .OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<Person>(entity =>
        {
            entity.Property(p => p.Gender)
                  .HasConversion<string>()
                  .HasMaxLength(10)
                  .IsRequired();
        });

        modelBuilder.Entity<PhoneNumber>(entity =>
        {
            entity.Property(p => p.Type)
                  .HasConversion<string>()
                  .HasMaxLength(20)
                  .IsRequired();
        });

        modelBuilder.Entity<RelatedPerson>(entity =>
        {
            entity.Property(p => p.RelationType)
                  .HasConversion<string>()
                  .HasMaxLength(20)
                  .IsRequired();
        });

        modelBuilder.Entity<RelatedPerson>()
            .HasOne(r => r.RelatedTo)
            .WithMany()
            .HasForeignKey(r => r.RelatedToId)
            .IsRequired(false)
            .OnDelete(DeleteBehavior.Cascade);
    }
}
