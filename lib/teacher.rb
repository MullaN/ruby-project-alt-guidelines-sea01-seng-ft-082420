class Teacher < ActiveRecord::Base
    has_many :classrooms
    has_many :students, through: :classrooms

    def add_student_to_classroom(student, class_name)
        Classroom.create(student_id: student.id, teacher_id: self.id, name: class_name)
    end

    def get_attendance(class_name)
        correct_classes = self.classrooms.select {|classroom| classroom.name == class_name}
        if correct_classes.length > 0
            puts "#{class_name} attendance:"
            correct_classes.each {|classroom| puts "#{classroom.student.name} - " + (classroom.student.check_in_status ? "here" : "absent") }
        else
            puts "#{class_name} has no students."
        end
    end
end