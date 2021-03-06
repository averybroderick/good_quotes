class GoodQuotes::CLI

  def call
    puts "Welcome to GoodQuotes. Here are today's Trending Quotes: "
    list_quotes
    menu
  end

  def list_quotes
    GoodQuotes::Quotes.list
  end

  def menu
    input = nil
    puts "Type in the quote number to learn more about the author, or type 'exit' to end current session."
    until input == "exit"
      input = gets.strip.to_i
      if input >= 1 && input <= 10
        puts "Here are #{GoodQuotes::Quotes.all[input-1][:author]}'s top 3 books:"
        GoodQuotes::Authors.all
        # GoodQuotes::Authors.findByName(GoodQuotes::Quotes.all[input-1][:author]).books
        input = gets.strip
      end
    end
  end

end
