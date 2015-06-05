# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Teacher.delete_all
Assignment.delete_all
Assistant.delete_all
Review.delete_all
School.delete_all
User.delete_all

# Create the teachers
puts "Creating schools..."
ps101 = School.create(name: "PS 101")
ms101 = School.create(name: "MS 101")
hs101 = School.create(name: "HS 101")
hs102 = School.create(name: "HS 102")
hs103 = School.create(name: "HS 103")

# Create the teachers
puts "Creating teachers..."
katelyn = Teacher.create(name: "Katelyn Coleman", school_id: hs101.id, subject: "Math", grade: "10")
beth = Teacher.create(name: "Beth Rich", school_id: ps101.id, subject: "Special Ed", grade: "3")
chen = Teacher.create(name: "Chen Liu", school_id: hs101.id, subject: "Science", grade: "10")
siby = Teacher.create(name: "Siby Phillips", school_id: hs101.id, subject: "English", grade: "9")
david = Teacher.create(name: "David Studer", school_id: ms101.id, subject: "Science", grade: "8")

# Create the assistants
puts "Creating assistants..."
alex = Assistant.create(name: "Alex", subject_pref: "science", grade_pref: "9-12")
barbara = Assistant.create(name: "Barbara", subject_pref: "social studies", grade_pref: "6-8")
catherine = Assistant.create(name: "Catherine", subject_pref: "science", grade_pref: "6-8")
donald = Assistant.create(name: "Donald", subject_pref: "english", grade_pref: "9-12")
evan = Assistant.create(name: "Evan", subject_pref: "math", grade_pref: "9-12")

# Create the assignments
puts "Creating assignments..."
assignment1 = Assignment.create(name: "Math HW1", teacher_id: katelyn.id, num_assignments: "100", due_date: "May 1, 2015", estimate_time: "2", assistant_id: alex.id)
assignment2 = Assignment.create(name: "Science Lab 1", teacher_id: chen.id, num_assignments: "120", due_date: "May 5, 2015", estimate_time: "6", assistant_id: catherine.id)
assignment3 = Assignment.create(name: "Exam 1", teacher_id: chen.id, num_assignments: "150", due_date: "May 10, 2015", estimate_time: "4", assistant_id: alex.id)
assignment4 = Assignment.create(name: "Worksheet 1", teacher_id: beth.id, num_assignments: "15", due_date: "May 2, 2015", estimate_time: "1", assistant_id: donald.id)
assignment5 = Assignment.create(name: "English Essay 2", teacher_id: siby.id, num_assignments: "30", due_date: "June 1, 2015", estimate_time: "5", assistant_id: alex.id)

# Create the reviews
puts "Creating reviews..."
review1 = Review.create(assistant_id: alex.id, date: "April 15 2015", stars: "5", review: "Great job!")
review2 = Review.create(assistant_id: barbara.id, date: "April 13 2015", stars: "4", review: "Good but late")
review3 = Review.create(assistant_id: barbara.id, date: "April 11 2015", stars: "1", review: "Terrible!")
review4 = Review.create(assistant_id: donald.id, date: "April 15 2015", stars: "5", review: "Awesome!")
review5 = Review.create(assistant_id: catherine.id, date: "April 20 2015", stars: "4", review: "Pretty good.")

#Create the users
puts "Creating users"
katelyn = User.create(name: "Katelyn Coleman", email: "katelyn@gmail.com", password: "squirtle123", teacher_id: katelyn.id)
beth = User.create(name: "Beth Rich", email: "beth@gmail.com", password: "jigglypuff123", teacher_id: beth.id)
chen = User.create(name: "Chen Liu", email: "chen@gmail.com", password: "pikachu123", teacher_id: chen.id)
siby = User.create(name: "Siby Phillips", email: "siby@gmail.com", password: "golem123", teacher_id: siby.id)
david = User.create(name: "David Studer", email: "david@gmail.com", password: "mew123", teacher_id: david.id)
alex = User.create(name: "Alex", email: "alex@gmail.com", password: "meowth123", assistant_id: alex.id)
barbara = User.create(name: "Barbara", email: "barbara@gmail.com", password: "bulbasaur123", assistant_id: barbara.id)
catherine = User.create(name: "Catherine", email: "catherine@gmail.com", password: "charmeleon123", assistant_id: catherine.id)
donald = User.create(name: "Donald", email: "donald@gmail.com", password: "charizard123", assistant_id: donald.id)
evan = User.create(name: "Evan", email: "evan@gmail.com", password: "snorlax123", assistant_id: evan.id)


puts "There are now #{Teacher.count} teachers, #{Assistant.count} assistants, #{Assignment.count} assignments, and #{Review.count} reviews in the database."

