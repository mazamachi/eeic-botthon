require 'tweetstream'
require 'twitter'

CONSUMER_KEY        = "**************************"
CONSUMER_SECRET     = "**************************"
ACCESS_TOKEN        = "**************************"
ACCESS_TOKEN_SECRET = "**************************"

#クライアントが定義される
cli = Twitter::REST::Client.new do |config|
  config.consumer_key        = CONSUMER_KEY
  config.consumer_secret     = CONSUMER_SECRET
  config.access_token        = ACCESS_TOKEN
  config.access_token_secret = ACCESS_TOKEN_SECRET
end

cli_stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key       = CONSUMER_KEY
  config.consumer_secret    = CONSUMER_SECRET
  config.access_token        = ACCESS_TOKEN
  config.access_token_secret = ACCESS_TOKEN_SECRET
end

cli_stream.user do |status|
  case status
  when Twitter::Tweet
    puts "@#{status.user.screen_name}: #{status.text}"
  when Twitter::Streaming::Event
    case status.name
    when :favorite
      puts "Favorited by " + status.source.name
    when :unfavorite
      puts "Unfavorited by " + status.source.name
    when :follow
      puts "Followed by " + status.source.name
    end
  end
end

