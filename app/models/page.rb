class Page < ActiveRecord::Base
  attr_accessible :permalink, :content
  validates :permalink, :content, :presence => true
  validates :permalink, :uniqueness => true

  def to_param
    permalink
  end
end
