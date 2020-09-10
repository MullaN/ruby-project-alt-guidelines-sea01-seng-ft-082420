require "tty-prompt"
require 'pry'

class CommandLineInterface 
    def intro
      system("clear")
      choices = %w(student teacher)
      user_input = PROMPT.select("Welcome! Would you like to sign in as a student or teacher?", choices)
      if user_input == "teacher"
         teacher_prompt
      elsif
         user_input == "student"
         student_prompt
      end
   end
end

   def teacher_prompt
      system("clear")
      user_input = PROMPT.ask("Please enter your name")
      teacher = Teacher.find_by(name: user_input)
      if teacher 
       puts "Welcome, #{user_input}!"
       sleep 2
       teacher_welcome(teacher)
      else 
       puts "Sorry, you are not a registered teacher at this location."
   end
end
   

   def teacher_welcome(teacher)
       system("clear")
       choices = %w(view_attendance change_welcome_message)
       user_input = PROMPT.select("Would you like to view your class attendance or change your welcome message?", choices)
       if user_input == "view_attendance"
         user_input = get_user_classes(teacher, "Which class would you like to view the attendance for?")
         teacher.get_attendance(user_input)
       elsif user_input == "change_welcome_message"
         selected_class = get_user_classes(teacher, "Which class would you like to change the message for?")
         user_input = PROMPT.ask("What would you like to update the message to?")
         teacher.update_motd_by_class(selected_class, user_input)
       end
   end

   def get_user_classes(user, message)
      choices = user.classrooms.map {|classroom| classroom.name}.uniq
      PROMPT.select(message, choices)
   end    

   def student_prompt
      system("clear")
      user_input = PROMPT.ask("Please enter your name.")
      student = Student.find_by(name: user_input)
      puts "Welcome #{user_input}!"
      sleep 2
      class_name = get_user_classes(student, "Which class would you like to attend?")
      student.check_in_out(class_name)
      while user_input != "exit" do
         user_input = PROMPT.ask("Type exit to leave class:")
      end
      student.check_in_out(class_name)
   end

   def student_message
      system("clear")
      puts "Have a great day!"
   end


 




  


   
   



   

