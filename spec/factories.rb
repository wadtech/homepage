require 'factory_girl'

Factory.define :admin do |u|
  u.email 'user@test.com'
  u.password 'please'
  u.password_confirmation 'please'
end

