require "twitter"
require "pp"

client = Twitter::REST::Client.new do |config|
  config.consumer_key           = "yx8eFVXTRW7BDc2vsLY4vKpV7"
  config.consumer_secret        = "rMcS9dVm6V5Oquo9H28ZLqZiKxU8vYZc2l4WrcSR1yYPhYFEuA"
  config.access_token           = "858336626136588289-JSYIJbiT494FryruNNUog9i1W1TsjD1"
  config.access_token_secret    = "bqCj1g8pG6hXWzwrwRWiCyeto2bpaKZGYtFN3FzmwXDHr"
end

client.search("ラーメン").take(15).each do |tweet|
  puts tweet[#text]
end