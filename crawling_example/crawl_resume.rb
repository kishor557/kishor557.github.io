class CrawlResume
  
  def self.parse(text)
     f = File.open(text)
     text = f.read if f.is_a?(File)
    
    result = {}
    
    ## phone number extraction
    phone = text.scan(/(\d{3})\D{0,3}(\d{3})\D{0,3}(\d{4})/).map{|e| e.join(' ')}
    result["phone"] = phone.first
    
    ## email extraction
    email = text.scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)
    result["email"] = email.first
    
    ## postal, state extraction
    loc = text.scan(/([A-Z]{2,3} [0-9]{5,6})/).first
    state, postal = loc.is_a?(Array) ? loc[0].split(" ") : ["", loc]
    postal = text.scan(/[0-9]{5,6}/).first if postal.nil?
    result["state"] = state
    result["postalCode"] = postal
    
    
    # grab name 
    names = text.split("\n").reject(&:empty?)
    name = names[0]
    puts name.inspect
    name = names[1] if !name.empty? && name.match(/(project|developer|resume|manager|CURRICULUM)/i)
        puts name.inspect
    name = "" if name.match(/(project|developer|resume|manager|CURRICULUM)/i)
        puts name.inspect
    result["firstName"] = name.strip
    
    skills = skills_list(text)
    result["primarySkills"] = skills.join(", ")
    
    result
  end
  
  def self.skills_list(text)
    list = []
    split_by_newlines = text.split("\n").map(&:strip)


    split_by_newlines.each do |line|
      arr = line.split(",").map(&:strip)
      list << arr
    end
    list1 = list.flatten!.uniq
    ar = list1.delete_if {|v| !v.match(/(c#|java|ruby|program|software|design|web|.NET|sql|oracle|soa|html|xml|agile|wcf|server|js|jquery|angular|Window|kit|studio|swift|sqlite|db|ooa|unix|mac|os|action|c++|flex)/i) }
    skills = ar.delete_if {|v| v.length > 15 }
    skills = skills.map{|e| e.gsub(/\(|\)/, "") }.uniq
    skills
  end
  
end

r = CrawlResume.parse("/home/srinivas/Downloads/Zoe_Rawlings__Resume.pdf.txt")
puts "\n\n.....#{r.inspect}..\n"
