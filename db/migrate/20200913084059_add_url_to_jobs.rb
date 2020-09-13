class AddUrlToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :url, :string
  end
end
