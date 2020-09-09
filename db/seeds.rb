Teacher.destroy_all
Student.destroy_all
Classroom.destroy_all

t1 = Teacher.create("Sam", "sam@ausd.com")
t2 = Teacher.create("John", "john@ausd.com")

s1 = Student.create("Taylor", "4", "taylor@ausd.com" true)
s2 = Student.create("Brooks", "5", "brooks@ausd.com" true)


c1 = Classroom.create("Science", s1, t2)
c3 = Classroom.create("Art", s2. t1)