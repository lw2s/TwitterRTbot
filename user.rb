require "twitter"
require 'pp'

client = Twitter::REST::Client.new do |config|
  config.consumer_key           = "yx8eFVXTRW7BDc2vsLY4vKpV7"
  config.consumer_secret        = "rMcS9dVm6V5Oquo9H28ZLqZiKxU8vYZc2l4WrcSR1yYPhYFEuA"
  config.access_token           = "858336626136588289-JSYIJbiT494FryruNNUog9i1W1TsjD1"
  config.access_token_secret    = "bqCj1g8pG6hXWzwrwRWiCyeto2bpaKZGYtFN3FzmwXDHr"
end

loop do
client.home_timeline(include_rts: false).each do |timeline|
  #a = []
  
  #if (a.include?(timeline.id))
  #  next
  #end
  #a << (timeline.id)
  
  if (/^(.*#デレステ.*)$/) =~ timeline.text
    client.retweet(timeline.id) rescue nil
    #client.update(timeline.text)
  end
end
sleep(90)
end
