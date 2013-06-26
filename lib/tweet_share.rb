class TweetShare

  TWITTER_URL = "https://platform.twitter.com/widgets/tweet_button.html"
  SHARE_URL = "http://www.positwivity.com"

  def initialize(tweet) 
    @tweet = tweet
  end

  def link
    uri = URI(TWITTER_URL)
    uri += URI.encode "?text=#{@tweet.content}&url=#{SHARE_URL}"
    uri.to_s
  end
end
