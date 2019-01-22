require 'json'

class Resident
    attr_accessor :phone, :addr

    def initialize(phone, addr)
        @phone = phone
        @addr = addr
    end
end

s = '{"Resident":[{"phone":"12345","addr":"xxxxx"},{"phone":"12345","addr":"xxxxx"},{"phone":"12345","addr":"xxxxx"}]}'


#j = JSON.parse(s)

#objects = j['Resident'].inject([]) { |o,d| o << Resident.new( d['phone'], d['addr'] ) }

#p objects[0].phone
#"12345"


#person = JSON.parse(s, object_class: OpenStruct)

#p person.class
#p person.Resident[0].phone


data = JSON.parse(s)
keys = data.keys

keys.each do |k|
  val = data[k]
  p val
  case val.is_a?
    when Array
    when Hash
    else
    
  end

end

 

data = JSON.parse(s)
residents = data['Resident'].map { |rd| Resident.new(rd['phone'], rd['addr']) }

p residents[0].phone
