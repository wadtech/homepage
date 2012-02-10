class ContactMailer < ActionMailer::Base
  default from: "contact@example.com"
  default to: "bulletraven@gmail.com"

  def contact(subject, content, ip)
    @subject = subject
    @message = content
    @ip = ip
    mail(:subject => @subject, :text => @content, :ip => @ip) do |format|
      format.text
      format.html
    end

  end
end
