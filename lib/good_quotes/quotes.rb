require 'nokogiri'
require 'open-uri'

class Quotes

  @@all = []

  def initialize
  brainyquote = Nokogiri::HTML(open("https://www.brainyquote.com/"))
  quotesList = brainyquote.css("#quotesList img")
    quotesList.each do |quote|
      {:quote=> quote.attribute("alt").value,
       :author_link=> quote.attribute("href").value
      }
      @@all << self
    end
  end

  def all
    puts @@all
  end

end

puts Quotes.new.all
