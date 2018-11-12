class CLI
  def run
    Scraper.scrape_list

    show_list(25)
    
    puts "\nHello!\nPresented is a list of Beer Advocates Top 250 beers of all time.\nSelect the placement number of any brew to see more info about it.\nFeel free to exit at any time by saying in 'q'"

    options
  end

  def show_list(amount)
    # stop each at amount if its designated
    Beer.all.each.with_index(1) do |beer, i|
      puts "#{i}. #{beer.name} by #{beer.brewery}"
      break if i == amount
    end
  end

  def options
    @input = gets.chomp

    if @input == "q"
      puts "\n\n\n\n\nGo drink a beer\n\n\n\n\n"
    else
      if @input == "full"
        show_list(250)
        puts "\nSelect the placement number of any brew to see more info about it or exit by saying 'q'"
      elsif @input.to_i.between?(1, 250)
        selection = Beer.all[@input.to_i - 1]
        Scraper.scrape_beer(selection)

        puts "\n#{selection.name} is brewed in #{selection.location} by #{selection.brewery} and is in the style of a(n) #{selection.style}.\nIt has a rating of #{selection.rating} that is based on #{selection.ratings} votes by beer advocate users.\nIf you are looking to get one #{selection.gots} people have them and #{selection.wants} are in the same boat as you"

        puts "\nSelect another placement number to see more info about it or say 'full' to see the full list again.\nFeel free to exit at any time by saying in 'q'"
      else
        puts "\nInvalid response, please try again.\nTo see the full list type 'full', or exit by saying 'q'"
      end
      options
    end
  end
end