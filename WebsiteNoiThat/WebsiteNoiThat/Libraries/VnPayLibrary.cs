using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.Web;
using WebsiteNoiThat.Models.VnPay;
using System.Text;
using System.Security.Cryptography;
using System.Globalization;
using Microsoft.AspNetCore.Http;

namespace WebsiteNoiThat.Libraries
{
    public class VnPayLibrary
    {
        private readonly SortedList<string, string> _requestData = new SortedList<string, string>(new VnPayCompare());
        private readonly SortedList<string, string> _responseData = new SortedList<string, string>(new VnPayCompare());
        public PaymentResponseModel GetFullResponseData(IQueryCollection collection, string hashSecret)
        {
            var vnPay = new VnPayLibrary();
            foreach (var key in collection.Keys)
            {
                var value = collection[key]; // Lấy giá trị tương ứng với key
                if (!string.IsNullOrEmpty(key) && key.StartsWith("vnp_"))
                {
                    vnPay.AddResponseData(key, value);
                }
            }
            var orderId = Convert.ToInt64(vnPay.GetResponseData("vnp_TxnRef"));
            var vnPayTranId = Convert.ToInt64(vnPay.GetResponseData("vnp_TransactionNo"));
            var vnpResponseCode = vnPay.GetResponseData("vnp_ResponseCode");
            var vnpSecureHash =
                collection.FirstOrDefault(k => k.Key == "vnp_SecureHash").Value; //hash của dữ liệu trả về
            var orderInfo = vnPay.GetResponseData("vnp_OrderInfo");
            var checkSignature =
                vnPay.ValidateSignature(vnpSecureHash, hashSecret); //check Signature
            if (!checkSignature)
                return new PaymentResponseModel()
                {
                    Success = false
                };
            return new PaymentResponseModel()
            {
                Success = true,
                PaymentMethod = "VnPay",
                OrderDescription = orderInfo,
                OrderId = orderId.ToString(),
                PaymentId = vnPayTranId.ToString(),
                TransactionId = vnPayTranId.ToString(),
                Token = vnpSecureHash,
                VnPayResponseCode = vnpResponseCode
            };
        }
        public string GetIpAddress(HttpContext context)
        {
            var ipAddress = string.Empty;

            try
            {
                // Kiểm tra header "X-Forwarded-For" nếu có proxy
                ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

                if (string.IsNullOrEmpty(ipAddress))
                {
                    // Nếu không có proxy, lấy từ REMOTE_ADDR
                    ipAddress = context.Request.ServerVariables["REMOTE_ADDR"];
                }

                // Kiểm tra và xử lý nếu là IPv6
                if (IPAddress.TryParse(ipAddress, out var ip) && ip.AddressFamily == AddressFamily.InterNetworkV6)
                {
                    var ipv4 = Dns.GetHostEntry(ip)
                        .AddressList.FirstOrDefault(x => x.AddressFamily == AddressFamily.InterNetwork);

                    ipAddress = ipv4?.ToString() ?? ip.ToString(); // Chuyển IPv6 sang IPv4 nếu có
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi và trả về thông báo lỗi
                return ex.Message;
            }

            return string.IsNullOrEmpty(ipAddress) ? "127.0.0.1" : ipAddress;
        }


        public void AddRequestData(string key, string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                _requestData.Add(key, value);
            }
        }

        public void AddResponseData(string key, string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                _responseData.Add(key, value);
            }
        }
        public string GetResponseData(string key)
        {
            return _responseData.TryGetValue(key, out var retValue) ? retValue : string.Empty;
        }
        public string CreateRequestUrl(string baseUrl, string vnpHashSecret)
        {
            var data = new StringBuilder();

            // Duyệt qua từng phần tử trong _requestData
            foreach (var kvp in _requestData)
            {
                var key = kvp.Key;
                var value = kvp.Value;

                // Kiểm tra value có null hoặc rỗng không
                if (!string.IsNullOrEmpty(value))
                {
                    data.Append(WebUtility.UrlEncode(key) + "=" + WebUtility.UrlEncode(value) + "&");
                }
            }

            var querystring = data.ToString();

            baseUrl += "?" + querystring;

            // Chuẩn bị dữ liệu để tạo HmacSha512
            var signData = querystring;
            if (signData.Length > 0)
            {
                signData = signData.Remove(signData.Length - 1, 1); // Xóa ký tự '&' cuối
            }

            // Tạo chuỗi bảo mật
            var vnpSecureHash = HmacSha512(vnpHashSecret, signData);
            baseUrl += "vnp_SecureHash=" + vnpSecureHash;

            return baseUrl;
        }

        public bool ValidateSignature(string inputHash, string secretKey)
        {
            var rspRaw = GetResponseData();
            var myChecksum = HmacSha512(secretKey, rspRaw);
            return myChecksum.Equals(inputHash, StringComparison.InvariantCultureIgnoreCase);
        }
        private string HmacSha512(string key, string inputData)
        {
            var hash = new StringBuilder();
            var keyBytes = Encoding.UTF8.GetBytes(key);
            var inputBytes = Encoding.UTF8.GetBytes(inputData);
            using (var hmac = new HMACSHA512(keyBytes))
            {
                var hashValue = hmac.ComputeHash(inputBytes);
                foreach (var theByte in hashValue)
                {
                    hash.Append(theByte.ToString("x2"));
                }
            }

            return hash.ToString();
        }

        private string GetResponseData()
        {
            var data = new StringBuilder();

            // Xóa các phần tử không cần thiết khỏi _responseData
            if (_responseData.ContainsKey("vnp_SecureHashType"))
            {
                _responseData.Remove("vnp_SecureHashType");
            }

            if (_responseData.ContainsKey("vnp_SecureHash"))
            {
                _responseData.Remove("vnp_SecureHash");
            }

            // Duyệt qua _responseData bằng KeyValuePair
            foreach (var kvp in _responseData)
            {
                var key = kvp.Key;
                var value = kvp.Value;

                // Kiểm tra value có null hoặc rỗng không
                if (!string.IsNullOrEmpty(value))
                {
                    data.Append(WebUtility.UrlEncode(key) + "=" + WebUtility.UrlEncode(value) + "&");
                }
            }

            // Xóa ký tự '&' cuối cùng
            if (data.Length > 0)
            {
                data.Remove(data.Length - 1, 1);
            }

            return data.ToString();
        }


    }
    public class VnPayCompare : IComparer<string>
    {
        public int Compare(string x, string y)
        {
            if (x == y) return 0;
            if (x == null) return -1;
            if (y == null) return 1;
            var vnpCompare = CompareInfo.GetCompareInfo("en-US");
            return vnpCompare.Compare(x, y, CompareOptions.Ordinal);
        }
    }

}