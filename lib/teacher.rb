class Teacher
    has_many :students, through: :classrooms

    def add_student_to_classroom(student)
        Classroom.create(student: student, teacher: self)
    end
end