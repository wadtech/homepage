require 'base64'

class Project < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:title, :description, :summary]
  pg_search_scope :search, against: [:title, :description, :summary]
  pg_search_scope :search_by_title, against: :title
  pg_search_scope :search_by_content, against: [:description, :summary]

  has_many :highlights
  accepts_nested_attributes_for :highlights, allow_destroy: true

  has_attached_file :image, styles: { large: "400x400>", medium: "300x300>", thumb: "200x200>" }

  validates :title, :description, presence: true
  validates :github, uniqueness: { allow_nil: true, allow_blank: true, message: "repository has already been added." }

  before_validation :fetch_from_github

  def to_param
    self.title.parameterize
  end

  def self.find(input)
    #to_i converts strings that start with a letter to 0
    input.to_i == 0 ? where("title ILIKE ?", input.gsub("-", " ")).first : super
  end

  def fetch_from_github
    if self.github
      begin
        set_parameters_by Octokit.repo self.github
      rescue Octokit::NotFound => e
        errors[:base] << "No such Github repository found."
        false
      rescue Octokit::TooManyRequests => e
        errors[:base] << "Could not fetch details from Github, please try again later."
        logger.error "Github API Limit Reached."
        false
      end
    end
  end

private
  def set_parameters_by(repo)
    self.title       = repo.name
    self.summary     = repo.description
    self.description = Base64.decode64(Octokit.readme(repo.full_name, :accept => 'application/json').content)
  end
end
