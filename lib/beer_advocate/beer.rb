class Beer
  attr_accessor :name, :brewery, :url, :rating, :location, :style, :ratings, :wants, :gots

  @@all = []

  def initialize(name, brewery, url)
    @name = name
    @brewery = brewery
    @url = url

    @@all.push(self)
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end
end