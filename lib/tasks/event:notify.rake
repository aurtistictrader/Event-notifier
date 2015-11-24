require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

namespace :event do
  desc "Rake task to get events data"
  task :notify => :environment do
    puts "NOTIFYING SUBS"
    notify_time = 15.minutes.since.to_time
    notify_time_str = notify_time.to_s[0, notify_time.to_s.length - 5]
    overdue_events = SubEvent.where("start_date < ? ", notify_time_str)

    event_ids = []
    overdue_events.each do |event|
      event_ids.push(event.id)
    end

    # preconfigure the client like so
    Twilio.configure do |config|
      config.account_sid = ENV['ACCOUNT_SID']
      config.auth_token = ENV['AUTH_TOKEN']
    end

    # and then you can create a new client without parameters
    @client = Twilio::REST::Client.new

    overdue_events.each do |event|
      subscribers = Subscriber.where("is_notified = false AND sub_events_id = ?", event.id)

      # Twilio messages sent here
      subscribers.each do |sub|
        @client.messages.create(
            from: '+13124719231' ,
            to: '+1'+ sub.phone_number.to_s,
            body: 'Get ready for "' + event.name + '"! This is a friendly reminder from EventNotifier! :D'
        )
      end
    end

    # notify them here
    # puts "RUNNING"

    # Update database to notified = true
    subscribers = Subscriber.where("is_notified = false AND sub_events_id IN (?)", event_ids)
    subscribers.update_all(is_notified: true)
  end
end