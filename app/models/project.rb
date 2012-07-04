# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :text
#  source_repository  :string(255)
#  highlight_ids      :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Project < ActiveRecord::Base
  attr_accessible :title, :image, :description, :source_repository, :highlights_attributes

  has_many :highlights
  accepts_nested_attributes_for :highlights, allow_destroy: true
  
  has_attached_file :image, :styles => { :large => "400x400>", :medium => "300x300>", :thumb => "200x200>" }

  validates :title, :description, :presence => true

  def to_param
    "#{self.id}-#{self.class}-#{self.title.parameterize}"
  end 
end
