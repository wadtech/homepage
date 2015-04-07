class Article < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :author, :content]
  pg_search_scope :search, :against => [:title, :author, :content]
  pg_search_scope :search_by_title, :against => :title
  pg_search_scope :search_by_content, :against => :content
  pg_search_scope :search_by_tag, :against => :tag_list

  acts_as_taggable

  validates :content, :author, :title, :presence => true
  validates :published, :inclusion => {:in => [true, false]}

  scope :published, -> { where(:published => true) }

  def created_month
    created_at.strftime("%B %Y")
  end

  def to_param
    "#{self.id}-#{self.class}-#{self.title.parameterize}"
  end
end
