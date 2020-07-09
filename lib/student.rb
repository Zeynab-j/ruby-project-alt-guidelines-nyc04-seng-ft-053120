class Student < ActiveRecord::Base
    has_many :tutoring_sessions
    has_many :teachers, through: :tutoring_sessions
   
    def self.new_student
        prompt = TTY::Prompt.new
          new_student = prompt.ask("Type in your username:")
      # Check if name already exist if so then tell them if not create (find_by_create)
          new_age = prompt.ask("What is your age:")
         user = Student.create(name: new_student, age: new_age )
        user.home_page
    end

    def self.returning
        prompt = TTY::Prompt.new
          user_name = prompt.ask("What is your name:")
           user = Student.find_by(name: user_name)
         puts "Here is your Schedule"  
         p user.tutoring_sessions
        user.home_page
     end

    def home_page
      prompt = TTY::Prompt.new
        puts " ██╗ ██╗  ██╗ ██╗      ██████╗ ██████╗ ██████╗ ███████╗    ████████╗██╗   ██╗████████╗ ██████╗ ██████╗      ██╗ ██╗  ██╗ ██╗ 
        #         ████████╗████████╗    ██╔════╝██╔═══██╗██╔══██╗██╔════╝    ╚══██╔══╝██║   ██║╚══██╔══╝██╔═══██╗██╔══██╗    ████████╗████████╗
        #         ╚██╔═██╔╝╚██╔═██╔╝    ██║     ██║   ██║██║  ██║█████╗         ██║   ██║   ██║   ██║   ██║   ██║██████╔╝    ╚██╔═██╔╝╚██╔═██╔╝
        #         ████████╗████████╗    ██║     ██║   ██║██║  ██║██╔══╝         ██║   ██║   ██║   ██║   ██║   ██║██╔══██╗    ████████╗████████╗
        #         ╚██╔═██╔╝╚██╔═██╔╝    ╚██████╗╚██████╔╝██████╔╝███████╗       ██║   ╚██████╔╝   ██║   ╚██████╔╝██║  ██║    ╚██╔═██╔╝╚██╔═██╔"
        puts "########## HOME PAGE ##########"
        option = prompt.select("Welcome to CODE Tutor, your one stop shop. What would you like to do today?",
          ["Add Session",
          "View Schedule",
          "Rate a Session",
          "Exit"])
         case option
            when "Add Session"
              self.add_session
            when "View Schedule"
              self.view_schedule
            when "Rate a Session"
              self.rate_session
            when "Exit"
              Interface.new.greeting
          end
    end

    def schedule

    end

    def add_session
      value = TutoringSession.where(student_id: nil)
      prompt = TTY::Prompt.new
        selection = prompt.select('Please choose from availability:',  
          value.map {|s| "#{s.teacher.name} - #{s.teacher.subject} at #{s.time}, #{s.id} "})
          new_session = selection.split.last
          self.tutoring_sessions << TutoringSession.where(id: new_session)
          self.home_page
    end

    def view_schedule
      schedule = TutoringSession.where(student_id: self)
      prompt = TTY::Prompt.new
      selection = prompt.select("######SCHEDULE#####", schedule.map {|s| "#{s.teacher.name} - #{s.teacher.subject} at #{s.time}"})
      if selection == false
        "You currently dont have and Tutoring Session Scheduled"
      end
      self.home_page
    end

    def rate_session
      rating = TutoringSession.where(student_id: self)
      #The tutoring session you belong that rating is nil and allow you update it
      self.home_page
    end
   

end



#A Student has many tutoring sessions
#A Student has many teachers through tutoring sessions

# student ---< tutoring_sessions >--- teacher