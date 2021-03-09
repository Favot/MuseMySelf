class CreateUserJourneyContents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_journey_contents do |t|
      t.integer :rating
      t.text :review
      t.boolean :completed
      t.integer :position
      t.references :content, null: false, foreign_key: true
      t.references :user_journey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
