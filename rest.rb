#gem twitterをロードする
# "#include <stdlib.h>" みたいなもん
require 'twitter'

CONSUMER_KEY        = '********************'
CONSUMER_SECRET     = '********************'
ACCESS_TOKEN        = '********************'
ACCESS_TOKEN_SECRET = '********************'

#クライアントが定義される
cli = Twitter::REST::Client.new do |config|
  config.consumer_key        = CONSUMER_KEY
  config.consumer_secret     = CONSUMER_SECRET
  config.access_token        = ACCESS_TOKEN
  config.access_token_secret = ACCESS_TOKEN_SECRET
end
