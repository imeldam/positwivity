require Rails.root.join("lib/tweet_share")
class Tweet < ActiveRecord::Base
  attr_accessible :content

  def share_button
    TweetShare.new(self).link
  end
end
