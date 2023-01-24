class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.integer :location_id
      t.integer :company_id
      t.integer :book_id

      t.timestamps
    end
  end
end
