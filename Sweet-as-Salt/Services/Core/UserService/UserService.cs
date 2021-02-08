using Sweet_as_Salt.Common;
using Sweet_as_Salt.Entities;
using Sweet_as_Salt.Repositories;
using Sweet_as_Salt.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sweet_as_Salt.Services
{
    public class UserService : BaseService<Users>, IUserService
    {
        public UserService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        protected override IGenericRepository<Users> _reponsitory => _unitOfWork.UserRepository;

        public IEnumerable<Users> GetAllActive(string includeProperties = "")
        {
            return _reponsitory.Find(x => x.Status == (byte)BaseEnumStatus.Active, includeProperties: includeProperties);
        }

        public async Task<Users> SubmitAsync(Users user)
        {
            user.CreatedTs = DateTime.UtcNow;
            //await CreateAsync(productDto);
            _reponsitory.Add(user);
            _unitOfWork.SaveChanges();
            return user;
        }
    }
}
