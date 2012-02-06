class ContactMailer < ActionMailer::Base
  default from: "contact@example.com"
  default to: "destination@wherever.com"

  def contact_us(subject, content)
    @subject = subject
    @message = content
    mail(:subject => subject, :text => content) do |format|
      format.text
      format.html
    end

  end
end
