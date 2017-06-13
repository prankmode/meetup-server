class CreateMeetups < ActiveRecord::Migration[5.0]
  def change
    create_table :meetups do |t|
      t.string :name
      t.text :plain_text_description
      t.string :event_id
      t.string :short_link
      t.datetime :start_dt
      t.string :group
      t.timestamps
    end
  end
end
