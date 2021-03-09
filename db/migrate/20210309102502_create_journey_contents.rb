class CreateJourneyContents < ActiveRecord::Migration[6.0]
  def change
    create_table :journey_contents do |t|
      t.integer :position
      t.references :content, null: false, foreign_key: true
      t.references :journey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
