require 'pry'
class GoodQuotes::Scraper

  def self.scrape
    brainyquote = Nokogiri::HTML(open("https://www.brainyquote.com/"))
    quotesList = brainyquote.css("#quotesList img")
    quotesArr = []
    quotesList.first(10).each do |quote|
      quotesArr << {:quote => quote.attribute("alt").value.split(" - ")[0],
                    :author => quote.attribute("alt").value.split(" - ")[1]
      }
    end
    quotesArr
  end

end
