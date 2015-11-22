class AddStartDateToSubEvent < ActiveRecord::Migration
  def change
    add_column :sub_events, :start_date, :datetime
  end
end
