class AddReminderEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reminder_email, :string
    add_column :users, :verified_reminder_email, :boolean
  end
end
