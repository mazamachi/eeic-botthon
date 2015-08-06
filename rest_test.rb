#gem twitterをロードする
# "#include <stdlib.h>" みたいなもん
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

#ツイートを投稿
cli.update("Hello twitter! #eeic_botthon")

#文字列の変数を投稿
str = "hemi"
hashtag = "#eeic_botthon"
cli.update(str+" "+hashtag)

#TLを最新20件取得し、配列として保存
ar = cli.home_timeline
#配列中のそれぞれを表示
ar.each do |tweet|
  puts tweet.text
end

#リプライを取得した内の最初のものをふぁぼる
cli.favorite(cli.mentions_timeline[0])