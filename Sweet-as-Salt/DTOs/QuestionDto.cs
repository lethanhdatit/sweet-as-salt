using Sweet_as_Salt.Entities;
using System;

namespace Sweet_as_Salt
{
    public class QuestionDto
    {
        public QuestionDto(Questions entity)
        {
            Id = entity.Id;
            CharacterId = entity.CharacterId;
            CharacterName = entity.Character?.Name;
            CharacterDescription = entity.Character?.Description;
            CharacterContentUrl = entity.Character?.ContentUrl;
            Description = entity.Description;
            Content = entity.Content;
            ContentUrl = entity.ContentUrl;
            Point = entity.Point;
            //IsCorrect = entity.IsCorrect;
            //Status = entity.Status;
            //CreatedTs = entity.CreatedTs;
        }

        public long Id { get; set; }
        public long? CharacterId { get; set; }
        public string CharacterName { get; set; }
        public string CharacterDescription { get; set; }
        public string CharacterContentUrl { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string ContentUrl { get; set; }
        public double Point { get; set; }
        //public bool IsCorrect { get; set; }
        //public byte Status { get; set; }
        //public DateTime CreatedTs { get; set; }
    }
}
