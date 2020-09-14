using System;
using System.Collections.Generic;

namespace Sweet_as_Salt.Entities
{
    public partial class QuestionnaireUsers
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public long QuestionId { get; set; }
        public bool? Selection { get; set; }
        public double? SnapPoint { get; set; }

        public virtual Questions Question { get; set; }
        public virtual Users User { get; set; }
    }
}
