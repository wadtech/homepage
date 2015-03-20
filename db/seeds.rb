require 'rake'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#First user!
if Admin.first.nil?
  puts "Creating first user! admin/access"
  Admin.create! do |a|
    a.email = "admin@changeme.com"
    a.password = "access"
    a.password_confirmation = "access"
  end
end

Article.delete_all

rand(7..15).times do | count |
  Article.create! do | article |
    article.title = Faker::Lorem.sentence
    article.author = Faker::Name.name
    article.content = Faker::Lorem.paragraph
    article.published = [true, false].sample
  end
  print "Created Article #{count}\r"
end
puts "Articles Created."

Project.delete_all

Rake.application['homepage:capture_test_images'].invoke

rand(2..5).times do
  Project.create! do | project |
    project.title = Faker::App.name
    project.description = Faker::Hacker.say_something_smart
    project.source_repository = Faker::Internet.url
    project.image = File.open(Dir.glob(File.join(Rails.root, 'db', 'sampleimages', '*.png')).sample)
  end
end

puts "Projects created"

Page.delete_all

rand(2..5).times do
  Page.create! do | page |
    page.permalink = Faker::Lorem.word
    page.content = Faker::Lorem.paragraph
  end
end

puts "Pages created"
