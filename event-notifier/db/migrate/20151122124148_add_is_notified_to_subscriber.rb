class AddIsNotifiedToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :is_notified, :boolean, default: false
  end
end
