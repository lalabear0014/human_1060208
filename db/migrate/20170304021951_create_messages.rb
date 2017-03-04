class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|

    	t.string :content
    	t.integer :event_id

    	t.timestamps
    end

    add_index :messages, :event_id

  end
end
