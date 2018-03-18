class GoodQuotes::Quotes

  @@all = []

  def self.all
    @@all
  end

  def self.scrape_brainyQuote
    brainyquote = Nokogiri::HTML(open("https://www.brainyquote.com/"))
    quotesList = brainyquote.css("#quotesList img")
    quotesList.first(10).each do |quote|
      @@all << {:quote => quote.attribute("alt").value.split(" - ")[0],
                    :author => quote.attribute("alt").value.split(" - ")[1]
      }
    end
    @@all
  end

  def self.list
    quotes = self.scrape_brainyQuote
    counter = 1
    quotes.each do |quote|
      GoodQuotes::Authors.new(quote[:author])
      puts "#{counter}. \"#{quote[:quote]}\" - #{quote[:author]}"
      counter +=1
    end
  end

end
