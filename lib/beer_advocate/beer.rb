class Beer
  attr_accessor :name, :brewery, :url

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