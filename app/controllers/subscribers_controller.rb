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
      inserts.push "('#{sub}', '#{phone_number}', '#{Time.now.to_s}', '#{Time.now.to_s}')"
    end
    sql = "INSERT INTO subscribers (sub_events_id, phone_number, created_at, updated_at) VALUES #{inserts.join(", ")}"

    results = ActiveRecord::Base.connection.execute(sql)

    if results.present?
      redirect_to :root
    else
      redirect_to :back
    end

  end
end
