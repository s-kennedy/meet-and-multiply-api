class AddFinancingToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :financing, :text
  end
end
