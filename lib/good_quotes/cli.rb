class GoodQuotes::CLI

  def call
    puts "Welcome to GoodQuotes. Here are today's Trending Quotes: "
    list_quotes
    menu
  end

  def list_quotes
    GoodQuotes::Quotes.new.list
  end

  def menu
    input = nil
    puts "Type in the quote number to learn more about the author, or type 'exit' to end current session."
    until input == "exit"
      input = gets.strip
    end
  end

end
