class CreateQuizQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_questions do |t|
      t.string :label
      t.references :journey_content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
