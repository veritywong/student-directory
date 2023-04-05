@students = []

def print_menu
  puts "1. Input the students"
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

def action
  puts "\n - action successful - 
  "
end

def process(selection)
  case selection
    when "1"
      input_students
      action
    when "2"
      show_students
      action
    when "3"
      save_students
      action
    when "4"
      load_students
      action
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
  puts "The students of Villains Academy"
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
  puts "What file would you like to add the students to?"
  file = STDIN.gets.chomp
  file = File.open(file, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = STDIN.gets.chomp)
  puts "What file would you like to load?"
  file_choice = STDIN.gets.chomp
  file = File.open(file_choice, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name, cohort.to_sym)
  end
  file.close
end

def run_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # if not first argument then automatically loads students.csv
    load_students(filename)
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
