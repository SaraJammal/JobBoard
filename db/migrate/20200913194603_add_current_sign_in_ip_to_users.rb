class AddCurrentSignInIpToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_sign_in_ip, :integer
  end
end
