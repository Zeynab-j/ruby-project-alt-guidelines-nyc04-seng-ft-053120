class Student < ActiveRecord::Base
    has_many :tutoring_sessions
    has_many :teachers, through: :tutoring_sessions
   
    def self.new_student
        prompt = TTY::Prompt.new
          new_student = prompt.ask("Create a new username:")
          value = Student.all.any? {|user| user.name == new_student}
          if value == true 
            puts "Sorry that username already exist"
            Interface.new.greeting
          end
          new_age = prompt.ask("What is your age:")
         user = Student.create(name: new_student, age: new_age )
        user.home_page
    end

    def self.returning
        prompt = TTY::Prompt.new
          user_name = prompt.ask("What is your name:")
           user = Student.find_by(name: user_name)
             if user == nil
              puts "Sorry that user name doesn't exist"
              new_student
            end
        user.home_page
     end

    def home_page
      prompt = TTY::Prompt.new
        puts "#### Home Page ####"
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
      if schedule == true
         prompt = TTY::Prompt.new
        selection = prompt.select("######SCHEDULE#####", schedule.map {|s| "#{s.teacher.name} - #{s.teacher.subject} at #{s.time}"})
      else
        puts "You currently dont have and Tutoring Session Scheduled."
      end
      self.home_page
    end

    def rate_session
      not_rated_sessions = TutoringSession.where(student_id: self.id)
      if not_rated_sessions == true
          prompt = TTY::Prompt.new
          selection = prompt.select("Select the tutoring session you want to rate:", 
             not_rated_sessions.map {|s| p "#{s.id} :#{s.teacher.name} - #{s.teacher.subject} at #{s.time}"})
              input = prompt.select("Your opinion is important to us, please select a number to rate this session?",
              ["1",
               "2",
               "3",
               "4",
               "5",])
              session = not_rated_sessions.find_by(id: selection.split.first)
            session.update(rating: input)
      else
          puts "No sessions yet for you."
      end
      home_page
  end
   

end



#A Student has many tutoring sessions
#A Student has many teachers through tutoring sessions

# student ---< tutoring_sessions >--- teacher