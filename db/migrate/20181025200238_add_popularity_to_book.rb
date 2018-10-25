class AddPopularityToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :popularity, :integer, null: false, default: 0
  end
end
