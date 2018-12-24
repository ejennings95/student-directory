require "csv"
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
  puts "3 - Save student date to file"
  puts "4 - Load student data from file"
  puts "5 - Source code of current file"
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
    load_from_file
  when "5"
    source_code
  when "9"
    puts "Goodbye!"
    exit
  else
    puts "Sorry, I do not know this command."
  end
end

def saved_students
  puts "Where would you like to save the student records?"
  filename = STDIN.gets.strip
  CSV.open("#{filename}", "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:birthday], student[:sport], student[:cohort]]
    end
  end
  puts "Save complete."
end

def load_students(filename)
  CSV.foreach("#{filename}") do |row|
    name, birthday, sport, cohort = row
    add_to_students(name, birthday, sport, cohort)
  end
  number_loaded(filename)
end


def load_from_file
  loop do
    puts "Which file would you like to load date from?"
    puts "Type 'exit' to return to menu."
    answer = STDIN.gets.strip
    if File.exists?(answer)
      load_students(answer)
      break
    elsif answer == "exit"
      puts "Returning to menu."
      break
    else
      puts "Sorry, #{answer} does not exist."
    end
  end
end


def try_load_students
  filename = ARGV.first
  filename.nil? ? filename = "students.csv" : nil
  if File.exists?(filename)
    puts "Student data loaded from #{filename}."
    load_students(filename)
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

def number_loaded(filename)
  if @students.count == 1
    puts "There is now #{@students.count} student saved in this directory."
  else
    puts "There are now #{@students.count} students saved in this directory."
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

def source_code
  puts $0
end

interactive_menu
