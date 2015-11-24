class CreateSubEvents < ActiveRecord::Migration
  def change
    create_table :sub_events do |t|
      t.belongs_to :event
      t.string :name
      t.timestamps
    end
  end
end
