require 'rubygems'
require 'nokogiri'
require 'open-uri'

start_time = Time.now
page = Nokogiri::HTML(open('http://dtylam.co/badgingsys.html'))

badgenames = page.css('h2')
badgesdesc = page.css('p#condition')

File.new('populateBadges.txt', 'w')
File.open('populateBadges.txt', 'w') do |f|
  	str = ""
	for i in 0..badgenames.length-1
	  str+="INSERT INTO badge VALUES(
		  null,
		  \""+badgenames[i]+"\",
		  \""+badgesdesc[i]+"\",
		  \""+badgenames[i].inner_html.downcase.delete(" ")+"\.jpg\"
		  \)\;\n"
	end
	f.write(str)
	f.close
end

p Time.now - start_time