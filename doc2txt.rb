require 'yomu'

#yomu = Yomu.new '/home/srinivas/Downloads/SamBell.docx'
#text = yomu.text
#puts text

#yomu = Yomu.new("/home/srinivas/Downloads/Profile.pdf.txt")
#text = yomu.text
#puts text

yomu = Yomu.new("/home/srinivas/Downloads/Dice_Profile_Jacob_Niebloom.pdf")
#yomu = Yomu.new("/home/srinivas/Downloads/KellyCobb.pdf")
text = yomu.text

email = text.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i).first
puts email

phone = text.scan(/\d+.\d+.\d+/).delete_if {|x| x.length < 10 || x.match(/[aA-zZ]/) }
puts phone

# grab name 
puts text.split("\n").reject(&:empty?)[0..5]
names = text.split("\n").reject(&:empty?)
name = names[0]
puts name
name = names[1] if !name.empty? && name.match(/(project|developer|resume|manager|CURRICULUM)/i)
puts name
name = "" if name.match(/(project|developer|resume|manager|CURRICULUM)/i)
puts name

#https://github.com/yomurb/yomu
