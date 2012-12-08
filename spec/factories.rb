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

  factory :contact do
    sequence(:subject) { |n| "Message #{n}" }
    content "Some random text of sufficient length to account for smart_truncation. This needs to be at least 4 sentences long. Another bloody sentence. One more for luck."
    source_ip '127.0.0.1'
    archived false
  end
end

