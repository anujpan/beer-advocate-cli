class Beer
  attr_accessor :name, :brewery

  @@all = []

  def initialize(name, brewery)
    @name = name
    @brewery = brewery

    @@all.push(self)
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end
end