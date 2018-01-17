require "twitter"
require "fastimage"
require "open-uri"

user_id = ARGV[0]

client = Twitter::REST::Client.new do |config|
  config.consumer_key           = "yx8eFVXTRW7BDc2vsLY4vKpV7"
  config.consumer_secret        = "rMcS9dVm6V5Oquo9H28ZLqZiKxU8vYZc2l4WrcSR1yYPhYFEuA"
  config.access_token           = "858336626136588289-JSYIJbiT494FryruNNUog9i1W1TsjD1"
  config.access_token_secret    = "bqCj1g8pG6hXWzwrwRWiCyeto2bpaKZGYtFN3FzmwXDHr"
end

imgs = []

tweets = client.favorites(count: 20)
imgs.concat tweets.flat_map { |s| s.media }.flat_map { |m|
              case m
              when Twitter::Media::AnimatedGif
                m.video_info.variants.map { |v| v.url.to_s }
              when Twitter::Media::Photo
                m.media_url.to_s
              else
                []
              end
            }
imgs.concat tweets.flat_map { |s| s.urls }.flat_map { |u|
              case FastImage.type(u.url.to_s)
              when :bmp, :gif, :jpeg, :png, :webm
                u.expanded_url.to_s
              else
                []
              end
            }

imgs.each do |url|
  path = "./#{File.basename(url)}"
  File.open(path, 'w') do |f|
    f.write open(url).read
  end
end
