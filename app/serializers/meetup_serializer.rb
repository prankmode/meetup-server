class MeetupSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_id, :event_url, :time, :group, :current_user
end
