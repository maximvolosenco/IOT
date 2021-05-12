using IOT_API.Models;
using IOT_API.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IOT_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MainIOTController : ControllerBase
    {
        MockIOTData _dataService; 
        
        public MainIOTController()
        {
            _dataService = new MockIOTData();
        }

        [HttpGet("GetAll")]
        public IActionResult GetAllData()
        {
            var data = _dataService.GetAllLocations();
            if (data == null || data.Count() == 0)
            {
                return StatusCode(404);
            }
            return StatusCode(200, data);
        }

        [HttpGet("GetSingleSignInfo")]
        public IActionResult GetSingleSignInfo()
        {
            var data = _dataService.GetSignInfo();
            if (data == null)
            {
                return StatusCode(404);
            }
            return StatusCode(200, data);
        }

        [HttpPost("InsertSignInfo")]
        public IActionResult InsertTrafficSignInfo([FromBody]PostSignInfoModel signModel)
        {
            var data = _dataService.InsertSignInfo(signModel);
            if (data != 1)
            {
                return StatusCode(404);
            }

            return StatusCode(200, data);
        }

        [HttpPut("ChangeSignStatus")]
        public void ChangeSignStatus(int SignStatus, string SignName)
        {
            _dataService.UpdateSignStatus(SignStatus, SignName);

        }


        [HttpPut("ResetSignStatus")]
        public void ResetSignStatus()
        {
            _dataService.ResetSignStatus();

        }

        //[HttpGet("Test")]
        //public void Test()
        //{
        //    _dataService.ConvertImages();
        //    //return StatusCode(200, data);
        //}
    }
}
