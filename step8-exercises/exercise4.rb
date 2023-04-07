# DONE Rewrite each() method that prints all students using while or until control flow methods (Loops)

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create and empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end

def print(students)
  index = 0
  while index < students.size do
    student = students[index]
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    index += 1
  end
end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students.flatten
print_header
print(students)
print_footer(students)