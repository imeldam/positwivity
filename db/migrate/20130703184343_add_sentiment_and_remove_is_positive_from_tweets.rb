class AddSentimentAndRemoveIsPositiveFromTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :sentiment, :string
    remove_column :tweets, :is_positive
  end
end
