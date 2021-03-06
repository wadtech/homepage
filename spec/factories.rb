require 'factory_girl'

FactoryGirl.define do

  factory :admin do
    sequence(:email) { |n| "admin#{n}@changeme.com" }
    password 'access'
    password_confirmation 'access'
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

  factory :project do
    title 'Sample Project'
    description 'Sample Description'

    factory :project_with_image do
     #TODO: implement me.
    end
  end

  factory :page do
    permalink 'Permalink'
    content 'Content'
  end
end

