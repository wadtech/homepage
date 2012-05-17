class Project < ActiveRecord::Base
  attr_accessible :title, :image, :description, :source_repository, :highlights

  has_many :highlights
  has_attached_file :image, :styles => { :medium => "300x300>" }

  validates :title, :description, :presence => true
end