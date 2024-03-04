# frozen_string_literal: true

require 'uri'
require 'json'
require 'net/http'

# This module call trello api.
module Trello
  def create_card_in_trello
    url = URI("https://api.trello.com/1/cards?idList=#{ENV['TRELLO_ID_LIST']}&key=#{ENV['TRELLO_KEY']}&token=#{ENV['TRELLO_TOKEN']}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request.body = JSON.dump({ "name": @card.text })
    https.request(request)
  end
end
