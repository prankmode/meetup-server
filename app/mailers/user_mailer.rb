# frozen_string_literal: true
class UserMailer < ApplicationMailer
  default from: 'erica.dorenkamp@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://prankmode.github.io/meetup-client'
    mail(to: @user.email, subject: 'hello from the other site')
  end

  def reminder_email(user, meetups)
    @user = user
    @meetups = meetups
    @url = 'https://prankmode.github.io/meetup-client'
    mail(to: @user.email, subject: 'Your peek reminders')
  end
end
