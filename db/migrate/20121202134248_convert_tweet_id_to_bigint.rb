class ConvertTweetIdToBigint < ActiveRecord::Migration
  def up
    execute <<-SQL
ALTER TABLE twitter_feeds
ALTER COLUMN tweet_id TYPE bigint USING tweet_id::bigint
SQL
  end

  def down
    execute <<-SQL
ALTER TABLE twitter_feeds
ALTER COLUMN tweet_id TYPE string
SQL
  end
end
