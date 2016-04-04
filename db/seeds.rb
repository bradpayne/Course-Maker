# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'json'
#
#50.times do
#  name = Faker::Name.name
#  email = Faker::Internet.safe_email(name)
#
#  User.create(name: name, email: email, password_digest: "deis")
#end


User.create(name: "Brad", password: '12345678', email: 'bradleyp42@gmail.com')

#records = JSON.parse(File.read('Files_For_PA/code/instructor.json'))
#records.each do |record|
#  Instructor.create!(record)
#end

#course 
file = File.read('db/course.json')
course_hash = JSON.parse(file)

#course_hash.each do |c|
	#Course.create(id: c["id"], comment: c["comment"], term: c["term"], code: c["code"], name: c["name"], credits: c["credits"], indepedent_study: c["independent_study"]  )
#end 

course_hash.each do |c|
  @new_course = Course.create(id: c["id"], comment: c["comment"], term: c["term"], code: c["code"], name: c["name"], credits: c["credits"], indepedent_study: c["independent_study"]  )

  @subjects = c['subjects']
  @subjects.each do |sub|
    begin
      #Course_subject.create(course_id: @new_course.id, subject_id: sub['id'].tr!('-', ''))
    rescue => e
      puts "Error: #{e}"
    end
  end
end

#instructor
file = File.read('db/instructor.json')
inst_hash = JSON.parse(file)

inst_hash.each do |c|
	Instructor.create(comment: c["comment"], first: c["first"], last: c["last"]  )
end 

#subject
file = File.read('db/subject.json')
subj_hash = JSON.parse(file)

subj_hash.each do |c|
	Subject.create(comment: c["comment"], term: c["term"], name: c["name"], abbreviation: c["abbreviation"] )
end 






