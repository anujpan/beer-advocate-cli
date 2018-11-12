class Scraper
  BA_URL = "https://www.beeradvocate.com"

  def self.scrape_list
    html = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    html.css('#ba-content table tr').each_with_index do |value, i|
      next if i == 0 || i == 1

      name = value.css('td')[1].css('a')[0].text
      brewery = value.css('td')[1].css('a')[1].text
      url = "https://www.beeradvocate.com" + value.css('td')[1].css('a')[1].attribute("href").value

      Beer.new(name, brewery, url)
    end    
  end

  def self.scrape_beer(beer_obj)
    binding.pry
    # get rating
    # get brewery location
    # get style
    # get abv
    # get description
    # get availability
    # get number of ratings
    # get how many people want it
    # get how many people have it
    # get how many people want to trade
  end
end