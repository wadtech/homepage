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

number = 7

number.times do | count |
  Article.create! do | article |
    article.title = "Article#{count}"
    article.author = "Pete"
    article.content = <<-EOF 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mi diam, consectetur vitae lobortis ut, pretium nec sapien. Cras felis nisl, porttitor ut commodo quis, egestas iaculis velit. Sed sagittis nulla quis justo placerat et consequat tellus porta. Curabitur faucibus varius ipsum ac fermentum. Curabitur vitae elit odio, congue adipiscing leo. Duis et lectus elit. Morbi purus enim, sagittis vel hendrerit at, dictum in risus. Aliquam vel quam leo. Nulla facilisi. Praesent hendrerit, ante a malesuada eleifend, libero odio dignissim est, non faucibus libero metus id urna.

Praesent ullamcorper libero ut tortor semper id mollis ligula auctor. Praesent a ante ut nulla mollis condimentum mollis eu arcu. Proin dui orci, dapibus quis vehicula sed, pharetra vitae ante. Duis ut tortor eu massa pellentesque facilisis. Curabitur dui mauris, malesuada in lacinia id, pellentesque at nibh. Phasellus convallis convallis urna eu tristique. Nam sollicitudin, nibh nec facilisis eleifend, lectus justo porttitor quam, eget auctor tellus justo at nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec augue et nisi ullamcorper luctus ut vulputate elit. Suspendisse ultricies ultricies malesuada. Suspendisse potenti. \
Nullam vel sapien ut sapien sagittis accumsan. Ut dictum volutpat mauris, ac varius magna laoreet vel. Curabitur adipiscing malesuada convallis. Cras placerat faucibus ante vel malesuada. Maecenas eget ligula ut eros fermentum elementum vel et mauris. Suspendisse sit amet felis ac justo bibendum suscipit. Phasellus feugiat elit non tellus mattis scelerisque. Suspendisse eu purus ante. Aliquam non elit enim. Proin imperdiet ornare diam id semper. Fusce imperdiet aliquet sagittis. Vestibulum non urna massa, id commodo neque. Proin scelerisque, enim vel dignissim consequat, lacus nibh viverra odio, viverra viverra lacus ante nec ante. Vestibulum risus nibh, lobortis sed sollicitudin in, hendrerit ac sapien.

<iframe src="http://player.vimeo.com/video/14074949?portrait=0" width="350" height="197" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

Suspendisse feugiat auctor mauris in varius. In hac habitasse platea dictumst. Ut eu felis eu elit consequat fringilla vitae eu velit. Nulla facilisi. Mauris varius, sapien non commodo accumsan, lacus sem scelerisque enim, vitae tempor sapien neque ac lectus. Nullam egestas mattis lectus vel laoreet. Morbi iaculis est quis enim scelerisque dictum. Fusce convallis scelerisque gravida. In hac habitasse platea dictumst. Morbi gravida erat et erat scelerisque facilisis. Duis molestie rhoncus arcu, et ultricies dui elementum id. Aliquam erat volutpat. Phasellus lobortis ornare vulputate. Donec vel lectus ac risus convallis rutrum. Nulla facilisi.
    EOF
    article.published = true
  end
  print "Created Article #{count}\r"
end
puts "#{number} Articles Created."

Project.delete_all

2.times do
  Project.create! do | project |
    project.title = "Sample Project #{rand(2..20)}"
    project.description = <<-DESC
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mi diam, consectetur vitae lobortis ut, pretium nec sapien. Cras felis nisl, porttitor ut commodo quis, egestas iaculis velit. Sed sagittis nulla quis justo placerat et consequat tellus porta. Curabitur faucibus varius ipsum ac fermentum. Curabitur vitae elit odio, congue adipiscing leo. Duis et lectus elit. Morbi purus enim, sagittis vel hendrerit at, dictum in risus. Aliquam vel quam leo. Nulla facilisi. Praesent hendrerit, ante a malesuada eleifend, libero odio dignissim est, non faucibus libero metus id urna.
    DESC
    project.source_repository = "http://www.google.co.uk"
    project.image = nil
  end
end

puts "Projects created"

Page.delete_all

2.times do
  Page.create! do | page |
    page.permalink = "Static#{rand(2..20)}"
    page.content = <<-CONTENT
Lorem ipsum amet Excepteur voluptate commodo eiusmod id in enim magna nostrud pariatur id ex proident dolor consequat. Lorem ipsum Duis in esse irure ex laborum commodo in in cillum Ut esse nisi velit nisi dolore in est qui aute. 
    CONTENT
  end
end

puts "Pages created"