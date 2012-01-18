require 'factory_girl'

Factory.define do
  factory :admin do
    email 'user@test.com'
    password 'please'
  end

  factory :article do
    title 'Sample Title'
    author 'Test Author'
    content 'Sample content'
    published false

    factory :published_article do
        published true
    end
  end
end

