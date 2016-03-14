class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :comment
      t.string :term
      t.string :code
      t.string :subjects
      t.integer :continuity_id
      t.string :name
      t.string :description
      t.integer :credits
      t.boolean :indepedent_study

      t.timestamps null: false
    end
  end
end