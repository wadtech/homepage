class CreateTwitterFeeds < ActiveRecord::Migration
  def change
    create_table :twitter_feeds do |t|
      t.string :tweet_id
      t.text :content

      t.timestamps
    end
  end
end
