using System;
using System.Collections.Generic;

namespace Sweet_as_Salt.Entities
{
    public partial class Questions
    {
        public Questions()
        {
            QuestionnaireUsers = new HashSet<QuestionnaireUsers>();
        }

        public long Id { get; set; }
        public long? CharacterId { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string Info { get; set; }
        public string ContentUrl { get; set; }
        public double Point { get; set; }
        public bool IsCorrect { get; set; }
        public double InCorrectScale { get; set; }
        public byte Status { get; set; }
        public DateTime CreatedTs { get; set; }

        public virtual Characters Character { get; set; }
        public virtual ICollection<QuestionnaireUsers> QuestionnaireUsers { get; set; }
    }
}
