class Teacher < ActiveRecord::Base
    has_many :tutoringsessions
    has_many :students, through: :tutoringsession
end