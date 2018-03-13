require 'nokogiri'
require 'open-uri'

class GoodQuotes::Quotes

  def self.list
    brainyquote = Nokogiri::HTML(open("https://www.brainyquote.com/"))
    quotesList = brainyquote.css("#quotesList img")
    counter = 1
    quotesList.each do |quote|
      puts "#{counter}. " + quote.attribute("alt").value
      counter +=1
    end
  end

end
