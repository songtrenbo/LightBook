using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System;
using System.IO;
using lightbook_backend_API.Data;

namespace lightbook_backend_API.Data
{
    public class ApplicationDbContextFactory : IDesignTimeDbContextFactory<LightBookDBContext>
    {
        public LightBookDBContext CreateDbContext(string[] args)
        {
            IConfigurationBuilder builder = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json");

            IConfigurationRoot config = builder.Build();

            string connectionString = config.GetConnectionString("DefaultConnection");

            var optionsBuilder = new DbContextOptionsBuilder<LightBookDBContext>();
            optionsBuilder.UseSqlServer(connectionString);

            return new LightBookDBContext(optionsBuilder.Options);
        }
    }
}
