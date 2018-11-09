class CLI
  def run
    Scraper.scrape_short_list

    show_list
    
    puts "\nHello!\nPresented is a list of Beer Advocates Top 250 beers of all time, BUT for sanities sake we are only showing the first 25.\nIf you would like to see the full list say 'full' or select the placement number of any brew to see more info about it.\nFeel free to exit at any time by saying in 'q'"

    options
  end

  def show_list
    Beer.all.each.with_index(1) do |beer, i|
      puts "#{i}. #{beer.name} by #{beer.brewery}"
    end
  end

  def options
    @input = gets.chomp

    if @input == "q"
      puts "\n\n\n\n\nGo drink a beer\n\n\n\n\n"
    else
      if @input == "full"
        Scraper.scrape_full_list
        show_list
        puts "\nSelect the placement number of any brew to see more info about it or exit by saying 'q'"
      elsif @input.to_i.between?(1, 250)
        binding.pry
      else
        puts "\nInvalid response, please try again.\nTo see the full list type 'full', or exit by saying 'q'"
      end
      options
    end
  end
end