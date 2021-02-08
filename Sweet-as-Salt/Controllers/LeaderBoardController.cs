using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Sweet_as_Salt.Common;
using Sweet_as_Salt.Commons.SharedClass;
using Sweet_as_Salt.Entities;
using Sweet_as_Salt.Services;

namespace Sweet_as_Salt.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LeaderBoardController : ControllerBase
    {
        private readonly ILogger<LeaderBoardController> _logger;
        private readonly IQuestionService _questionService;
        private readonly IUserService _userService;
        private readonly IQuestionnaireUserService _questionnaireUserService;
        private readonly GlobalSettingService _globalSetting;
        public LeaderBoardController(ILogger<LeaderBoardController> logger, IQuestionService questionService, IUserService userService, IQuestionnaireUserService questionnaireUserService, GlobalSettingService globalSetting)
        {
            _logger = logger;
            _questionService = questionService;
            _userService = userService;
            _globalSetting = globalSetting;
            _questionnaireUserService = questionnaireUserService;
        }

        /// <summary>
        /// Trả về bảng xếp hạng các leader
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IEnumerable<LeaderBoard> Get()
        {
            var isRealTime = _globalSetting.Get().IS_REALTIME_LEADERBOARD;
            
            var poolData = _questionnaireUserService.GetAll("User,Question").GroupBy(x => x.User).Select(x => {
                return new LeaderBoard()
                {
                    ID = x.Key.Id,
                    Name = x.Key.FullName,
                    CreatedTS = DateTime.UtcNow,
                    TotalScore = isRealTime 
                                 ? 
                                 x.Where(w => w.Selection.HasValue).Select(w => {
                                     if (w == null || w.Question == null)
                                         return 0;
                                     return w.Question.IsCorrect == w.Selection.Value ? w.Question.Point : w.Question.Point * w.Question.InCorrectScale;
                                 }).Sum(s => s) 
                                 :
                                 x.Where(w => w.Selection.HasValue).Sum(s => s.SnapPoint.Value)
                };
            });

            return poolData.OrderByDescending(x => x.TotalScore).Select((x, index) =>
            {
                var temp = x;
                temp.Rank = (index + 1);
                return temp;
            });
        }
       
    }
}
