require 'twitter'

class Tweet

  def initialize
    @text = ["お腹がすいていませんか? eats-gbl2fv のコードを使うと、#UberEATS の初回から 2 回目までのご注文が ￥1,000 割引になります。http://ubr.to/EatsGiveGet ",
              "一人暮らしのそこのあなた！ UberEATS使ってみませんか？？　初回登録時に eats-gbl2fv のコードを使うと、2,000円分のクーポンを使うことができます！是非活用してください http://ubr.to/EatsGiveGet",
              "今日ご飯作るのめんどくさいなー...... そんなときこそUberEATS！ 初回登録にeats-gbl2fv のコードを使うと、2,000円分のクーポンを利用可能！　http://ubr.to/EatsGiveGet" ]

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "MbCzrG60TvzrNPaJre0Mp2x13"
      config.consumer_secret     = "ectMbKBHw5rVVg3cMrLC2hdZV7JKlMIAavxFgMkZbQmtDZKXet"
      config.access_token        = "892082671697805312-R3pGKPYNKYQkC8kjfsEp9OdEIDZYeNM"
      config.access_token_secret = "YMKLCWBMDT8MFd3m5g2ooYAnZQbEaw610YHBPClhSIPb2"
    end
  end

  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

  private

   def update(tweet)
     begin
       @client.update(tweet)
     rescue => e
       nil #TODO
     end
   end

end

# random_tweetを実行する
if __FILE__ == $0
  Tweet.new.random_tweet
end
