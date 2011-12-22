class Article < ActiveRecord::Base
  # eventually has_one author

  validates :content, :author, :title, :presence => true
  validates :published, :inclusion => {:in => [true, false]}


end
