using Sweet_as_Salt.Entities;
using System;
using System.Collections;
using System.Collections.Generic;

namespace Sweet_as_Salt
{
    public class AnswerDto
    {
        public long QuestionId { get; set; }
        public bool Selection { get; set; }
    }
    public class AnswersDto
    {
        public long? UserId { get; set; }
        public string UserFullName { get; set; }
        public IEnumerable<AnswerDto> Answers { get; set; }
    }
}
