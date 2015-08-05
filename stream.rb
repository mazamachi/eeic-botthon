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

TweetStream.configure do |config|
  config.consumer_key       = CONSUMER_KEY
  config.consumer_secret    = CONSUMER_SECRET
  config.oauth_token        = ACCESS_TOKEN
  config.oauth_token_secret = ACCESS_TOKEN_SECRET
  config.auth_method        = :oauth
end

cli_stream = TweetStream::Client.new

cli_stream.userstream do |status|
  puts "@#{status.user.screen_name}: #{status.text}"
end