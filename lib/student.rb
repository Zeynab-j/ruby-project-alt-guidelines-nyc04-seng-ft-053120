class Student < ActiveRecord::Base
    has_many :tutoringsessions
    has_many :teachers, through: :tutoringsessions
end

#A Student has many tutoring sessions
#A Student has many teachers through tutoring sessions