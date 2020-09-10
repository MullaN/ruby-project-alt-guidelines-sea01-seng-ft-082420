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
      puts "Welcome, would you like to view your class attendance or change your welcome message?"
   end
   

   # def teacher_welcome
   #    system("clear")
   #    choices = %w(view_attendance change_welcome_message)
   #    user_input = PROMPT.select("Would you like to view your class attendance or change your welcome message?")
   # end

   def student_prompt
      system("clear")
      user_input = PROMPT.ask("Please enter your name and the class you will be attending.")
      puts "Welcome, your teacher will be and your assigment for the day is"
   end

   
   



   

