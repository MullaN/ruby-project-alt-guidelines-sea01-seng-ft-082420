class Teacher < ActiveRecord::Base
    has_many :classrooms
    has_many :students, through: :classrooms

    def add_student_to_classroom(student, class_name)
        Classroom.create(student_id: student.id, teacher_id: self.id, name: class_name)
    end

    def get_attendance(class_name)
        
    end
end