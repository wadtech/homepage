class Article < ActiveRecord::Base
  # eventually has_one author

  validates :content, :author, :title, :published, :presence => true

end
