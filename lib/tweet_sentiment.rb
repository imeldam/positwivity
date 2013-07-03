require "net/http"
class TweetSentiment
  def initialize(tweet)
    @tweet = tweet 
  end  

  def positive?
    sentiment["results"]["polarity"] == 4
  end

  def neutral?
    sentiment["results"]["polarity"] == 2
  end

  def negative?
    sentiment["results"]["polarity"] == 0
  end

  def to_s
    if positive?
      "positive"
    elsif neutral?
      "neutral"
    elsif negative?
      "negative"
    end
  end

  def sentiment
    uri = URI("http://www.sentiment140.com/api/classify")
    uri.query = URI.encode_www_form({text: @tweet.content})
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end

end  