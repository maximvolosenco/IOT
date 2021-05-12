using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IOT_API.Models
{
    public class GetSignInfoModel
    {
        public string SignName { get; set; }
        public byte[] SignPhoto { get; set; }
        public string StreetName { get; set; }
    }
}
