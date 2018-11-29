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

  def set_additional_attrs(values)
    values.each do |key, value|
      self.send "#{key}=", value
    end
  end
end