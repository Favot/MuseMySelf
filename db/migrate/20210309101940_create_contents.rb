class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :author
      t.integer :date
      t.string :category
      t.integer :duration
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
