begin
  namespace :tweet do
    desc "Update tweet cache"
    task :update => :environment do
      TwitterFeed.pull_tweet
      puts "[#{Time.now.gmtime}] Updated tweet cache."
    end
  end
end
