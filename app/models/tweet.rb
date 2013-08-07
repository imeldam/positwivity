require Rails.root.join("lib/tweet_share")
class Tweet < ActiveRecord::Base
  attr_accessible :content

  def share_button
    TweetShare.new(self).link
  end

  def as_json(args)
  	super args.merge(methods: :share_button)
  end

end
