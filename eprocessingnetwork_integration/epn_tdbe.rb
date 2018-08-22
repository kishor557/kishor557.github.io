require 'net/http'
require 'uri'
require 'json'

url = "https://www.eprocessingnetwork.com/cgi-bin/tdbe/transact.pl"
puts "Hello"
uri = URI.parse(url)
#options_mask = OpenStruct::SSL::OP_NO_SSLv2 + OpenStruct::SSL::OP_NO_SSLv3 + OpenStruct::SSL::OP_NO_COMPRESSION
#header = {"Content-Type": "text/plain; charset=ISO-8859-1"}

header = {}

user = {   
         "ePNAccount": '0916179',
         "RestrictKey": 'kxCf3C4QeTKf6f3',
         "CardNo": "4242424242424242",
         "ExpMonth": "02",
         "ExpYear":  "20",
         "Total":    "1",
         "Address":  "addressST",
         "Zip":      "10010",
         "CVV2Type":  "1",
         "CVV2":      "123",
         "RespondAs": "JSON"
       }
       
test = {   
         "ePNAccount": '080880',
         "RestrictKey": 'yFqqXJh9Pqnugfr',
         "CardNo": "4111111111111111",
         "ExpMonth": "12",
         "ExpYear":  "09",
         "Total":    "12.34",
         "Address":  "123 Fake St",
         "Zip":      "12345",
         "CVV2Type":  "1",
         "CVV2":      "123",
         "HTML":      "No",
         "EMail":     "customer@email.com"
       }
       
puts header.inspect
puts test.inspect
puts uri.request_uri.inspect
# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)

if uri.scheme == "https"
  http.use_ssl = true
  #http.verify_mode = OpenStruct::SSL::VERIFY_PEER
  #http.ssl_options = options_mask
end
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = test

# Send the request
response = http.request(request)
puts response.body.inspect

#REF: https://www.eprocessingnetwork.com/docs/TDBE.pdf

