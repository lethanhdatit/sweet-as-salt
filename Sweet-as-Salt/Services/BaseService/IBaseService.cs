using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Sweet_as_Salt.Services
{
    public interface IBaseService<TEntity>
        where TEntity : class
    {
        Task<TEntity> CreateAsync(TEntity dto);

        Task<TEntity> UpdateAsync(TEntity dto);

        Task DeleteAsync(object keyValues);

        Task<TEntity> FindByIdAsync(object keyValues);

    }
}
