class SubscribersController < ApplicationController
  def create_subs
    subscriber_ids = []

    all_sub_events = params[:subscribers]

    all_sub_events.each do |index, value|
      if value == '1'
        subscriber_ids.push(index)
      end
    end

    phone_number = all_sub_events[:phone_number]

    inserts = []
    subscriber_ids.each do |sub|
      inserts.push "(#{sub}, #{phone_number})"
    end
    sql = "INSERT INTO subscribers (sub_events_id, phone_number) VALUES #{inserts.join(", ")}"

    results = ActiveRecord::Base.connection.execute(sql)

    if results.present?
      results
    else
      nil
    end

  end
end
