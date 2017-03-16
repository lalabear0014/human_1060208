class AddIdnumberToEvents < ActiveRecord::Migration[5.0]
  def change

  	add_column :events, :idnumber, :string
  	add_column :events, :station, :string
  	add_column :events, :education, :string
  	add_column :events, :experience, :string
  	add_column :events, :process, :string
  	add_column :events, :assess, :string
  	add_column :events, :use, :string
  	add_column :events, :effect, :string

  end
end
