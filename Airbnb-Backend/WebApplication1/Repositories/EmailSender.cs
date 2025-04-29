namespace WebApplication1.Repositories
{
    using Microsoft.AspNetCore.Identity.UI.Services;
    using Microsoft.Extensions.Options;
    using System.Net;
    using System.Net.Mail;
    using WebApplication1.DTOS;

    public class EmailSender : IEmailSender
    {
        private readonly AuthMessageSenderOptions _emailSettings;
        private readonly ILogger<EmailSender> _logger;

        public EmailSender(
            IOptions<AuthMessageSenderOptions> emailSettings,
            ILogger<EmailSender> logger)
        {
            _emailSettings = emailSettings.Value;
            _logger = logger;
        }

        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            try
            {
                var message = new MailMessage
                {
                    From = new MailAddress(_emailSettings.SenderEmail, _emailSettings.SenderName),
                    Subject = subject,
                    Body = htmlMessage,
                    IsBodyHtml = true
                };
                message.To.Add(email);

                using var client = new SmtpClient(_emailSettings.Server, _emailSettings.Port)
                {
                    EnableSsl = _emailSettings.EnableSsl,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false
                };

                // Only set credentials if username is provided
                if (!string.IsNullOrEmpty(_emailSettings.Username))
                {
                    client.Credentials = new NetworkCredential(
                        _emailSettings.Username,
                        _emailSettings.Password);
                }

                _logger.LogInformation("Sending email to {Email} via {Server}:{Port}",
                    email, _emailSettings.Server, _emailSettings.Port);

                await client.SendMailAsync(message);

                _logger.LogInformation("Email sent successfully");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error sending email to {Email}", email);
                throw;
            }
        }
    }
}
