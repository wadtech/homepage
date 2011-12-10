# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Articles
Article.delete_all

Article.create(
    :content => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur scelerisque nisl sed nulla condimentum ac sagittis metus tincidunt. Donec ultrices, leo pulvinar sagittis venenatis, arcu velit dictum velit, vitae interdum nunc ante sed enim. Aliquam erat volutpat. Nullam sollicitudin, velit sit amet molestie tempus, dolor neque aliquet quam, ac interdum tellus lectus eu nulla. In hac habitasse platea dictumst. Quisque rutrum imperdiet iaculis. Cras pretium vulputate ante, sit amet cursus mi vestibulum ornare. Aenean eu placerat leo. In placerat accumsan sem ut malesuada. Sed fermentum, orci faucibus euismod tempus, lorem sapien tincidunt felis, sed facilisis tellus neque id est. In hac habitasse platea dictumst. Suspendisse arcu libero, varius at porta sed, dapibus et ligula. Vestibulum cursus adipiscing cursus. Vivamus aliquam scelerisque justo id aliquam. Curabitur tortor lacus, imperdiet eget condimentum a, fringilla vel diam.
                 Donec aliquet, nisl sit amet malesuada aliquam, ante diam ultricies metus, non varius turpis massa vel eros. Donec pharetra dapibus massa, sed faucibus tortor volutpat ut. Nulla vel nisl libero. Integer diam lacus, blandit in consequat non, laoreet a mi. Nulla dictum felis ut sapien dignissim congue. Curabitur at enim sit amet erat malesuada euismod. Aliquam nisl mauris, elementum ac tincidunt eu, iaculis at lacus. Nam eget nibh aliquet nibh interdum consectetur quis in nisl.",
    :published => true,
    :author => "Pete",
    :title => "Lorem Ipsum")