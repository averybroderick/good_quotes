class GoodQuotes::Authors

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all.each do |author|
      puts author.name
    end
  end


  def self.findByName(name)

  end

end
