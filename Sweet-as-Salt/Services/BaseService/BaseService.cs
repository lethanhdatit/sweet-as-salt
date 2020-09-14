using Microsoft.EntityFrameworkCore;
using Sweet_as_Salt.Repositories;
using Sweet_as_Salt.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Sweet_as_Salt.Services
{
    public abstract class BaseService<TEntity> : IBaseService<TEntity>
        where TEntity : class
    {
        protected readonly IUnitOfWork _unitOfWork;

        protected abstract IGenericRepository<TEntity> _reponsitory { get; }

        public BaseService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public virtual async Task<TEntity> CreateAsync(TEntity dto)
        {
            _reponsitory.Add(dto);

            await _unitOfWork.SaveChangesAsync();

            return dto;
        }

        public virtual async Task<TEntity> UpdateAsync(TEntity dto)
        {
            _reponsitory.Update(dto);

            await _unitOfWork.SaveChangesAsync();

            return dto;

        }

        public virtual async Task DeleteAsync(object id)
        {
            var entity = await _reponsitory.FindByIdAsync(id);

            if (entity == null) throw new Exception("Not found entity object with id: " + id);

            _reponsitory.Delete(entity);

            await _unitOfWork.SaveChangesAsync();
        }

        public virtual async Task<TEntity> FindByIdAsync(object id)
        {
            return await _reponsitory.FindByIdAsync(id);
        }
    }
}
