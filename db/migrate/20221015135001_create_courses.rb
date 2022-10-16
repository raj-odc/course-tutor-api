class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :courses, :name, unique: true
  end
end
