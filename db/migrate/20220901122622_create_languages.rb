class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|

      t.string :language, null: false
      t.integer :level, null: false, default: 0

      t.references :resume, null: false

      t.timestamps
    end
  end
end
