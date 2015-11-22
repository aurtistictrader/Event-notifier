class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.belongs_to :sub_events
      t.string :phone_number
      t.timestamps
    end
  end
end
