using Sweet_as_Salt.Common;
using Sweet_as_Salt.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Sweet_as_Salt.Services
{
    public class GlobalSettingModel
    {
        public int NUMBER_QUESTION_EACH_SESSION { get; set; } = 5;
        public bool IS_USE_UNIQUE_USER { get; set; } = false;
        public bool IS_REALTIME_LEADERBOARD { get; set; } = true;
    }
    public class GlobalSettingService
    {
        private readonly SweetAsSaltDBContext _context;
        private static GlobalSettingModel _Data = new GlobalSettingModel();
        public GlobalSettingService(SweetAsSaltDBContext context)
        {
            _context = context;
            InitializeCommonData();
        }

        private void InitializeCommonData()
        {
            try
            {
                var data = _context.GlobalSettings.Where(x => x.Status == (byte)BaseEnumStatus.Active);
                _Data.NUMBER_QUESTION_EACH_SESSION = int.Parse(data?.FirstOrDefault(x => x.Name.ToLower() == "NUMBER_QUESTION_EACH_SESSION")?.Value);
                _Data.IS_USE_UNIQUE_USER = bool.Parse(data?.FirstOrDefault(x => x.Name.ToLower() == "IS_USE_UNIQUE_USER")?.Value);
                _Data.IS_REALTIME_LEADERBOARD = bool.Parse(data?.FirstOrDefault(x => x.Name.ToLower() == "IS_REALTIME_LEADERBOARD")?.Value);
            }
            catch (Exception e) { }
        }
        public void FetchData()
        {
            InitializeCommonData();
        }
        public GlobalSettingModel Get()
        {
            if (_Data == null) InitializeCommonData();
            return _Data;
        }
    }
}
