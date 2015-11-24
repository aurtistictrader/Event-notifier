class Event < ActiveRecord::Base
  has_many :sub_events
end
