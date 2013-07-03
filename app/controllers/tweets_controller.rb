require Rails.root.join("lib/tweet_sentiment")
require("lazy_high_charts")

class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all

  end

  def create
    @tweet = Tweet.new(params[:tweet]) 
    sentiment = TweetSentiment.new(@tweet)

    @tweet.sentiment = sentiment.to_s
    @tweet.save

    
    render :show

  end

end