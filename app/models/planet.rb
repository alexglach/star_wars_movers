class Planet

  attr_reader :all, :planets

  def initialize
    @all = []
    generate_planets
  end

  def generate_planets
    @planets = Tatooine::Planet.list
    6.times do
      @planets.concat Tatooine::Planet.next
    end
    @planets.each do |planet|
      @all << planet.name
    end
    @all.sort!
  end


end