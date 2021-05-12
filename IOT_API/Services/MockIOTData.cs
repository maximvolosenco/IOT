using Dapper;
using IOT_API.Global;
using IOT_API.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace IOT_API.Services
{
    public class MockIOTData
    {
        private string _sql;
        private IDbConnection _db;

        public MockIOTData()
        {
            _db = new SqlConnection(Tools.ConnectionString);

        }

        public List<GetTestModel> GetAllLocations()
        {
            _sql = @"SELECT LocationId, StreetName, QuadrantNumber
                    FROM LocationInfo";

            var _entertainments = this._db.Query<GetTestModel>(_sql).ToList();
            return _entertainments;
        }

        public List<GetSignInfoModel> GetSignInfo()
        {
            _sql = @"SELECT si.SignName
	                        ,si.SignPhoto
	                        ,li.StreetName
                    FROM SignInfo si
                    INNER JOIN LocationInfo li ON li.LocationId = si.LocationId
                    WHERE SignStatus = 0";

            var _sign = this._db.Query<GetSignInfoModel>(_sql).ToList();
            return _sign;

        }

        public int InsertSignInfo(PostSignInfoModel signModel)
        {
            int UserId = 1;
            byte[] SignPhoto = ConvertLinkToBytes(signModel.SignPhotoUrl);
            _sql = @"INSERT INTO SignInfo(UserId, SignName, SignPhoto, LocationId)
                     VALUES (@UserId, @SignName, @SignPhoto, @LocationId)";

            this._db.Execute(_sql, new { UserId, signModel.SignName, SignPhoto, signModel.LocationId });
            return 1;
        }

        public void UpdateSignStatus(int SignStatus, string SignName)
        {
            _sql = @"UPDATE SignInfo
                    SET SignStatus = @SignStatus
                    WHERE SignName LIKE @SignName";

            this._db.Execute(_sql, new { SignStatus, SignName });

        }

        public void ResetSignStatus()
        {
            _sql = @"UPDATE SignInfo
                    SET SignStatus = 0";

            this._db.Execute(_sql);
        }

        private byte[] ConvertLinkToBytes(string imageLink)
        {
            if (imageLink == null)
                return null;
            try
            {
                using (WebClient webClient = new WebClient())
                {
                    byte[] image = webClient.DownloadData(imageLink);

                    return image;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return null;
            }
        }

        //public void ConvertImages()
        //{
        //    _sql = @"SELECT SignPhoto
        //            FROM SignInfo";

        //    var it = this._db.Query<byte []>(_sql).FirstOrDefault();

        //    using (var ms = new MemoryStream(it))
        //    {
        //        Image img = Image.FromStream(ms);

        //        img.Save(@"C:\Users\MVOLOSEN\Desktop\Stuff\mmm\myfile.png", ImageFormat.Png);

        //        //Image.FromStream(ms);
        //        //Image.Save("myfile.png", ImageFormat.Png)
        //    }
        //}
    }
}
