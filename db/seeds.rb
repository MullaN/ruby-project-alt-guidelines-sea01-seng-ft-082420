Teacher.destroy_all
Student.destroy_all
Classroom.destroy_all

Teacher.create(name: "Sam", contact_info: "sam@ausd.com")
Teacher.create(name: "John", contact_info: "john@ausd.com")

Student.create(name: "Taylor", age: "4", contact_info: "taylor@ausd.com", check_in_status: true)
Student.create(name: "Brooks", age: "5", contact_info: "brooks@ausd.com", check_in_status: true)


Classroom.create(name: "Science")
Classroom.create(name: "Art")