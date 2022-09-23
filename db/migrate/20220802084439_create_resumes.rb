class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text :discription, null: false
      t.string :serial_number
      t.string :phone, null: false
      t.string :adress, null: false
      t.string :email, null: false
      t.string :designation, null: false
      t.string :skills , array: true, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
