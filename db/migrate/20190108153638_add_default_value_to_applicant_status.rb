class AddDefaultValueToApplicantStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :applicants, :status, :string, default: "Pending"
  end
end
