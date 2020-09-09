class Student
    has_many :teachers, through: :classrooms
end