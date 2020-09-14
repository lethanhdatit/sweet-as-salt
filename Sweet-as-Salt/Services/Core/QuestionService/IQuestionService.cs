using Sweet_as_Salt.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Sweet_as_Salt.Services
{
    public interface IQuestionService : IBaseService<Questions>
    {
        Task SubmitAsync(Questions question);
        IEnumerable<Questions> GetAllActive(string includeProperties = "");
    }
}
