class RequestMailer < ApplicationMailer
  def send_email(request)
    @request = request
    mail(to: "sofiaes@live.se", subject: "#{request.name}: #{request.subject}")
  end
end
