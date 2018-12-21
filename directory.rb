@students = []
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
  puts "1) Please enter the name of the student:"
  name = STDIN.gets.strip

  while true do
    if name.empty?
      name = "New Starter"
    end

    if name == "completed"
      break
    elsif name != "completed"
      puts "2) Please enter the date of birth of the student (dd/mm/yy):"
      birthday = STDIN.gets.strip
        if birthday.empty?
          birthday = "tbc"
        end
      puts "3) Please enter the student's sport of choice:"
      sport = STDIN.gets.strip
        if sport.empty?
          sport = "tbc"
        end
      puts "4) Please enter the student's cohort start month"
      while true do
        cohort = STDIN.gets.strip
        break if $cohort_months.include?(cohort)
        puts "Please enter a correct month"
      end
    end

    @students << {name: name, birthday: birthday, sport: sport, cohort: cohort}
      if @students.count == 1
        puts "Now we have #{@students.count} student."
      else
        puts "Now we have #{@students.count} students."
      end

    puts "1) Please enter the name of the student:"
    name = STDIN.gets.strip
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.strip)
  end
end

def print_menu
  puts "1 - Input the students"
  puts "2 - Show the students"
  puts "3 - Save the list to students.csv"
  puts "4 - Load previous student data from students.csv"
  puts "9 - Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    saved_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "Sorry, I do not know this command."
  end
end

def saved_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:birthday], student[:sport], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, birthday, sport, cohort = line.chomp.split(",")
    @students << {name: name, birthday: birthday, sport: sport, cohort: cohort}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    if @students.count == 1
      puts "Loaded #{@students.count} student from #{filename}."
    else
      puts "Loaded #{@students.count} students from #{filename}."
    end
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

def print_header
  puts "The students of Villains Academy".center($width)
  puts "------------------".center($width)
end

def print_student_list
  monthhash = {}
  count = 1

  @students.each do |student|
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

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student."
  else
    puts "Overall, we have #{@students.count} great students."
  end
end

interactive_menu
