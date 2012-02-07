# == Schema Information
#
# Table name: contact_us
#
#  id         :integer         not null, primary key
#  subject    :text
#  content    :text
#  source_ip  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class ContactUs < ActiveRecord::Base
  validates :subject, :content, :presence => true

end
