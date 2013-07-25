class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
