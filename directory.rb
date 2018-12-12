# first we need tyo create an hash containing the students names and their cohort
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
  ]

# create the method print_header
def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end

# create the method print
def print(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
end
end

# create the method print_footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# call the methods:
print_header
print(students)
print_footer(students)
