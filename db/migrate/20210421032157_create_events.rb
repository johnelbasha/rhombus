class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :confirmation_message
      t.string :creation_button_text
      t.string :creation_button_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
