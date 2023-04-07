#DONE only print list if student is entered

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create and empty array
    students = []
    # get the first name
    name = gets.strip
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.strip
    end
    # return the array of students
    students
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_header(students)
    if students.size > 0 then
    puts "The students of Villains Academy"
    puts "------------------"
    end
  end  

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header(students)
print(students)
print_footer(students)
