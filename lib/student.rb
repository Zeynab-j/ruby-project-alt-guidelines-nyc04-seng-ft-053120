class Student < ActiveRecord::Base
    has_many :tutoring_sessions
    has_many :teachers, through: :tutoring_sessions
end

#A Student has many tutoring sessions
#A Student has many teachers through tutoring sessions

# student ---< tutoring_sessions >--- teacher