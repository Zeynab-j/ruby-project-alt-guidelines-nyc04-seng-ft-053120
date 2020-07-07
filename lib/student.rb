class Student < ActiveRecord::Base
    has_many :tutoring_sessions
    has_many :teachers, through: :tutoring_sessions
   
    def self.new_student
        prompt = TTY::Prompt.new
        new_student = prompt.ask("Type in your username:")
      # Check if name already exist if so then tell them if not create (find_by_create)
        new_age = prompt.ask("What is your age:")
        Student.create(name: new_student, age: new_age )
        # home_page
    end

    def self.returning
        prompt = TTY::Prompt.new
        user_name = prompt.ask("What is your name:")
         user = Student.find_by(name: user_name)
         puts "Here is your Schedule"  
         p user.tutoring_sessions
        #  home_page
     end

   

end

#A Student has many tutoring sessions
#A Student has many teachers through tutoring sessions

# student ---< tutoring_sessions >--- teacher