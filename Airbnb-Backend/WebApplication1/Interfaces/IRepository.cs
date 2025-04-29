using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace WebApplication1.Interfaces
{
    public interface IRepository<T> where T : class
    {
        Task UpdateAsync(T entity);
        void Save();

        #region Async
        Task<IEnumerable<T>> GetAllAsync(Dictionary<string, string> queryParams, List<string> includeProperties = null);
        Task CreateAsync<T>(T entity) where T : class;
        Task<T> UpdateAsync<T, TDto>(Guid id, TDto updateDto) where T : class;
        Task DeleteAsync<T>(Guid id) where T : class;
        Task DeleteMultipleAsync<T>(Guid[] ids) where T : class;
        Task<T> GetByIDAsync(Guid id, List<string> includeProperties = null);
        Task SaveChangesAsync();
        #endregion
        bool IsAuthenticated();
        Guid GetCurrentUserId();
    }
}
