require "net/http"
class TweetSentiment
  def initialize(tweet)
    @tweet = tweet 
  end  

  def positive?
    uri = URI("http://www.sentiment140.com/api/classify")
    uri.query = URI.encode_www_form({text: @tweet.content})
    res = Net::HTTP.get_response(uri)
    sentiment = JSON.parse(res.body)
    puts sentiment
    sentiment["results"]["polarity"] == 4
  end
  

end  