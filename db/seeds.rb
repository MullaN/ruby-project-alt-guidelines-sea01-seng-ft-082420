Teacher.destroy_all
Student.destroy_all
Classroom.destroy_all

t1 = Teacher.create(name: "Sam", contact_info: "sam@ausd.com")
t2 = Teacher.create(name: "John", contact_info: "john@ausd.com")
t3 = Teacher.create(name: "Simone", contact_info: "simone@ausd.com")
t4 = Teacher.create(name: "Chris", contact_info: "chris@ausd.com")
t5 = Teacher.create(name: "Sydney", contact_info: "sydney@ausd.com")

s1 = Student.create(name: "Taylor", age: "4", contact_info: "taylor@ausd.com", check_in_status: true)
s2 = Student.create(name: "Brooks", age: "5", contact_info: "brooks@ausd.com", check_in_status: true)
s3 = Student.create(name: "Chloe", age: "6", contact_info: "chloe@ausd.com", check_in_status: false)
s4 = Student.create(name: "Coen", age: "5", contact_info: "coen@ausd.com", check_in_status: true)
s5 = Student.create(name: "Rhea", age: "7", contact_info: "rhea@ausd.com", check_in_status: false)


Classroom.create(name: "Science", student_id: s1.id, teacher_id: t2.id)
Classroom.create(name: "Art", student_id: s2.id, teacher_id: t1.id)
Classroom.create(name: "Math", student_id: s3.id, teacher_id: t3.id)
Classroom.create(name: "Language Arts", student_id: s4.id, teacher_id: t5.id)
Classroom.create(name: "Music", student_id: s5.id, teacher_id: t4.id)