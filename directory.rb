def input_students

  puts "Please enter the student's details when prompted.".center(100)
  puts "To finish, type 'completed'.".center(100)

  students = []
  cohort_months = [
    'january',
    'february',
    'march',
    'april',
    'may',
    'june',
    'july',
    'august',
    'september',
    'october',
    'november',
    'december'
    ]

  puts "1) Please enter the name of the student:"
  name = gets.chomp

    while true do

      if name.empty?
        name = "New Starter"
      end

      if name == "completed"
        break
      elsif name != "completed"
        puts "2) Please enter the date of birth of the student (dd/mm/yy):"
        birthday = gets.chomp
        if birthday.empty?
          birthday = "tbc"
        end
        puts "3) Please enter the student's sport of choice:"
        sport = gets.chomp
        if sport.empty?
          sport = "tbc"
        end
        puts "4) Please enter the student's cohort start month"
        while true do
          cohort = gets.chomp
          break if cohort_months.include?(cohort)
          puts "Please enter a correct month"
        end

      end
        students << {name: name, birthday: birthday, sport: sport, cohort: cohort.to_s}
        puts "Now we have #{students.count} students."
        puts "1) Please enter the name of the student:"
        name = gets.chomp
    end
 students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "------------------".center(100)
end

def print(names)
  count = 1
  while count <= names.count
     names.each_with_index do |name, index|
      puts "#{index.to_i + 1}. #{name[:name]} - date of birth: #{name[:birthday]}, sport of choice: #{name[:sport]} (#{name[:cohort]} cohort)".center(100)
      count += 1
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

def less_than_12(names)
  puts "These students have less than 12 characters in there name:".center(100)
  names.each do |name|
    full_name = name[:name]
    full_name_no_space = full_name.gsub(" ", "")
    if full_name_no_space.length <= 12
      puts " - #{full_name}"
    end
  end
end

students = input_students

print_header
print(students)
print_footer(students)
less_than_12(students)
