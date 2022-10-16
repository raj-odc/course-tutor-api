class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :name, null: false
      t.string :email
      t.boolean :active, default: true
      t.references :course

      t.timestamps
    end
    add_index :tutors, :name
    add_index :tutors, :email, unique: true
  end
end
