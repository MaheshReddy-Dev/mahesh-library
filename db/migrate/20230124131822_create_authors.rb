class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :book_id
      t.integer :experience
      t.string :gender

      t.timestamps
    end
  end
end
