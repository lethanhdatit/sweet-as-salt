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
    public class QuestionnaireUserService : BaseService<QuestionnaireUsers>, IQuestionnaireUserService
    {
        public QuestionnaireUserService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        protected override IGenericRepository<QuestionnaireUsers> _reponsitory => _unitOfWork.QuestionnaireUserRepository;

        public IEnumerable<QuestionnaireUsers> GetAll(string includeProperties = "")
        {
            return _reponsitory.Find(includeProperties: includeProperties);
        }

        public async Task<QuestionnaireUsers> SubmitAsync(QuestionnaireUsers questionnaireUser)
        {
            //await CreateAsync(productDto);
            _reponsitory.Add(questionnaireUser);
            _unitOfWork.SaveChanges();
            return questionnaireUser;
        }
        public async Task<IEnumerable<QuestionnaireUsers>> SubmitRangeAsync(IEnumerable<QuestionnaireUsers> questionnaireUsers)
        {
            //await CreateAsync(productDto);
            _reponsitory.AddRange(questionnaireUsers);
            _unitOfWork.SaveChanges();
            return questionnaireUsers;
        }
    }
}
