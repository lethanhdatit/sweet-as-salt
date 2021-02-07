using Sweet_as_Salt.Entities;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Sweet_as_Salt
{
    public class QuestionDto
    {
        public QuestionDto() {}
        public QuestionDto(Questions entity)
        {
            Id = entity.Id;
            Description = entity.Description;
            Content = entity.Content;
            Info = entity.Info;
            ContentUrl = entity.ContentUrl;
            Point = entity.Point;
            IsCorrect = entity.IsCorrect;
            InCorrectPoint = entity.InCorrectScale * entity.Point;
        }

        public long Id { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string Info { get; set; }
        public string ContentUrl { get; set; }
        public double Point { get; set; }
        public double InCorrectPoint { get; set; }
        public bool IsCorrect { get; set; }
    }
    public class CharacterDto
    {
        public CharacterDto(Characters c)
        {
            this.Name = c.Name;
            this.Description = c.Description;
            this.ContentUrl = c.ContentUrl;
            var randomQ = EnumerableExtension.PickRandom(c.Questions, 1)?.FirstOrDefault();
            this.Question = new QuestionDto(randomQ);
        }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ContentUrl { get; set; }
        public QuestionDto Question { get; set; } = new QuestionDto();
    }
    public class PlayerSession
    {
        public IEnumerable<CharacterDto> Characters { get; set; }
        public int QLength
        {
            get { return this.Characters.Count(); }
        }
        public double QMaxPoint
        {
            get { return this.Characters.Sum(s => s.Question.Point); }
        }
    }
}
