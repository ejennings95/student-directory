def input_students
# here we are about to ask for the names and give an instruction on how to get out the while loop that will follow
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# create an empty array, this allows us to store the information we gather from the user
  students = []
# get the first name using ‘gets’ and .chomp to remove the line drop
  name = gets.chomp
# while the name is not(!) empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
# above shows us we are hardcoding all but the name that we are given and using the shovel operator to push the data into our empty array
    puts "Now we have #{students.count} students."
# ask for the next name
    name = gets.chomp
# this is taking another name to be added to our hash and then subsequently our array. If it is left empty then the loop is broken
  end
# return the students
  students
end

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
students = input_students
# the above is important as it allows us to equate students to the data from input_students
print_header
print(students)
print_footer(students)
