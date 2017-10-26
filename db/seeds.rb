# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
d = User.create(email:"d@d.com", password:"123456", first_name: "Dean", last_name:"Banik")
l = User.create(email:"l@l.com", password:"123456", first_name:"Luke", last_name:"Glayat")
h = User.create(email:"h@h.com", password:"123456", first_name:"Hui", last_name:"Wang")
n = User.create(email:"n@n.com", password:"123456", first_name:"Neil", last_name:"Steiner")
n = User.create(email:"y@k.com", password:"123456", first_name:"Yamini", last_name:"Kumawat")
n = User.create(email:"k@w.com", password:"123456", first_name:"Kesean", last_name:"Woodhouse")
n = User.create(email:"k@n.com", password:"123456", first_name:"Kenny", last_name:"Lin")
n = User.create(email:"r@m.com", password:"123456", first_name:"Roman", last_name:"Mullady")
n = User.create(email:"g@r.com", password:"123456", first_name:"GianPaul", last_name:"Rachiele")
n = User.create(email:"g@d.com", password:"123456", first_name:"Gabi", last_name:"Davila")
n = User.create(email:"i@l.com", password:"123456", first_name:"Isabelle", last_name:"Letaconnoux")
n = User.create(email:"t@f.com", password:"123456", first_name:"Tim", last_name:"Freeman")

cat1 = Category.create(name:"Science, Technology, Engineering, and Mathematics")
cat2 = Category.create(name:"Politics, Law, Government, and Judiciary")
cat3 = Category.create(name:"Food, Cuisines, and Cooking")
cat4 = Category.create(name:"Education, Schools, and Learning")
cat5 = Category.create(name:"Art, Design, and Style")
cat6 = Category.create(name:"News, Entertainment, and Pop Culture")
cat7 = Category.create(name:"Business, Work, and Careers")
cat8 = Category.create(name:"Life, Relationships, and Self")
cat9 = Category.create(name:"Recreation, Sports, Travel, and Activities")
cat10 = Category.create(name:"Social Media")
cat11 = Category.create(name:"Health and Medicine")
cat12 = Category.create(name:"Startups")
# cat8 = Category.create(name:"History, Philosophy, Religion, and Humanities")
# cat8 = Category.create(name:"History, Philosophy, Religion, and Humanities")

roses = Question.create(title:"Why are roses red?", user_id:1, category_id:1)
trump = Question.create(title:"Will Trump quit before his term ends?", user_id:2, category_id:2)
trump = Question.create(title:"Does the electoral college discourage voting?", user_id:2, category_id:2)
sun = Question.create(title:"How far are we from the sun?", user_id:3, category_id:1)
sun_big = Question.create(title:"How big is the sun?", user_id:4, category_id:1)
sun_big = Question.create(title:"If everything was free for 10 minutes, what would you take?", user_id:4, category_id:1)
sun_big = Question.create(title:"Can 1000 programmers develop an operating system from scratch in 2 years?", user_id:1, category_id:1)
sun_big = Question.create(title:"When a train makes a turn, isn't its outer wheel covering more distance than the inner one? How come the train doesn't come off the tracks?", user_id:4, category_id:1)
sun_big = Question.create(title:"What can I do with a mathematical physics degree?", user_id:4, category_id:1)
sun_big = Question.create(title:"What are the differences between applied math and theoretical math?", user_id:6, category_id:4)
sun_big = Question.create(title:"What are some must-know-and-understand mathematical equations for a career as a physicist?", user_id:4, category_id:1)
sun_big = Question.create(title:"Who would be the strongest Democratic nominee for President in 2020?", user_id:4, category_id:2)
sun_big = Question.create(title:"What is the single biggest reason why Hillary Clinton lost the U.S. elections to Donald Trump?", user_id:4, category_id:2)


red = Answer.create(title:"It only looks red because the light emited from roses due to its celular structure is towards the red spectrum.", user_id:1, question_id:1)
Answer.create(title:"To attract bees", user_id:2, question_id:1)
Answer.create(title:"Most likely", user_id:4, question_id:2)
# Answer.create(title:"He's a lazy piece of shit! Ofc he will!", user_id:3, question_id:2)
Answer.create(title:"92.96 million miles", user_id:1, question_id:3)
Answer.create(title:"149.6 million km", user_id:4, question_id:3)
Answer.create(title:"1.3914 million km", user_id:3, question_id:4)


Vote.create(user_id:1, vote_count:1, answer_id:1)
Vote.create(user_id:2, vote_count:1, answer_id:1)
Vote.create(user_id:2, vote_count:1, answer_id:2)
Vote.create(user_id:3, vote_count:1, answer_id:3)


sc = Tag.create(name:"science")
ph = Tag.create(name:"Philosophy")
pol = Tag.create(name:"Politics")
ent = Tag.create(name:"Entertainment")
art = Tag.create(name:"Art")
des = Tag.create(name:"Design")
news = Tag.create(name:"News")
his = Tag.create(name:"History")
gov = Tag.create(name:"Government")
Tag.create(name:"Health")
Tag.create(name:"Business")
Tag.create(name:"Startups")
Tag.create(name:"Marketing")
Tag.create(name:"TV")
Tag.create(name:"Movie")
Tag.create(name:"History of the United States of America")
Tag.create(name:"History")
Tag.create(name:"Religion")
Tag.create(name:"Books")
Tag.create(name:"Journalism")
Tag.create(name:"Music")
Tag.create(name:"Rock Music")
Tag.create(name:"Hip-Hop")
Tag.create(name:"Humor")
Tag.create(name:"Photography")
Tag.create(name:"Soccer")
Tag.create(name:"Football")
Tag.create(name:"Java")
Tag.create(name:"C++")
Tag.create(name:"Ruby")
Tag.create(name:"Javascript")
Tag.create(name:"International Relations")
Tag.create(name:"Computer Science")
Tag.create(name:"Tourism")
Tag.create(name:"Mathematics")
Tag.create(name:"Algebra")
Tag.create(name:"Calculus")
Tag.create(name:"Flatiron School")


roses.tags << sc
roses.tags << ph
trump.tags << pol
sun.tags << sc
sun_big.tags << sc
