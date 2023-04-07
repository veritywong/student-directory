# DONE research how the method center() of the String class works, use it to align output

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create and empty array
    students = []
    # get the first name
    puts "Please input name"
    name = gets.chomp
    puts "hobby?"
    hobby = gets.chomp
    puts "Country of birth?"
    country_of_birth = gets.chomp
    puts "height?"
    height = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november, hobby: hobby, country: country_of_birth, height: height}
        puts "Now we have #{students.count} students"
        # get another name from the user
        puts "Please input name"
        name = gets.chomp
        if !name.empty?
          puts "Please input hobby"
          hobby = gets.chomp
          puts "Country of birth?"
          country_of_birth = gets.chomp
        end
    end
    students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort).".center(80)
    puts "- Hobby: #{student[:hobby]}."
    puts "- Country of birth: #{student[:country]}."
    puts "- height: #{student[:height]}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
