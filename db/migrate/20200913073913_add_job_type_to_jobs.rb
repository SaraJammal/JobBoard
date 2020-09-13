class AddJobTypeToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :Job_Type, :string
  end
end
