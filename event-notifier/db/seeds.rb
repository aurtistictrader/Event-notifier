# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "cleaning database"

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # PostgreSQL
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

puts "Finished clearing database"

puts "Creating first event"

event = Event.new({
                      :name => "Wildhacks Hackathon!",
                      start_time: DateTime.new(2015, 11, 22, 07, 0, 0)
                  })

event.sub_events = SubEvent.create ([
                                       {
                                           name: "Sponsor Check-In and Setup",
                                           start_date: DateTime.new(2015, 11, 22, 07, 0, 0)
                                       },
                                       {
                                           name: "Breakfast: Einstein's Bagels - Sponsored by Tanvas",
                                           start_date: DateTime.new(2015, 11, 22, 07, 30, 0)
                                       },
                                       {
                                           name: "Participant Check-In",
                                           start_date: DateTime.new(2015, 11, 22, 8, 30, 0)
                                       },
                                       {
                                           name: "Opening Ceremony",
                                           start_date: DateTime.new(2015, 11, 22, 10, 30, 0)
                                       },
                                       {
                                           name: "Hacking Begins",
                                           start_date: DateTime.new(2015, 11, 22, 11, 30, 0)
                                       },
                                       {
                                           name: "Lunch: Chipotle - Sponsored by IMC Financial",
                                           start_date: DateTime.new(2015, 11, 22, 12, 30, 0)
                                       },
                                       {
                                           name: "Microsoft Tech Talk - Building Your First Node.js App and Publishing to Azure",
                                           start_date: DateTime.new(2015, 11, 22, 14, 0, 0)
                                       },
                                       {
                                           name: "HP Tech Talk - Harnessing the Power of Unstructured Data using Haven OnDemand",
                                           start_date: DateTime.new(2015, 11, 22, 14, 45, 0)
                                       },
                                       {
                                           name: "IBM Tech Talk - Introduction to Bluemix",
                                           start_date: DateTime.new(2015, 11, 22, 15, 30, 0)
                                       },
                                       {
                                           name: "Afternoon Snack: Portillos - Sponsored by IBM",
                                           start_date: DateTime.new(2015, 11, 22, 16, 0, 0)
                                       },
                                       {
                                           name: "PayPal/Braintree Tech Talk - Introduction to Braintree",
                                           start_date: DateTime.new(2015, 11, 22, 16, 45, 0)
                                       },
                                       {
                                           name: "Dinner",
                                           start_date: DateTime.new(2015, 11, 22, 19, 0, 0)
                                       },
                                       {
                                           name: "Game Room - Sponsored by Trustwave",
                                           start_date: DateTime.new(2015, 11, 22, 19, 0, 0)
                                       },
                                       {
                                           name: "Insomnia Cookies and Hot Drink Bar - Sponsored by PayPal/Braintree",
                                           start_date: DateTime.new(2015, 11, 22, 21, 30, 0)
                                       },
                                       {
                                           name: "Midnight Snack: Andy's Frozen Custard - Sponsored by Groupon",
                                           start_date: DateTime.new(2015, 11, 22, 23, 30, 0)
                                       },
                                       {
                                           name: "Breakfast",
                                           start_date: DateTime.new(2015, 11, 23, 8, 0, 0)
                                       },
                                       {
                                           name: "Hacking Ends",
                                           start_date: DateTime.new(2015, 11, 23, 11, 30, 0)
                                       },
                                       {
                                           name: "Lunch",
                                           start_date: DateTime.new(2015, 11, 23, 11, 30, 0)
                                       },
                                       {
                                           name: "Science Fair/Expo Judging",
                                           start_date: DateTime.new(2015, 11, 23, 13, 0, 0)
                                       },
                                       {
                                           name: "Final Judging and Closing Ceremony",
                                           start_date: DateTime.new(2015, 11, 23, 14, 30, 0)
                                       },
                                       {
                                           name: "Buses Leave",
                                           start_date: DateTime.new(2015, 11, 23, 17, 0, 0)
                                       }
                                   ])

event.save!

puts "Finished creating first even"

# create_table "sub_events", force: true do |t|
#   t.integer  "event_id"
#   t.string   "name"
#   t.string   "message"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# create_table "subscribers", force: true do |t|
#   t.integer  "sub_events_id"
#   t.string   "phone_number"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
