class Scraper
  def self.scrape_list
    html = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    html.css('#ba-content table tr').each_with_index do |value, i|
      next if i == 0 || i == 1

      name = value.css('td')[1].css('a')[0].text
      brewery = value.css('td')[1].css('a')[1].text
      url = "https://www.beeradvocate.com" + value.css('td')[1].css('a').attribute("href").value

      Beer.new(name, brewery, url)
    end    
  end

  def self.scrape_beer(beer_obj)
    html = Nokogiri::HTML(open(beer_obj.url))

    beer_obj.rating = html.css('.ba-ravg').text
    beer_obj.location = html.css('#info_box > a')[1].text
    beer_obj.style = html.css('#info_box > a')[4].text
    beer_obj.ratings = html.css('#score_box .ba-ratings').text
    beer_obj.wants = html.css('.ba-wants').text
    beer_obj.gots = html.css('.ba-gots').text
  end
end