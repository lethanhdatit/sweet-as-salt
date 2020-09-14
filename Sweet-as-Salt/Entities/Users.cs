using System;
using System.Collections.Generic;

namespace Sweet_as_Salt.Entities
{
    public partial class Users
    {
        public Users()
        {
            QuestionnaireUsers = new HashSet<QuestionnaireUsers>();
        }

        public long Id { get; set; }
        public string FullName { get; set; }
        public byte Type { get; set; }
        public byte Status { get; set; }
        public DateTime CreatedTs { get; set; }

        public virtual ICollection<QuestionnaireUsers> QuestionnaireUsers { get; set; }
    }
}
