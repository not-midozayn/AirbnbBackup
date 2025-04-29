using AutoMapper;
using Azure.Core;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.ProjectModel;
using System.IdentityModel.Tokens.Jwt;
using System.Linq.Expressions;
using System.Security.Claims;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace WebApplication1.Repositories
{
    public class GenericRepository<T> : IRepository<T> where T : class
    {
        #region Dependency Injection
        private readonly AirbnbDBContext context;
        private readonly IMapper mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public GenericRepository(AirbnbDBContext _context, IMapper _mapper, IHttpContextAccessor httpContextAccessor)
        {
            context = _context;
            mapper = _mapper;
            _httpContextAccessor = httpContextAccessor;
        }
        #endregion
        public async Task UpdateAsync(T entity)
        {
            context.Set<T>().Update(entity);
            await context.SaveChangesAsync();
        }
        public void Save()
        {
            context.SaveChanges();
        }

        #region Delete Method
        public async Task DeleteAsync<T>(Guid id) where T:class
        {
            var entity = await context.Set<T>().FindAsync(id);  

            if (entity != null)
            {
                context.Set<T>().Remove(entity); 
                await context.SaveChangesAsync(); 
            }
            else
            {
                throw new Exception("Entity not found.");
            }
        }
        public async Task DeleteMultipleAsync<T>(Guid[] ids) where T : class
        {
            var entities = await context.Set<T>().Where(e => ids.Contains((Guid)e.GetType().GetProperty("Id").GetValue(e))).ToListAsync();

            if (entities.Count != 0)
            {
                context.Set<T>().RemoveRange(entities);
                await context.SaveChangesAsync();
            }
            else
            {
                throw new Exception("No entities found.");
            }
        }

        #endregion

        #region Create Method
        public async Task CreateAsync<T>(T entity) where T : class
        {
            await context.Set<T>().AddAsync(entity);
            await context.SaveChangesAsync();
        }
        #endregion

        #region Update Methods
        public async Task<T> UpdateAsync<T, TDto>(Guid id, TDto updateDto) where T : class
        {
            var entity = await context.Set<T>().FindAsync(id);
            if (entity == null)
                return null;

            mapper.Map(updateDto, entity);

            context.Set<T>().Update(entity);
            await context.SaveChangesAsync();
            return entity;
        }
        #endregion

        #region Filtering Method (Helper Method)
        private static IQueryable<T> ApplyFilters(IQueryable<T> query, Dictionary<string, string> queryParams)
        {
            foreach (var param in queryParams)
            {
                string key = param.Key;
                string value = param.Value;

                // Check for operators (e.g., Capacity_gt)
                string[] parts = key.Split('_');
                string propertyName = parts[0];
                string operatorSuffix = parts.Length > 1 ? parts[1].ToLower() : "eq";

                var propertyInfo = typeof(T).GetProperty(propertyName);
                if (propertyInfo == null)
                {
                    Console.WriteLine($"Property {propertyName} not found on {typeof(T).Name}. Skipping.");
                    continue;
                }

                try
                {
                    var propertyType = propertyInfo.PropertyType;
                    bool isNullable = Nullable.GetUnderlyingType(propertyType) != null;
                    var underlyingType = Nullable.GetUnderlyingType(propertyType) ?? propertyType;

                    object typedValue = null;

                    if (!string.IsNullOrEmpty(value))
                    {
                        if (underlyingType == typeof(Guid))
                            typedValue = Guid.Parse(value);
                        else if (underlyingType.IsEnum)
                            typedValue = Enum.Parse(underlyingType, value);
                        else
                            typedValue = Convert.ChangeType(value, underlyingType);
                    }

                    var parameter = Expression.Parameter(typeof(T), "x");
                    var propertyAccess = Expression.Property(parameter, propertyInfo);

                    // If it's nullable, access the .Value property
                    if (isNullable)
                    {
                        propertyAccess = Expression.Property(propertyAccess, "Value");
                    }

                    var constant = Expression.Constant(typedValue, underlyingType);

                    Expression comparison = operatorSuffix switch
                    {
                        "gt" => Expression.GreaterThan(propertyAccess, constant),
                        "lt" => Expression.LessThan(propertyAccess, constant),
                        "gte" => Expression.GreaterThanOrEqual(propertyAccess, constant),
                        "lte" => Expression.LessThanOrEqual(propertyAccess, constant),
                        "neq" => Expression.NotEqual(propertyAccess, constant),
                        _ => Expression.Equal(propertyAccess, constant), // default: equal
                    };

                    var lambda = Expression.Lambda<Func<T, bool>>(comparison, parameter);
                    query = query.Where(lambda);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error filtering {propertyName}: {ex.Message}");
                    continue;
                }
            }

            return query;
        }
        #endregion

        #region Get Methods
        public Guid GetCurrentUserId()
        {
            var authToken = _httpContextAccessor.HttpContext.Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
            var handler = new JwtSecurityTokenHandler();
            var token = handler.ReadJwtToken(authToken);
            var userId = token.Claims.First(c => c.Type == ClaimTypes.NameIdentifier).Value;
            if (userId == null)
            {
                // Log the claims for debugging
                var claims = _httpContextAccessor.HttpContext?.User?.Claims.ToList();
                if (claims != null)
                {
                    foreach (var claim in claims)
                    {
                        Console.WriteLine($"Claim Type: {claim.Type}, Value: {claim.Value}");
                    }
                }
            }
            return Guid.TryParse(userId, out var guid) ? guid : Guid.Empty;
        }

        public bool IsAuthenticated()
        {
            return _httpContextAccessor.HttpContext?.User?.Identity?.IsAuthenticated ?? false;
        }
        public async Task<IEnumerable<T>> GetAllAsync(Dictionary<string, string> queryParams, List<string> includeProperties = null)
        {
            var query = context.Set<T>().AsQueryable();
            query = ApplyFilters(query, queryParams);
            if (includeProperties != null)
            {
                foreach (var property in includeProperties)
                {
                    query = query.Include(property);
                }
            }

            if (queryParams.TryGetValue("pageNumber", out string pageNumberValue))
            {
                int pageNumber = int.Parse(pageNumberValue);
                query = query.Skip((pageNumber - 1) * 3).Take(3);
            }
            return await query.ToListAsync();


        }
        public async Task<T> GetByIDAsync(Guid id, List<string> includeProperties = null)
        {
            var query = context.Set<T>().AsQueryable();
            if (includeProperties != null)
            {
                foreach (var property in includeProperties)
                {
                    query = query.Include(property);    
                }
            }
            return await query.FirstOrDefaultAsync(e => EF.Property<Guid>(e, "Id") == id);
        }
        #endregion

        #region save changes
        public async Task SaveChangesAsync()
        {
            await context.SaveChangesAsync();
        }
        #endregion

    }
}