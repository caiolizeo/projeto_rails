class AddColumnsToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :selected, :integer
  end
end
