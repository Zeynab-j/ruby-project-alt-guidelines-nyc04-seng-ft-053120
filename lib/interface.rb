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

    def home_page
  
        puts " ██╗ ██╗  ██╗ ██╗      ██████╗ ██████╗ ██████╗ ███████╗    ████████╗██╗   ██╗████████╗ ██████╗ ██████╗      ██╗ ██╗  ██╗ ██╗ 
        ████████╗████████╗    ██╔════╝██╔═══██╗██╔══██╗██╔════╝    ╚══██╔══╝██║   ██║╚══██╔══╝██╔═══██╗██╔══██╗    ████████╗████████╗
        ╚██╔═██╔╝╚██╔═██╔╝    ██║     ██║   ██║██║  ██║█████╗         ██║   ██║   ██║   ██║   ██║   ██║██████╔╝    ╚██╔═██╔╝╚██╔═██╔╝
        ████████╗████████╗    ██║     ██║   ██║██║  ██║██╔══╝         ██║   ██║   ██║   ██║   ██║   ██║██╔══██╗    ████████╗████████╗
        ╚██╔═██╔╝╚██╔═██╔╝    ╚██████╗╚██████╔╝██████╔╝███████╗       ██║   ╚██████╔╝   ██║   ╚██████╔╝██║  ██║    ╚██╔═██╔╝╚██╔═██╔"
        next_page = prompt.select("########## HOME PAGE ##########", ["Add Session", "View Schedule" , "Rate Session"])
        # puts "Add Session"
        # #add_session would list the tutoring sessions that don't have students assigned
        # puts "View Schedule"
        # #go back to returning method and just show schedule
        # puts "Rate a Session"
        # #The tutoring session you belong that rating is nil and allow you update it
     end



end