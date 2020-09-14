using Sweet_as_Salt.Entities;
using Sweet_as_Salt.Repositories;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Sweet_as_Salt.UnitOfWork
{
    public interface IUnitOfWork : IDisposable
    {
        IGenericRepository<Characters> CharacterRepository { get; }
        IGenericRepository<Questions> QuestionRepository { get; }
        IGenericRepository<Users> UserRepository { get; }
        IGenericRepository<QuestionnaireUsers> QuestionnaireUserRepository { get; }

        Task<int> SaveChangesAsync();
        void SaveChanges();
    }
}
