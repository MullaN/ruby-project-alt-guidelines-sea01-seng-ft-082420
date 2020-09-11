class Teacher < ActiveRecord::Base
    has_many :classrooms
    has_many :students, through: :classrooms

    def add_student_to_classroom(student, class_name)

        Classroom.create(student_id: student.id, teacher_id: self.id, name: class_name)
    end

    def get_attendance(class_name)
        correct_classes = select_classrooms_by_name(class_name)
        if correct_classes.length > 0
            puts "#{class_name} attendance:"
            correct_classes.each {|classroom| puts "#{classroom.student.name} - " + (classroom.check_in_status ? "here" : "absent") }
        else
            puts "#{class_name} has no students."
        end
    end

    def update_motd_by_class(class_name, new_motd)
        selected_classrooms = select_classrooms_by_name(class_name)
        if selected_classrooms.length > 0
            selected_classrooms.each {|classroom| classroom.update(motd: new_motd)}
            puts "Updated #{class_name}'s motd to \"#{new_motd}\"."
        else
            puts "Could not find #{class_name} in your classes."
        end
    end

    def select_classrooms_by_name(class_name)
        Classroom.all.select {|classroom| classroom.name == class_name && classroom.teacher == self}
    end

    def get_class_roster(class_name)
        correct_classes = select_classrooms_by_name(class_name)
        if correct_classes.length > 0
            puts "Current Roster:"
            correct_classes.each {|classroom| puts "#{classroom.student.name}"}
        else
            puts "#{class_name} has no students."
        end
    end
end