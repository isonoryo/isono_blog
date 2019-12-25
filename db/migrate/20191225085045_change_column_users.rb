class ChangeColumnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :password_digest, :integer
  end
end
