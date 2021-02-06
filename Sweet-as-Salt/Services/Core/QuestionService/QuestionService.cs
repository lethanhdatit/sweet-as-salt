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
    public class QuestionService : BaseService<Questions>, IQuestionService
    {
        public QuestionService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        protected override IGenericRepository<Questions> _reponsitory => _unitOfWork.QuestionRepository;

        public IEnumerable<Questions> GetAllActive(string includeProperties = "")
        {
            return _reponsitory.Find(x => x.Status == (byte)BaseEnumStatus.Active, includeProperties: includeProperties);
        }

        public async Task SubmitAsync(Questions question)
        {
            question.CreatedTs = DateTime.UtcNow;
            //await CreateAsync(productDto);
            _reponsitory.Add(question);
            _unitOfWork.SaveChanges();
        }
    }
}
