class Page < ActiveRecord::Base
  validates :permalink, :content, :presence => true
  validates :permalink, :uniqueness => true

  def to_param
    permalink.downcase
  end

  def self.find_by_downcased_permalink(permalink)
    Page.where('lower(permalink) = ?', permalink).first
  end
end
