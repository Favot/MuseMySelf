class CreateJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :journeys do |t|
      t.string :name
      t.string :summary
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
