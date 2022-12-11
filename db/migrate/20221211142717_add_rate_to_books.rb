class AddRateToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :rate, :string
  end
end
