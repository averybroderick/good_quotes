require 'nokogiri'
require 'open-uri'

class GoodQuotes::CLI
  def call
    puts "Welcome to GoodQuotes"
    list_quotes
  end

  def list_quotes()
    brainyquote = Nokogiri::HTML(open("https://www.brainyquote.com/"))
    quotesList = brainyquote.css("#quotesList")
    puts quotesList.css("a").text

  end


end
