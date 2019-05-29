class AddAddressDob < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :address, :string
      add_column :users, :dateofbirth, :date
  end
end
