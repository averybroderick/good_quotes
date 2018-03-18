class GoodQuotes::Quotes

  attr_accessor :quotes

  def initialize
    @quotes = GoodQuotes::Scraper.scrape
  end

  def self.list
    counter = 1
    @quotes.each do |quote|
      puts "#{counter}. #{quote[:quote]} - #{quote[:author]}" 
      counter +=1
    end
  end

end
