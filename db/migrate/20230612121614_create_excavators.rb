class CreateExcavators < ActiveRecord::Migration[7.0]
  def change
    create_table :excavators do |t|
      t.text :company_name
      t.text :address
      t.boolean :crew_on_site
    end
  end
end
