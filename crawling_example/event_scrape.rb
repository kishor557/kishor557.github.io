require 'nokogiri'
require 'open-uri'
require 'pry'


class EventScrape

  def parse
    base_url = "https://www.sympla.com.br/eventos?ordem=data"
    i = 1
    total_list = []
    
    loop do
       page_url = base_url + "&pagina=#{i}"
       list, is_end = getEventList(page_url)
       
       list.each do |item|
         puts item['href']
         total_list << item['href']
         #puts "\n\n\n\n"
       end        
       puts "Total......#{total_list.count}"
       
       i += 1
       break if is_end
    end
  end

  def getEventList(url)
     puts url
     doc = getDoc(url)
     list = doc.css(".event-box-link")
     puts list.count
     [list, (list.count == 0)]
  end


  def getDetails(link)
     pagedoc = getDoc(link) 
     name = pagedoc.at_css(".uppercase").text 
     puts name

     date = pagedoc.at_css(".fa-calendar").next_sibling.text #.text
     puts date.strip
=begin          
     location = pagedoc.at_css(".fa-map-marker+ font font").text
     desc = pagedoc.at_css("#event-txt").text
     org_name = pagedoc.at_css("#produtor .kill-top-margin").text
     result = {}
     result["name"] = name
     result["date"] = date
     result["location"] = location
     result["desc"] = desc
     result["org name"] = org_name
     puts result.inspect
=end     
#     org_email = pagedoc.at_css()
  end

  def getDoc(url)
    Nokogiri::HTML(open(url))
  end
  
end


obj = EventScrape.new
#obj.parse
obj.getDetails("https://www.sympla.com.br/shop-oscar---yoga-da-uniao---vinyasa-flow-com-rafa-vercosa__261258")
#obj.getDetails("https://www.sympla.com.br/oficina-de-mantras__262241")
#obj.getDetails("https://www.sympla.com.br/shooting-do-bem---espaco-beauty-jardins__272528")

#obj.getEventList("https://www.sympla.com.br/eventos")

#https://www.sympla.com.br/eventos

# pagination: https://www.sympla.com.br/eventos?ordem=data&pagina=3

# .event-box-link

#QUES:
# 1. How many results you want to scrape from the website?
# 2. Can we scrape only the results with in one week/one month?
# 3. Do you want to scrape them by city wise?
# 4. 
