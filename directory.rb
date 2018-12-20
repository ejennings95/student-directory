def input_students
# here we are about to ask for the student detials and give an instruction on how to get out the while loop that will follow
  puts "Please enter the student's details when prompted."
  puts "To finish, type 'completed'."
# create an empty array, this allows us to store the information we gather from the user
  students = []
# get the first name using ‘gets’ and .chomp to remove the line drop, if completed end. Otherwise continue through more details
  puts "Please enter the name of the student:"
  name = gets.chomp
  if name != "completed"
    puts "Please enter the date of birth of the student (dd/mm/yy):"
    birthday = gets.chomp
    puts "Please enter the student's sport of choice:"
    sport = gets.chomp
# as the name was not 'completed' we need the while loop to keep asking and store the information in our array
    while true do
      students << {name: name, birthday: birthday, sport: sport, cohort: :november}
# above shows us we are hardcoding all but the name, birthday and sport that we are given. we are using the shovel operator to push the data into our empty array
# now we need to put the student count
      puts "Now we have #{students.count} students."
# ask for the next name, birthday and sport. if name has our get out clause of 'completed' then end
      puts "Please enter the name of the student:"
      name = gets.chomp
      if name == "completed"
        break
      elsif name != "completed"
        puts "Please enter the date of birth of the student (dd/mm/yy):"
        birthday = gets.chomp
        puts "Please enter the student's sport of choice:"
        sport = gets.chomp
      else
      end
    end
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
  count = 1
  while count <= names.count
    names.each do |name|
      puts "#{name[:name]}, date of birth: #{name[:birthday]}, sport of choice: #{name[:sport]} (#{name[:cohort]} cohort)"
      count += 1
    end
  end
end

# create the method print_footer with counter
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# create a print for names under 12 characters
def less_than_12(names)
  puts "These students have less than 12 characters in there name:"
  names.each do |name|
    full_name = name[:name]
    full_name_no_space = full_name.gsub(" ", "")
    if full_name_no_space.length <= 12
      puts full_name
    end
  end
end

# call the methods:
students = input_students
# the above is important as it allows us to equate students to the data from input_students
print_header
print(students)
print_footer(students)
less_than_12(students)
