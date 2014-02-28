module ApplicationHelper
  require 'markdown_helper'
  require 'title_helper'

  def avatar(email)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
