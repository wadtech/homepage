class Highlight < ActiveRecord::Base
  attr_accessible :code_snippet, :image, :description, :project, :title

  has_one :project
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :description, :presence => true
  validates :code_snippet, :presence => true, :if => lambda{ |m| m.image.blank? }
  validates :image, :presence => true, :if => lambda{ |m| m.code_snippet.blank? }
end
