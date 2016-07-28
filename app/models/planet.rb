class Planet

  attr_reader :names, :planets

  def initialize
    @names = []
    generate_planets
  end

  def generate_planets
    count = Tatooine::Planet.count / 10
    @planets = Tatooine::Planet.list
    count.times do
      @planets.concat Tatooine::Planet.next
    end
    @planets.each do |planet|
      @names << planet.name
    end
    @names.sort!
  end


end