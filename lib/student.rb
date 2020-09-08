class Student < ActiveRecord::Base
    has_many :teachers, through: :classrooms
end