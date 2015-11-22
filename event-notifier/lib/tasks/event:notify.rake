namespace :event do
  desc "Rake task to get events data"
  task :notify => :environment do
    puts "NOTIFYING SUBS"
    notify_time = 15.minutes.ago.to_s

    overdue_events = SubEvent.where("start_date < ? ", notify_time)

    event_ids = []
    overdue_events.each do |event|
      event_ids.push(event.id)
    end

    subscribers = Subscriber.where("is_notified = false AND sub_events_id IN (?)", event_ids)

    # notify them here
    puts "RUNNING"

    
  end
end