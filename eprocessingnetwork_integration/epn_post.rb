require "httparty"

test = {   
         "ePNAccount": '080880',
         "RestrictKey": 'yFqqXJh9Pqnugfr',
         "CardNo":    "4111111111111111",
         "ExpMonth": "10",
         "ExpYear":  "21",
         "Total":    "1.00",
         "Address":  "asdsda, dsasda",
         "Zip":      "32132",
         "CVV2Type":  "1",
         "CVV2":      "999",
         "HTML":      "No",
         "EMail":     "customer@email.com",
         "TranType":   "AuthOnly"
       }

res = HTTParty.post("https://www.eprocessingnetwork.com/cgi-bin/epn/secure/tdbe/transact.pl",
  { 
    :body => test
  })

puts res.body.inspect  
puts res.body.class.inspect  
puts res.body.inspect  
