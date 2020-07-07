class Interface 
 attr_accessor :prompt, :student

    def initialize
        @prompt = TTY::Prompt.new
    end

    def greeting
         puts "Welcome to CODE Tutor, your one stop shop."
       answer = prompt.select("Are you a a New Student or Returning Student?", ["New Student", "Returning Studentt"])
       if answer == "New Student"  
        Student.new_student
       else answer == "Returning Student"
        Student.returning
       end
    end


end