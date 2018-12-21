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

def input_students_instructions
  puts "Please enter the student's details when prompted.".center($width)
  puts "To finish, type 'completed'.".center($width)
  puts "1) Please enter the name of the student:"
  name = STDIN.gets.strip
  if name == "completed"
    interactive_menu
  end
  inputting_students(name)
end

def inputting_students(name)
  while true do
    if name.empty?
      name = "New Starter"
    end

    if name == "completed"
      break
    elsif name != "completed"
      puts "2) Please enter the date of birth of the student (dd/mm/yy):"
      birthday = student_details
      puts "3) Please enter the student's sport of choice:"
      sport = student_details
      puts "4) Please enter the student's cohort start month"
      cohort = cohort_check
    end

    add_to_students(name, birthday, sport, cohort)
    return_new_count

    puts "1) Please enter the name of the student:"
    name = STDIN.gets.strip
  end
end

def student_details
  answer = STDIN.gets.strip
  answer.empty? ? answer = "tbc" : answer
end

def cohort_check
  while true do
    cohort = STDIN.gets.downcase.strip
    break if $cohort_months.include?(cohort)
    puts "Please enter a correct month"
  end
  cohort
end

def add_to_students(name, birthday, sport, cohort)
  @students << {name: name, birthday: birthday, sport: sport, cohort: cohort}
end

def return_new_count
  if @students.count == 1
    puts "Now we have #{@students.count} student."
  else
    puts "Now we have #{@students.count} students."
  end
end

def interactive_menu
  @students.empty? ? try_load_students : nil
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
  print_students_by_cohort
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students_instructions
  when "2"
    show_students
  when "3"
    saved_students
  when "4"
    load_students
  when "9"
    puts "Goodbye!"
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
  puts "Save complete."
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, birthday, sport, cohort = line.chomp.split(",")
    add_to_students(name, birthday, sport, cohort)
  end
  file.close
  number_loaded(filename)
end

def try_load_students
  filename = ARGV.first
  filename.nil? ? filename = "students.csv" : nil
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

def number_loaded(filename)
  if @students.count == 1
    puts "Loaded #{@students.count} student from #{filename}."
  else
    puts "Loaded #{@students.count} students from #{filename}."
  end
end

def print_header
  puts "The students of Villains Academy".center($width)
  puts "------------------".center($width)
end

def create_hash_by_cohort
  @monthhash = {}
  @students.each do |student|
    start_month = student[:cohort]

      if @monthhash[start_month] == nil
          @monthhash[start_month] = []
      end
    @monthhash[start_month] << "#{student[:name]} - date of birth: #{student[:birthday]}, sport of choice: #{student[:sport]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_students_by_cohort
  create_hash_by_cohort
  count = 1
  $cohort_months.each do |months|
    @monthhash.each do |month, info|
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
