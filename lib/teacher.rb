class Teacher < ActiveRecord::Base
    has_many :tutoring_sessions
    has_many :students, through: :tutoring_sessions
end