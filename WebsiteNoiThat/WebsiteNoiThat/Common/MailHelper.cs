using System;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace WebsiteNoiThat.Common
{
    public class MailHelper
    {
        public void SendMail(string toEmailAddress, string subject, string content)
        {
            try
            {
                var fromEmail = ConfigurationManager.AppSettings["FromEmailAddress"];
                var password = ConfigurationManager.AppSettings["FromEmailPassword"];
                var host = ConfigurationManager.AppSettings["Smtp:Host"];
                var port = int.Parse(ConfigurationManager.AppSettings["Smtp:Port"]);
                bool enableSsl = true;

                using (var client = new SmtpClient(host, port))
                {
                    client.Credentials = new NetworkCredential(fromEmail, password);
                    client.EnableSsl = enableSsl;

                    var mailMessage = new MailMessage
                    {
                        From = new MailAddress(fromEmail, "Your App Name"),
                        Subject = subject,
                        Body = content,
                        IsBodyHtml = true
                    };

                    mailMessage.To.Add(toEmailAddress);
                    client.Send(mailMessage);
                }
            }
            catch (SmtpException ex)
            {
                Console.WriteLine($"SMTP Exception: {ex.Message}");
                Console.WriteLine($"Status Code: {ex.StatusCode}");
                throw;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"General Exception: {ex.Message}");
                throw;
            }
        }

    }
}
