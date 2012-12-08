require 'spec_helper'

describe Contact do  
  it "should have a valid factory" do
    FactoryGirl.build(:contact).should be_valid
  end
  context "properties" do
    before(:all) do
      @contact = FactoryGirl.create(:contact, subject: 'Message', content: 'sentences', archived: false, source_ip: '127.0.0.1')
    end
    it "should retain subject" do
      @contact.subject.should_not be_nil
      @contact.subject.should eq "Message"
    end
    it "should retain content" do
      @contact.content.should_not be_nil
      @contact.content.should eq "sentences"
    end
    it "should retain archived status" do
      @contact.archived.should_not be_nil
      @contact.archived.should be false
    end
    it "should retain ip address" do
      @contact.source_ip.should_not be_nil
      @contact.source_ip.should eq "127.0.0.1"
    end
  end

  context "archiving" do
    before (:all) do
      @contact = FactoryGirl.create(:contact)
    end

    it "should respond to archived property" do
      @contact.archived?.should_not be_nil
    end

    it "should toggle archived status with archive!" do
      archived = @contact.archived?
      @contact.archive!
      @contact.archived?.should_not eq archived
    end
  end
end