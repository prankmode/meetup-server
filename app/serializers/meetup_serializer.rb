class MeetupSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_id, :event_url, :time, :current_user
end
