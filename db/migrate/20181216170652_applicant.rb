class Applicant < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :company
      t.text :interest
      t.text :activities
      t.string :nationality
      t.string :location
      t.string :orgtype
      t.string :website
      t.text :aboutcompany
      t.string :position
      t.text :businessexperience
      t.text :sectorexperience
      t.string :language
      t.string :bmodel
      t.text :profile
      t.text :additional
      t.string :referrer
      t.string :status

      t.timestamps null: false
    end
  end
end
