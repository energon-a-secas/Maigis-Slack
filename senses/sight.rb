require 'twitter'

module Lookup

  def last_twitter(target)
    config = {
        consumer_key:        ENV['KEY'],
        consumer_secret:     ENV['KEY_KEY'],
        access_token:        ENV['TOKEN'],
        access_token_secret: ENV['TOKEN_KEY']
    }

    client = Twitter::REST::Client.new(config)

    result = ''
    client.search("to:#{target}", result_type: 'recent').take(3).each do |tweet|
      result =+ "New tweet from #{tweet.user}: #{tweet.url}"
    end
    p result
  end
end