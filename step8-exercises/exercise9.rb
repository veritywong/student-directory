#DONE Right now if we have only one student, the user will see a message "Now we have 1 students"
#whereas it should be "Now we have 1 student"
#How can you fix it so that it uses the singular form when appropriate and plural form otherwise?

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
        if students.size < 2
            puts "Now we have #{students.count} student"
        else 
            puts "Now we have #{students.count} students"
        # get another name from the user
        end
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
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
