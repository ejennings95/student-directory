# first we need tyo create an array containing the students names
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
  ]

# create the method print_header
def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end

# create the method print
def print(names)
  names.each do |name|
    puts name
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
