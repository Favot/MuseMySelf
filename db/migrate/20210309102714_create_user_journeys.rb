class CreateUserJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :user_journeys do |t|
      t.boolean :completed
      t.references :user, null: false, foreign_key: true
      t.references :journey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
