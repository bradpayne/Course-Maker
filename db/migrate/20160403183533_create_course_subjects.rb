class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|

      t.string :subjects, index: true, foreign_key: true
      t.integer :course_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
