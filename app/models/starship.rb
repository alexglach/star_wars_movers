class Starship

  attr_reader :names, :starships

  def initialize
    @names = []
    generate_starships
  end

  def generate_starships
    count = Tatooine::Starship.count / 10
    @starships = Tatooine::Starship.list
    count.times do
      @starships.concat Tatooine::Starship.next
    end
    @starships.each do |starship|
      @names << starship.name
    end
    @names.sort!
  end


end