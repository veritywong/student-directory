@students = []
require "csv"

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. Save changes to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  puts "\nYou have chosen #{selection}:"
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
      # add the student hash to the array
      add_students(name, :november)
      puts "Now we have #{@students.count} students"
      # get another name from the user
      name = STDIN.gets.chomp
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

def show_students
  print_header
  print_student_list
  print_footer
end 

def print_header
  puts "\nThe students of Villains Academy"
  puts "------------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  # if load_students hasn't been run then overwrites file with new inputs
  puts "What file would you like to add the students to?"
  file = STDIN.gets.chomp
  CSV.open(file, "wb") do |csv|
    @students.each do |student|
      csv << student.values
    end
  end
end

def load_students(filename = "students.csv")
    CSV.foreach(filename) do |row|
      name, cohort = row
      add_students(name, cohort.to_sym)
    end
end

# is this method necessary?
def run_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # if not first argument then automatically loads students.csv
   load_students("students.csv")
  elsif File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "sorry #{filename} doesn't exist."
    exit
  end
end

run_load_students
interactive_menu
