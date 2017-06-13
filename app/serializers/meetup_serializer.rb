class MeetupSerializer < ActiveModel::Serializer
  attributes :id, :name, :plain_text_description, :event_id, :short_link
end
