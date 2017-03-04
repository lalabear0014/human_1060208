class AddColumnToEvents < ActiveRecord::Migration[5.0]
  def change

  	add_column :events, :email, :string
  	add_column :events, :phone, :string
  	add_column :events, :address, :string

  end
end
