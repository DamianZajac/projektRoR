class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.text :priority
      t.text :difficulty
      t.text :status
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
