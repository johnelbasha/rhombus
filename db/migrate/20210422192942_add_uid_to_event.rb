class AddUidToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :uid, :string
  end
end
