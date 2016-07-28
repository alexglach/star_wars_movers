class Vehicle

  attr_reader :names, :vehicles

  def initialize
    @names = []
    generate_vehicles
  end

  def generate_vehicles
    # count = Tatooine::Vehicle.count / 10
    @vehicles = Tatooine::Vehicle.list
    # count.times do
    #   @vehicles.concat Tatooine::Vehicle.next
    # end
    @vehicles.each do |vehicle|
      @names << vehicle.name
    end
    @names.sort!
  end


end