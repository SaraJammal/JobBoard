class AddJobIdToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :job_id, :integer
  end
end
