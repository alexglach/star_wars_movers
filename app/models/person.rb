class Person

  attr_reader :names, :people

  def initialize
    @names = []
    generate_people
  end

  def generate_people
    count = Tatooine::Person.count / 10
    @people = Tatooine::Person.list
    count.times do
      @people.concat Tatooine::Person.next
    end
    @people.each do |person|
      @names << person.name
    end
    @names.sort!
  end


end