class Interface 
 attr_accessor :prompt, :student

    def initialize
        @prompt = TTY::Prompt.new
    end

    def greeting
        puts "██╗ ██╗  ██╗ ██╗      ██████╗ ██████╗ ██████╗ ███████╗    ████████╗██╗   ██╗████████╗ ██████╗ ██████╗      ██╗ ██╗  ██╗ ██╗ 
        #         ████████╗████████╗    ██╔════╝██╔═══██╗██╔══██╗██╔════╝    ╚══██╔══╝██║   ██║╚══██╔══╝██╔═══██╗██╔══██╗    ████████╗████████╗
        #         ╚██╔═██╔╝╚██╔═██╔╝    ██║     ██║   ██║██║  ██║█████╗         ██║   ██║   ██║   ██║   ██║   ██║██████╔╝    ╚██╔═██╔╝╚██╔═██╔╝
        #         ████████╗████████╗    ██║     ██║   ██║██║  ██║██╔══╝         ██║   ██║   ██║   ██║   ██║   ██║██╔══██╗    ████████╗████████╗
        #         ╚██╔═██╔╝╚██╔═██╔╝    ╚██████╗╚██████╔╝██████╔╝███████╗       ██║   ╚██████╔╝   ██║   ╚██████╔╝██║  ██║    ╚██╔═██╔╝╚██╔═██╔"
         puts "Welcome to CODE Tutor, your one stop shop."
       answer = prompt.select("Are you a a New Student or Returning Student?", ["New Student", "Returning Student"])
       if answer == "New Student"  
        Student.new_student
       else answer == "Returning Student"
        Student.returning
       end
    end
end
