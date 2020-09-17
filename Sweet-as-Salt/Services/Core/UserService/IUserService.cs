using Sweet_as_Salt.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Sweet_as_Salt.Services
{
    public interface IUserService : IBaseService<Users>
    {
        Task<Users> SubmitAsync(Users user);
        IEnumerable<Users> GetAllActive(string includeProperties = "");
    }
}
