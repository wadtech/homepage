class ContactMailer < ActionMailer::Base
  default from: Settings.mailer.from
  default to: Settings.contact.email

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
