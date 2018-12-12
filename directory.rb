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
# now lets print them
puts "The students of Villains Academy"
puts "------------------"
students.each do |name|
  puts name
end
# finally we print the number of students we have
puts "Overall, we have #{students.count} great students"
