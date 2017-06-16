# frozen_string_literal: true
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :reminder_email, :verified_reminder_email
end
