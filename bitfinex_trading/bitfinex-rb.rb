require 'bitfinex-api-rb'

# Configure the client with the proper KEY/SECRET, you can create a new one from:
# https://www.bitfinex.com/api
Bitfinex::Client.configure do |conf|
  conf.secret = "BJlXfJrz1MxMkR51xFIXeJBCsgtWzy9RMEGbBqClphq"
  conf.api_key = "fjRRxmF9RLUQ6d6eSVSHl4H6NOKpW0Cs0bFjVLDvgSb"
  #conf.use_api_v2
end


# Initialize the client
client = Bitfinex::Client.new

# Get wallet informations
trades = client.trades

p trades.class

p trades[0].class

