require "spec_helper"

describe ContactMailer do
  describe "contact" do
    mail = ContactMailer.contact("Subject", "Content", "127.0.0.1")

    it 'renders the subject' do
      mail.subject.should eq "Subject"
    end

    it 'renders the content' do
      mail.body.encoded.should have_content "Content"
    end

    it 'contains the IP of the sender' do
      mail.body.encoded.should have_content '127.0.0.1'
    end

    it 'gracefully handles Net::SMTP exceptions'
  end
end