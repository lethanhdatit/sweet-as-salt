using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sweet_as_Salt.Commons.SharedClass
{
    public class BaseResponse
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
        public byte DataStatus { get; set; }
        public dynamic Data { get; set; }
    }
}
