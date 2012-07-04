# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  subject    :text
#  content    :text
#  source_ip  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Contact < ActiveRecord::Base
  attr_accessible :subject, :content, :source_ip
  validates :subject, :content, :presence => true

end
