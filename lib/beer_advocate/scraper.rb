class Scraper
  @@html = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
  
  def self.scrape_list
    @@html.css('#ba-content table tr').each_with_index do |value, i|
      next if i == 0 || i == 1
      
      name = value.css('td')[1].css('a')[0].text
      brewery = value.css('td')[1].css('a')[1].text

      Beer.new(name, brewery)
    end    
  end

  def self.scrape_beer
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