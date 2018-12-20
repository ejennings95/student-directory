$cohort_months = [
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

$width = 100

def input_students

  puts "Please enter the student's details when prompted.".center($width)
  puts "To finish, type 'completed'.".center($width)

  students = []


  puts "1) Please enter the name of the student:"
  name = gets.strip

    while true do

      if name.empty?
        name = "New Starter"
      end

      if name == "completed"
        break
      elsif name != "completed"
        puts "2) Please enter the date of birth of the student (dd/mm/yy):"
        birthday = gets.strip
        if birthday.empty?
          birthday = "tbc"
        end
        puts "3) Please enter the student's sport of choice:"
        sport = gets.strip
        if sport.empty?
          sport = "tbc"
        end
        puts "4) Please enter the student's cohort start month"
        while true do
          cohort = gets.strip
          break if $cohort_months.include?(cohort)
          puts "Please enter a correct month"
        end

      end

      students << {name: name, birthday: birthday, sport: sport, cohort: cohort.to_s}
        if students.count == 1
          puts "Now we have #{students.count} student."
        else
          puts "Now we have #{students.count} students."
        end

      puts "1) Please enter the name of the student:"
      name = gets.strip
    end
 students
end

def print_header
  puts "The students of Villains Academy".center($width)
  puts "------------------".center($width)
end

def print(names)
  monthhash = {}
  count = 1

      names.each do |student|
      start_month = student[:cohort]

        if monthhash[start_month] == nil
            monthhash[start_month] = []
        end

        monthhash[start_month] << "#{student[:name]} - date of birth: #{student[:birthday]}, sport of choice: #{student[:sport]} (#{student[:cohort]} cohort)"

        end
        $cohort_months.each do |months|
          monthhash.each do |month, info|
           if months == month
          puts "#{month.capitalize}:".center($width)
          info.each do |pupil|
            puts "#{count}. #{pupil}".center($width)
          count += 1
        end
        end
        end
end
end




def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student."
  else
    puts "Overall, we have #{names.count} great students."
  end
end

def less_than_12(names)
  puts "These students have less than 12 characters in there name:".center($width)
  names.each do |name|
    full_name = name[:name]
    full_name_no_space = full_name.gsub(" ", "")
    if full_name_no_space.length <= 12
      puts " - #{full_name}"
    end
  end
end

students = input_students
if students.empty?
else
  print_header
  print(students)
  print_footer(students)
  less_than_12(students)
end
