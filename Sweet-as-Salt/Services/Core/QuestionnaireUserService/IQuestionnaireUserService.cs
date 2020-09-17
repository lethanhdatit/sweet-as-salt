using Sweet_as_Salt.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Sweet_as_Salt.Services
{
    public interface IQuestionnaireUserService : IBaseService<QuestionnaireUsers>
    {
        Task<IEnumerable<QuestionnaireUsers>> SubmitRangeAsync(IEnumerable<QuestionnaireUsers> questionnaireUsers);
        Task<QuestionnaireUsers> SubmitAsync(QuestionnaireUsers questionnaireUser);
        IEnumerable<QuestionnaireUsers> GetAll(string includeProperties = "");
    }
}
