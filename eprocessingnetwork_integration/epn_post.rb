require "httparty"

test = {   
         "ePNAccount": '080880',
         "RestrictKey": 'yFqqXJh9Pqnugfr',
         "CardNo":    "4111111111111111",
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

res = HTTParty.post("https://www.eprocessingnetwork.com/cgi-bin/tdbe/transact.pl",
  { 
    :body => test
  })

puts res.body.inspect  
puts res.body.class.inspect  
puts eval(res.body).inspect  
