class AddUserIdToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :user_id, :integer
  end
end
