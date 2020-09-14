using System;

namespace Sweet_as_Salt
{
    public class LeaderBoard
    {
        public long ID { get; set; }
        public long Rank { get; set; }
        public string Name { get; set; }
        public DateTime CreatedTS { get; set; }
        public double TotalScore { get; set; }
    }
}
