class AddUserIdToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :user, :integer
  end
end
