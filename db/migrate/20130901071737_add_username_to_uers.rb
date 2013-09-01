class AddUsernameToUers < ActiveRecord::Migration
  def change
    add_column :uers, :username, :string
  end
end
