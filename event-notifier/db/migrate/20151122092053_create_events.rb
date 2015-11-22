class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.string :message
      t.string :name
      t.timestamps
    end
  end
end
