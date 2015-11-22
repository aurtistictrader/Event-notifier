class SubEvent < ActiveRecord::Base
  belongs_to :event
  has_many :subscribers
end
