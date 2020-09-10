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
       teacher_welcome
      else 
       puts "Sorry, you are not a registered teacher at this location."
   end
end
   

   # def teacher_welcome
   #     system("clear")
   #     choices = %w(view_attendance change_welcome_message)
   #     user_input = PROMPT.select("Would you like to view your class attendance or change your welcome message?", choices)
   #     if user_input == "view_attendance"
   #       class_attendance
   #     elsif user_input == "change_welcome_message"
   #       change_welcome_message
   #     end
   # end
    

   def student_prompt
      system("clear")
      user_input = PROMPT.ask("Please enter your name.")
      puts "Welcome #{user_input}!"
   end

   
   



   

