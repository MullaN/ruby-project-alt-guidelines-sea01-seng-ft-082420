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
         user_input = get_user_classes(teacher)
         teacher.get_attendance(user_input)
       elsif user_input == "change_welcome_message"
         selected_class = get_user_classes(teacher)
         user_input = PROMPT.ask("What would you like to update the message to?")
         teacher.update_motd_by_class(selected_class, user_input)
       end
   end

   def get_user_classes(user)
      choices = user.classrooms.map {|classroom| classroom.name}.uniq
      PROMPT.select("For which class?", choices)
   end

   def change_welcome_message
      puts "Please update your welcome message:"
   end
    

   def student_prompt
      system("clear")
      user_input = PROMPT.ask("Please enter your name.")
      puts "Welcome #{user_input}!"
      sleep 2
      choices = %w(science art math language arts music)
      user_input = PROMPT.multi_select("Please select the class you will be attending?", choices)
   end



  


   
   



   

