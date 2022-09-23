class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|

      t.string :title, null: false
      t.date :sart_date, null: false
      t.date :end_date, null: false
      t.string :skills, array: true, null: false

      t.references :resume, null: false

      t.timestamps
    end
  end
end
