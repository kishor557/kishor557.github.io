# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
account_sid = 'ACc6701fc200a0632053ee1b374ec6c997'
auth_token = 'dd707c0fcdf6315b83d752a2ce1d8798'
@client = Twilio::REST::Client.new(account_sid, auth_token)

s = @client.api.account.messages.create(
  from: '+12297960538',
  to: '+919951953182',
  body: 'Hey there!'
)

puts s.inspect
