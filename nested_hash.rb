## Delete empty values from a Nested Hash in Ruby

h = {"2013" => {"AU" => "1", "IN" => "", "US" => ""}, "2014" => {"AU" => "", "IN" => "", "US" => ""}, "2015" => {"AU" => "", "IN" => "2", "US" => "3"}, "2016" => {"AU" => "1", "IN" => "3", "US" => "4"}}
puts h.inspect

h.delete_if { |k, v| v.values.reject(&:empty?).empty? }
#h.delete_if { |k, v| v.values.reject(&:empty?).length == 0 }

puts h.inspect
