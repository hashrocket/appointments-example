class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.datetime :requested_datetime, null: false
      t.references :created_by_user, null: false, foreign_key: { to_table: :users }
      t.text :notes

      t.timestamps
    end
  end
end
