class Contact < ActiveRecord::Base
  validates :subject, :content, :presence => true

  def archive!
    self.toggle!(:archived)
  end

  def archived?
    archived
  end
end
