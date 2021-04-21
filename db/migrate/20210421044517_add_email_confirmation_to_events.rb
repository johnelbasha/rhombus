class AddEmailConfirmationToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :email_confirmation, :string
  end
end
