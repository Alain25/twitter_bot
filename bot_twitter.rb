#!/usr/bin/env ruby

require 'Twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "faNVvnzgyxHdGnORE843bXzFZ"
  config.consumer_secret     = "9oiXcDobuuXvQt83HOsCWxaBkUwL8kY00p9xq7BriaqYratvyb"
  config.access_token        = "933680137433944064-pZIy8gj1V7Qz5hDAQ8EmM8hTtE3Dmjb"
  config.access_token_secret = "37qsIFhKYwAVgsLo1FZAIvqjDmJG9d0u7QbiOGnntgy1L"
end

search_options = {
  geocode: "40.416691,-3.700345,10mi"
}

client.search("Uber", search_options).take(50).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
  client.favorite(tweet)
  client.update_with_media("@#{tweet.user.screen_name} Bénéficiez de 5€ de remise sur votre PREMIERE course Uber grace à ce code 1dckw1e1ue ", File.new("/Users/apple/Downloads/new-uber-logo-512-1200x630.jpg"))
  sleep 900
end