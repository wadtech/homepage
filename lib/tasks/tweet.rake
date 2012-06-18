begin
  namespace :tweet do
    desc "Update tweet cache"
    task :update => :environment do  
      TwitterFeed.pull_tweet
      puts "Updated tweet cache."
    end
  end
end