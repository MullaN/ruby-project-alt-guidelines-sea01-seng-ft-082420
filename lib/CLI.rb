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
       choices = %w(view_attendance change_welcome_message update_rosters exit)
       menu_option = PROMPT.select("Would you like to view your class attendance, change your welcome message, or update your rosters?", choices)
       while menu_option != "exit" do
         if menu_option == "view_attendance"
            user_input = get_user_classes(teacher, "Which class would you like to view the attendance for?")
            teacher.get_attendance(user_input)
         elsif menu_option == "change_welcome_message"
            selected_class = get_user_classes(teacher, "Which class would you like to change the message for?")
            user_input = PROMPT.ask("What would you like to update the message to?")
            teacher.update_motd_by_class(selected_class, user_input)
         elsif menu_option == "update_rosters"
            selected_class = get_user_classes(teacher, "Which class roster would you like to update?")
            teacher.get_class_roster(selected_class)
            choices = %w(add_student remove_student exit)
            roster_option = PROMPT.select("What would you like to update?", choices)
            if roster_option == "add_student"
               user_input = PROMPT.ask("What is the student's name?")
               added_student = Student.find_or_create_by(name: user_input)
               teacher.add_student_to_classroom(added_student, selected_class)
               puts "#{added_student.name} has been added to #{selected_class}!"
            elsif roster_option == "remove_student"
               choices = teacher.select_classrooms_by_name(selected_class).map {|classroom| classroom.student.name}
               remove_option = PROMPT.select("Which student would you like to remove", choices)
               Classroom.find_by(name: selected_class, teacher_id: teacher.id, student_id: Student.find_by(name: remove_option).id).destroy
            end
         end
         PROMPT.ask("Press enter to continue.")
         system("clear")
         choices = %w(view_attendance change_welcome_message update_rosters exit)
         menu_option = PROMPT.select("Would you like to view your class attendance or change your welcome message?", choices)
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
      if !student
         puts "Couldn't find a student with that name. Please enter information below:"
         student_info = PROMPT.collect do
            key(:name).ask("Name:")
            key(:age).ask("Age:")
            key(:contact_info).ask("Contact Info:")
         end
         student = Student.create(name: student_info[:name], age: student_info[:age], contact_info: student_info[:contact_info])
         puts "Thank you #{student.name} for singing up!"
         choices = Classroom.all.map {|classroom| classroom.name}.uniq
         menu_option = PROMPT.select("Which class would you like to join?", choices)
         Classroom.create(teacher_id: Classroom.find_by(name: menu_option).teacher.id, student_id: student.id, name: menu_option)
      end
      system("clear")
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


 




  


   
   



   

