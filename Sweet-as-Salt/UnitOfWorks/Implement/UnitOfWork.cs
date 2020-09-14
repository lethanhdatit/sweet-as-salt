using Sweet_as_Salt.Entities;
using Sweet_as_Salt.Repositories;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Sweet_as_Salt.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private SweetAsSaltDBContext _context;

        public UnitOfWork(SweetAsSaltDBContext context)
        {
            _context = context;
            InitRepositories();
        }
        private void InitRepositories()
        {
            CharacterRepository = new GenericRepository<Characters>(_context);
            QuestionRepository = new GenericRepository<Questions>(_context);
            UserRepository = new GenericRepository<Users>(_context);
            QuestionnaireUserRepository = new GenericRepository<QuestionnaireUsers>(_context);
        }
        private bool disposedValue;

        public IGenericRepository<Characters> CharacterRepository { get; private set; }

        public IGenericRepository<Questions> QuestionRepository { get; private set; }

        public IGenericRepository<Users> UserRepository { get; private set; }

        public IGenericRepository<QuestionnaireUsers> QuestionnaireUserRepository { get; private set; }

        public async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }
        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    _context.Dispose();
                }

                // TODO: free unmanaged resources (unmanaged objects) and override finalizer
                // TODO: set large fields to null
                disposedValue = true;
            }
        }

        // // TODO: override finalizer only if 'Dispose(bool disposing)' has code to free unmanaged resources
        // ~UnitOfWork()
        // {
        //     // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
        //     Dispose(disposing: false);
        // }

        public void Dispose()
        {
            // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }
    }
}
