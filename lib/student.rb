class Student < ActiveRecord::Base
    has_many :classrooms
    has_many :teachers, through: :classrooms

    def check_in_out(class_name)
        found_class =  self.classrooms.find {|classroom| classroom.name == class_name}
        if found_class
            self.update(check_in_status: !self.check_in_status)
            puts "Checked " + (self.check_in_status ? "in to" : "out of") + " #{class_name}"
            if found_class.motd && self.check_in_status
                puts "Welcome, #{self.name}! #{found_class.teacher.name} will be your teacher. Today's message of the day is:"
                puts found_class.motd
            end
        else
            puts "Could not find #{class_name} in your classes."
        end
    end
end