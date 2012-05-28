# == Schema Information
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  content    :text
#  published  :boolean
#  author     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#


class Article < ActiveRecord::Base
  # eventually has_one author

  validates :content, :author, :title, :presence => true
  validates :published, :inclusion => {:in => [true, false]}
  
  def created_month
    created_at.strftime("%B %Y")
  end

  def to_param
    "#{self.id}-#{self.class}-#{self.title.parameterize}"
  end 
end
