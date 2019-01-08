class AddRoleToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :role, :string
  end
end
