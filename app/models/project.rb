class Project < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :description, :summary]
  pg_search_scope :search, :against => [:title, :description, :summary]
  pg_search_scope :search_by_title, :against => :title
  pg_search_scope :search_by_content, :against => [:description, :summary]

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
