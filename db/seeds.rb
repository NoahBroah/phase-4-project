# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'

# u1 = User.create!({ username:'Noah', password:'mypassword'})
# u2 = User.create!({ username:'Jerm', password:'mypassword'})
# u3 = User.create!({ username:'Mia', password:'mypassword'})
p1 = Project.create!({ title: "Collaborative Art Project", description:"Let's make a cool project together", number_of_people:30, user_id:1 })
p2 = Project.create!({ title: "Collaborative Music Project", description:"Let's make a cool Music project together", number_of_people:12, user_id:1 })
p3 = Project.create!({ title: "Collaborative Business Project", description:"Let's collaborate on a business idea", number_of_people:5, user_id:2 })
p4 = Project.create!({ title: "Collaborative Coding Project", description:"Let's make a cool Coding project together", number_of_people:3, user_id:2 })
p5 = Project.create!({ title: "Collaborative Pottery Project", description:"Let's make a cool Pottery project together", number_of_people:10, user_id:3 })
p6 = Project.create!({ title: "Collaborative Mural Project", description:"Let's make a cool Mural together", number_of_people:4, user_id:3 })
n1 = Note.create!({ comment: "I would love to work on this with you!", user_id:1, project_id:11})
n2 = Note.create!({ comment: "I would love to work on this with you!", user_id:1, project_id:12})
n3 = Note.create!({ comment: "I would love to work on this with you!", user_id:2, project_id:11})
n4 = Note.create!({ comment: "I would love to work on this with you!", user_id:2, project_id:13})
n5 = Note.create!({ comment: "I would love to work on this with you!", user_id:3, project_id:13})
n6 = Note.create!({ comment: "Great lets do it!", user_id:1, project_id:12})
n7 = Note.create!({ comment: "I would love to work on this with you!", user_id:1, project_id:15})









# end   