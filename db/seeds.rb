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
    a.email = "admin@petermellett.co.uk"
    a.password = "access"
    a.password_confirmation = "access"
  end
end