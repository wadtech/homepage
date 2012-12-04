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
  include PgSearch
  multisearchable :against => [:title, :description, :summary]
  pg_search_scope :search, :against => [:title, :description, :summary]
  pg_search_scope :search_by_title, :against => :title
  pg_search_scope :search_by_content, :against => [:description, :summary]

  attr_accessible :title, :image, :description, :summary, :source_repository, :highlights_attributes

  has_many :highlights
  accepts_nested_attributes_for :highlights, allow_destroy: true

  has_attached_file :image, :styles => { :large => "400x400>", :medium => "300x300>", :thumb => "200x200>" }

  validates :title, :description, :presence => true

  def to_param
    self.title.parameterize
  end

  def self.find(input)
    input.to_i == 0 ? first(:conditions => ["title ILIKE ?", input.gsub("-", " ")]) : super
  end
end
