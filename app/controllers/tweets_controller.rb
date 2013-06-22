require Rails.root.join("lib/tweet_sentiment")
class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params[:tweet]) 
    sentiment = TweetSentiment.new(@tweet)
    @tweet.is_positive = sentiment.positive?
    @tweet.save
    render :show

  end

end