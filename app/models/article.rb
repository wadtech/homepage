class Article < ActiveRecord::Base
  # eventually has_one author

  validates :content, :author, :published, :title, :presence => true
  validates :title, :uniqueness => true


end
