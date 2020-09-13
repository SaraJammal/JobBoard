class AddCompanyIdToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :company_id, :integer
  end
end
