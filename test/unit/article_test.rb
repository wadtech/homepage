# == Schema Information
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  content    :text
#  published  :boolean
#  author     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
