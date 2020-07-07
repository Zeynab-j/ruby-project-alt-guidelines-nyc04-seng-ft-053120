class AddRatingAndDatetimeToTutoringsessions < ActiveRecord::Migration[5.2]
  def change
    add_column :tutoring_sessions, :rating, :integer
    change_column :tutoring_sessions, :time, :datetime
  end
end
