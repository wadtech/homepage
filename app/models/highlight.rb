# == Schema Information
#
# Table name: highlights
#
#  id                 :integer          not null, primary key
#  code_snippet       :text
#  description        :text
#  project_id         :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  title              :string(255)      default("Highlight")
#

class Highlight < ActiveRecord::Base
  attr_accessible :code_snippet, :image, :description, :project, :title

  has_one :project
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :description, :presence => true
  validates :code_snippet, :presence => true, :if => lambda{ |m| m.image.blank? }
  validates :image, :presence => true, :if => lambda{ |m| m.code_snippet.blank? }
end
