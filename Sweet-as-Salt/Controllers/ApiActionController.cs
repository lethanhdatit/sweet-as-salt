using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Sweet_as_Salt.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ApiActionController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Lê Thành Đạt", "Vũ Ngọc Huyền", "Nguyễn Ngọc Đức Anh", "Trương Tiến Ngọc Hân", "Ngô Thị Hồng", "Nguyễn Đình Dương", "Cao Khánh Duy", "Trần Phan Thành Danh", "Lý Uyển Nhi"
        };

        private readonly ILogger<ApiActionController> _logger;

        public ApiActionController(ILogger<ApiActionController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<LeaderBoard> Get()
        {
            var rng = new Random();
            var fakeData = Enumerable.Range(1, 5).Select(index => new LeaderBoard
            {
                ID = index,
                CreatedTS = DateTime.Now.AddDays(-10).AddDays(index),
                TotalScore = rng.Next(100, 2000),
                Name = Summaries[rng.Next(Summaries.Length)]
            })
            .ToArray();
            return fakeData.OrderByDescending(x => x.TotalScore).Select((x, index) => 
            {
                var temp = x;
                temp.Rank = (index + 1);
                return temp;
            });
        }
    }
}
