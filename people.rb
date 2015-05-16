class Person
  attr_reader :name, :last_name, :salary
  def initialize name, last_name, salary
    @name = name
    @last_name = last_name
    @salary = salary
  end

end

class PersonPrinter
  def print_person person
    print "#{person.name} #{person.last_name} #{person.salary}\n"
  end
end

class PersonListPrinter
  def initialize person_printer
    @person_printer = person_printer
  end
  def print_all people
    people.each do |person|
      @person_printer.print_person person
    end
  end
end

worker = Person.new "John", "Smith", 20000

printer = PersonPrinter.new

list_printer = PersonListPrinter.new printer

employees = [
  Person.new("Adam", "Smith", 10000),
  Person.new("Wilson", "Jones", 22000),
  worker]

list_printer.print_all employees
