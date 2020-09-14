using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Sweet_as_Salt.Services;

namespace Sweet_as_Salt.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class QuestionController : ControllerBase
    {
        private readonly ILogger<ApiActionController> _logger;
        private readonly IQuestionService _questionService;
        public QuestionController(ILogger<ApiActionController> logger, IQuestionService questionService)
        {
            _logger = logger;
            _questionService = questionService;
        }

        [HttpGet]
        public IEnumerable<QuestionDto> Get()
        {
            var data = _questionService.GetAllActive("Character")?.Select(x => new QuestionDto(x));
            return data;
        }
    }
}
