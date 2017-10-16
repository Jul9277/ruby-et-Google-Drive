require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


#1er exercice: récupérer une adresse mail sur une page 
def get_the_email_of_a_townhal_from_its_webpage (page_url)


 page = Nokogiri::HTML(open(page_url))
 emails =page.css("p.Style22")
 emails.each do |line|
		if line.text.include?("@")
        puts line.text
    end
end
 	
 	#binding.pry
	
end


def get_all_the_urls_of_val_doise_townhalls (url)
	#déclarer un tableau
	array =[]

	page = Nokogiri::HTML(open(url))
	liens =page.xpath("//a[@class=\"lientxt\"]").each do |node|
		puts node[:href]
		#ajouter "http://annuaire-des-mairies.com/" + node[:href] au tableau
        array << "http://annuaire-des-mairies.com/" + node[:href]
    end

    return array
    #renvoyer le tableau
end


url= "http://annuaire-des-mairies.com/val-d-oise.html"
get_all_the_urls_of_val_doise_townhalls(url).each do |townhalls|
get_the_email_of_a_townhal_from_its_webpage(townhalls)
end
