class Vehicle

  attr_reader :all, :vehicles

  def initialize
    @all = []
    generate_vehicles
  end

  def generate_vehicles
    @vehicles = Tatooine::Vehicle.list
    3.times do
      @vehicles.concat Tatooine::Vehicle.next
    end
    @vehicles.each do |vehicle|
      @all << vehicle.name
    end
    @all.sort!
  end


end