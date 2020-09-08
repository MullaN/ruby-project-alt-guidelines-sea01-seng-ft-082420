class Teacher
    has_many :students, through: :classrooms
end