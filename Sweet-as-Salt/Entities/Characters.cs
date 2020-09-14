using System;
using System.Collections.Generic;

namespace Sweet_as_Salt.Entities
{
    public partial class Characters
    {
        public Characters()
        {
            Questions = new HashSet<Questions>();
        }

        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ContentUrl { get; set; }
        public byte Status { get; set; }
        public DateTime CreatedTs { get; set; }

        public virtual ICollection<Questions> Questions { get; set; }
    }
}
