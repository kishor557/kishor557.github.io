require 'uri'
require 'net/http'
require 'open-uri'

params = [{'uuid': '0514b...', 'name':'Athens'}]
headers = {
    'Authorization'=>'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjp7IiRvaWQiOiI1Yjg1MGZlN2FiNTJhYTA4MDgzOTk5ZjIifX0.H0EzOtV_Q2ik0mo1k-1racJz5jSB8g9hLdHbek9qntg',
    'Content-Type' =>'application/json',
    'Accept'=>'application/json'
}

http = Net::HTTP.new(uri.host, uri.port)
resp = http.post(uri.path, params.to_json, headers)

puts resp.body.inspect
