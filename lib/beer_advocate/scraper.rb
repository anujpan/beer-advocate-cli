class Scraper
  @@html = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
  
  def self.scrape_list
    @@html.css('#ba-content table tr')[2...252].each do |value, i|
      name = value.css('td')[1].css('a')[0].text
      brewery = value.css('td')[1].css('a')[1].text

      Beer.new(name, brewery)
    end    
  end

  def self.scrape_beer

  end
end