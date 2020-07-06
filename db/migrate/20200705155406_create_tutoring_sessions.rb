class CreateTutoringSessions < ActiveRecord::Migration[5.2]
  def change
    create_table(:tutoring_sessions) do |t|
      t.integer :teacher_id
      t.integer :student_id
      t.string :review
      t.string :time
    end
  end
end
