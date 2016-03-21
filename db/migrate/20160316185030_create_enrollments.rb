class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :course_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
