class Article < ActiveRecord::Base
  # eventually has_one author

  validates :content, :author, :title, :presence => true

end
