class AddPartnerFieldsToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :partner_bmodel, :string
    add_column :applicants, :support_region, :string
    add_column :applicants, :partner_sector, :string
    add_column :applicants, :support_type, :string
    add_column :applicants, :additonal_support, :text
  end
end
