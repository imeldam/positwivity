// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){ 
	console.log("Yay it works")
	$("#new_tweet").on("ajax:success", function(evt, data){
	console.log("success", data)
	
	})

	$("#new_tweet").on("ajax:complete", function(evt, data){
	
		var tweet = JSON.parse(data.responseText)

		var sentimentText

		if(tweet.sentiment === "positive"){
			sentimentText = "Yay! It's POSITIVE! Well done. You are now a ray of sunshine in this bleak world."
		} else if(tweet.sentiment === "neutral"){
			sentimentText = "Almost there, try again!"
		}else if(tweet.sentiment === "negative"){
			sentimentText = "Oh dear. Have a cup of tea and give up."
		}


		$("#sentiment-text").html(sentimentText)
		$("#tweet-button").attr("src", tweet.share_button)
	})
})
