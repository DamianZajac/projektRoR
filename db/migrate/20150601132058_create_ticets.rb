class CreateTicets < ActiveRecord::Migration
  def change
    create_table :ticets do |t|
      t.string :name_ticet
      t.text :text_ticet
      t.text :piority
      t.text :difficulty
      t.text :status
      t.references :projects, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
