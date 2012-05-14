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

Article.delete_all

25.times do | count |
  Article.create! do | article |
    article.title = "Article#{count}"
    article.author = "Pete"
    article.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mi diam, consectetur vitae lobortis ut, pretium nec sapien. Cras felis nisl, porttitor ut commodo quis, egestas iaculis velit. Sed sagittis nulla quis justo placerat et consequat tellus porta. Curabitur faucibus varius ipsum ac fermentum. Curabitur vitae elit odio, congue adipiscing leo. Duis et lectus elit. Morbi purus enim, sagittis vel hendrerit at, dictum in risus. Aliquam vel quam leo. Nulla facilisi. Praesent hendrerit, ante a malesuada eleifend, libero odio dignissim est, non faucibus libero metus id urna.\n\n
                      Praesent ullamcorper libero ut tortor semper id mollis ligula auctor. Praesent a ante ut nulla mollis condimentum mollis eu arcu. Proin dui orci, dapibus quis vehicula sed, pharetra vitae ante. Duis ut tortor eu massa pellentesque facilisis. Curabitur dui mauris, malesuada in lacinia id, pellentesque at nibh. Phasellus convallis convallis urna eu tristique. Nam sollicitudin, nibh nec facilisis eleifend, lectus justo porttitor quam, eget auctor tellus justo at nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec augue et nisi ullamcorper luctus ut vulputate elit. Suspendisse ultricies ultricies malesuada. Suspendisse potenti.\n\n
                      Nullam vel sapien ut sapien sagittis accumsan. Ut dictum volutpat mauris, ac varius magna laoreet vel. Curabitur adipiscing malesuada convallis. Cras placerat faucibus ante vel malesuada. Maecenas eget ligula ut eros fermentum elementum vel et mauris. Suspendisse sit amet felis ac justo bibendum suscipit. Phasellus feugiat elit non tellus mattis scelerisque. Suspendisse eu purus ante. Aliquam non elit enim. Proin imperdiet ornare diam id semper. Fusce imperdiet aliquet sagittis. Vestibulum non urna massa, id commodo neque. Proin scelerisque, enim vel dignissim consequat, lacus nibh viverra odio, viverra viverra lacus ante nec ante. Vestibulum risus nibh, lobortis sed sollicitudin in, hendrerit ac sapien.\n\n
                      Suspendisse feugiat auctor mauris in varius. In hac habitasse platea dictumst. Ut eu felis eu elit consequat fringilla vitae eu velit. Nulla facilisi. Mauris varius, sapien non commodo accumsan, lacus sem scelerisque enim, vitae tempor sapien neque ac lectus. Nullam egestas mattis lectus vel laoreet. Morbi iaculis est quis enim scelerisque dictum. Fusce convallis scelerisque gravida. In hac habitasse platea dictumst. Morbi gravida erat et erat scelerisque facilisis. Duis molestie rhoncus arcu, et ultricies dui elementum id. Aliquam erat volutpat. Phasellus lobortis ornare vulputate. Donec vel lectus ac risus convallis rutrum. Nulla facilisi.\n\n
                      Duis ipsum orci, varius et tempus quis, tempor ut turpis. In dolor est, molestie eget vehicula vitae, laoreet in orci. Proin pulvinar, mauris at ultricies semper, justo nibh sagittis leo, a dapibus odio sem ut mi. Pellentesque ac justo at lorem consectetur ornare id nec enim. Aliquam volutpat erat vel nibh porta in rhoncus erat laoreet. Nunc porttitor consequat dignissim. Aliquam lectus eros, tempor eu aliquam sit amet, porttitor quis dui. Maecenas suscipit imperdiet pharetra. Nam euismod urna in libero volutpat eu euismod nunc bibendum. Praesent dapibus pharetra euismod. In posuere tempus condimentum. Fusce at gravida elit. Mauris erat nulla, vehicula a lobortis aliquam, rhoncus eu justo. Donec dignissim tempus iaculis."
    article.published = (rand(1..2) == 1)
  end
  puts "Created Article #{count}"
end