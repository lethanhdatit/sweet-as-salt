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
    public class CharacterService : BaseService<Characters>, ICharacterService
    {
        public CharacterService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        protected override IGenericRepository<Characters> _reponsitory => _unitOfWork.CharacterRepository;

        public IEnumerable<Characters> GetAllActive(string includeProperties = "")
        {
            return _reponsitory.Find(x => x.Status == (byte)BaseEnumStatus.Active, includeProperties: includeProperties);
        }
    }
}
