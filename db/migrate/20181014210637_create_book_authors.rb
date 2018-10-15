class CreateBookAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :book_authors do |t|
      t.references :book, null: false, index: true
      t.references :author, null: false, index: true

      t.timestamps
    end
  end
end
