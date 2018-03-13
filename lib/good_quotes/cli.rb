require 'nokogiri'
require 'open-uri'

class GoodQuotes::CLI
  def call
    puts "Welcome to GoodQuotes. Here are today's Top Ten Trending Quotes: "
    list_quotes
    menu
  end

  def list_quotes
    brainyquote = Nokogiri::HTML(open("https://www.brainyquote.com/"))
    quotesList = brainyquote.css("#quotesList img")
    counter = 1
    quotesList.each do |quote|
      while counter <= 10
        puts "#{counter}. " + quote.attribute("alt").value
        counter += 1
      end
    end
  end

  def menu
    input = nil
    puts "Type in the quote number to learn more about the author, or type 'exit' to end current session."
    until input == "exit"
      input = gets.strip
    end
  end


end
