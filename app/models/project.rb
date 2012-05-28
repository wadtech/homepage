class Project < ActiveRecord::Base
  attr_accessible :title, :image, :description, :source_repository, :highlights_attributes

  has_many :highlights
  accepts_nested_attributes_for :highlights, allow_destroy: true
  
  has_attached_file :image, :styles => { :medium => "300x300>" }

  validates :title, :description, :presence => true

  def to_param
    "#{self.id}-#{self.class}-#{self.title.parameterize}"
  end 
end