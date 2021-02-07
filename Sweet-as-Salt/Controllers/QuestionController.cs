﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
    [Route("[controller]/[action]")]
    public class QuestionController : ControllerBase
    {
        private readonly ILogger<QuestionController> _logger;
        private readonly IQuestionService _questionService;
        private readonly IUserService _userService;
        private readonly IQuestionnaireUserService _questionnaireUserService;
        private readonly ICharacterService _characterService;
        private readonly GlobalSettingService _globalSetting;
        public QuestionController(ILogger<QuestionController> logger, 
                                  IQuestionService questionService, 
                                  IUserService userService, 
                                  IQuestionnaireUserService questionnaireUserService,
                                  ICharacterService characterService,
                                  GlobalSettingService globalSetting)
        {
            _logger = logger;
            _questionService = questionService;
            _userService = userService;
            _globalSetting = globalSetting;
            _questionnaireUserService = questionnaireUserService;
            _characterService = characterService;
        }

        /// <summary>
        /// Trả về một list các câu hỏi được chọn random từ kho
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public PlayerSession Get()
        {
            var numberItem = _globalSetting.Get().NUMBER_QUESTION_EACH_SESSION;
            // Lấy list các nhân vật active.
            var characters = _characterService.GetAllActive("Questions")?
                                            .Where(w => w.Questions.Any())?
                                            .Select(x => new CharacterDto(x));
            if (characters == null || !characters.Any())
                return null;
            // Pick random bộ các nhân vật.
            var sessionCharacters = EnumerableExtension.PickRandom(characters, numberItem);
            return new PlayerSession
            {
                Characters = sessionCharacters
            };
        }

        [HttpPost]
        public async Task<JsonResult> Submit(AnswersDto answers)
        {
            var response = new BaseResponse()
            {
                IsSuccess = true,
                DataStatus = 1,
            };

            try
            {
                Users user;
                if (answers.UserId.HasValue)
                {
                    user = await _userService.FindByIdAsync(answers.UserId.Value);
                }
                else
                {
                    if (_globalSetting.Get().IS_USE_UNIQUE_USER)
                    {
                        var isExist = (await _userService.FindAsync(x => x.FullName.ToLower().Trim() == answers.UserFullName.ToLower().Trim()))?.FirstOrDefault() != null;
                        if (isExist)
                        {
                            response.DataStatus = 2;
                            response.Message = "Tên bạn chọn đã tồn tại, vui lòng chọn tên khác để ghi nhận kết quả!";
                            return JsonResponse(result: response, statusCode: HttpStatusCode.Conflict, msg: response.Message);
                        }
                    }
                    var userDto = new Users()
                    {
                        FullName = answers.UserFullName,
                        Type = (byte)UserTypes.GUEST,
                        Status = (byte)BaseEnumStatus.Active,
                        CreatedTs = DateTime.UtcNow
                    };
                    user = await _userService.SubmitAsync(userDto);
                }

                if (user != null && answers.Answers != null && answers.Answers.Any())
                {
                    var QuestionnaireUsersDto = answers.Answers.Select(x =>
                    {
                        var question =  _questionService.FindById(x.QuestionId);
                        return new QuestionnaireUsers()
                        {
                            QuestionId = x.QuestionId,
                            UserId = user.Id,
                            Selection = bool.Parse(x.Selection),
                            SnapPoint = question.IsCorrect == bool.Parse(x.Selection) ? question.Point : question.Point * question.InCorrectScale
                        };
                    });
                    await _questionnaireUserService.SubmitRangeAsync(QuestionnaireUsersDto);
                }
                return JsonResponse(result: response);
            }
            catch(Exception e)
            {
                return JsonResponse(result: new BaseResponse()
                {
                    IsSuccess = false,
                    DataStatus = 0,
                    Message = e.Message
                }, statusCode: HttpStatusCode.InternalServerError, msg: "Lỗi không mong muốn :((");
            }
        }
        private JsonResult JsonResponse(string msg = "OK", dynamic result = null, HttpStatusCode statusCode = HttpStatusCode.OK)
        {
            return new JsonResult(new { code = statusCode, message = msg, results = result });
        }
    }
}
