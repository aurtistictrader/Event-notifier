require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

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

    # put your own credentials here
    account_sid = 'ACa9ba8e6758de9fdb7d334bc1c5073b64'
    auth_token = 'ff79cde33a76150c4c3f20e6f7438d20'

    # alternatively, you can preconfigure the client like so
    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
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