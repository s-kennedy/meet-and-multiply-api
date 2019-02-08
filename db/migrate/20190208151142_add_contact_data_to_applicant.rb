class AddContactDataToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :phone, :string
    add_column :applicants, :whatsapp, :boolean
  end
end
