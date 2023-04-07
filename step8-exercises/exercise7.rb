# DONE The cohort value is hard-coded. How can you ask for both the name and cohort? 
# DONE What if one of the values is empty? can you supply a default value?
# DONE the input will be given as a string, how will you conver it to a symbol?
# TODO what if the user makes a typo? 

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create and empty array
    students = []
    # get the first name
    name = gets.chomp
    cohort = gets.chomp.to_sym
    cohort = :january if cohort.empty?
    possible_cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    if !possible_cohorts.include?(cohort)
      puts "Cohort not recognised, please type again"
      cohort = gets.chomp
    end
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
        cohort = gets.chomp
        cohort = :january if cohort.empty?
        if !possible_cohorts.include?(cohort)
          puts "Cohort not recognised, please type again"
          cohort = gets.chomp
        end
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
