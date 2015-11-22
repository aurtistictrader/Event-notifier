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
                    :name				 	=> "Wildhacks Hackathon!",
                    start_time: DateTime.new(2015, 11, 22, 07, 0, 0)
                })

event.sub_events = SubEvent.create ({
                                                  :name => "Sponsor Check-In and Setup",
                                                  start_time: DateTime.new(2015, 11, 22, 07, 0, 0)
                                              })

event.recruiter_profile.company_profile = CompanyProfile.new({
                                                                :company_description => "Test Company"
                                                            })

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
