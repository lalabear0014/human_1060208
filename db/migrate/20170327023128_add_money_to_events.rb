class AddMoneyToEvents < ActiveRecord::Migration[5.0]
  def change

  	add_column :events, :money, :string
  	add_column :events, :data_validation, :boolean

  end
end
