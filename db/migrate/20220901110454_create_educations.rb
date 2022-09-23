class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|

      t.string :degree, null: false
      t.string :institute, null: false
      t.date :sart_date, null: false
      t.date :end_date, null: false
      t.string :major_subjects, array: true, null: false

      t.references :resume, null: false

      t.timestamps
    end
  end
end
