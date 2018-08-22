require 'uri'
require 'net/http'
require 'json'

#url = URI("https://api.bitfinex.com/v1/pubticker/btcusd")
#url = URI("https://api.bitfinex.com/v1/stats/btcusd")
url = URI("https://api.bitfinex.com/v1/trades/etheur")


http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)

response = http.request(request)
body = JSON.parse(response.read_body)


puts body[0]
tim = Time.at(body[0]["timestamp"])
puts tim.strftime("%H:%M:%S")

=begin
def get_bitfinex_rep(url)
  url = URI(url)


  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)

  response = http.request(request)
  response.read_body  
end
=end
#@trades = get_bitfinex_rep("https://api.bitfinex.com/v1/trades/#{@market.id}")

#Rails.logger.debug "\n\n..trades...#{@trades.inspect}...\n"
