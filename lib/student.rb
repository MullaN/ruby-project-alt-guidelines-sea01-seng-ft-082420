class Student < ActiveRecord::Base
    has_many :classrooms
    has_many :teachers, through: :classrooms

    def check_in(class_name)
        found_class =  self.classrooms.find {|classroom| classroom.name == class_room}
        if found_class
            self.update(check_in_status: true)
            puts "Checked in to #{class_name}"
        else
            puts "Could not find #{class_name} in your classes."
        end
    end
end