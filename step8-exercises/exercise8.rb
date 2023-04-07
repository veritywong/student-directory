# DONE change the way the users are displayed: print them grouped by cohorts
# To do this, you'll need to get a list of all existing cohorts
# (the map() method may be useful but it's not the only option)
# iterate over it and only print the students from that cohort.

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create and empty array
    students = [{name: :Sally, cohort: :november},
                {name: :Jim, cohort: :november},
                {name: :Cain, cohort: :december}
                ]
    # get the first name
    name = gets.chomp
    cohort = gets.chomp.to_sym
    cohort = :january if cohort.empty?
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
        cohort = gets.chomp
        cohort = :january if cohort.empty?
    end
    # return the array of students
    students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end

def print(students)
    puts "November Cohort:"
  students.each_with_index do |student, index|
    if student[:cohort] == :november
    puts "#{index + 1}. #{student[:name]}"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
