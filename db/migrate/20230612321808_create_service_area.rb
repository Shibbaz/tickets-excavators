class CreateServiceArea < ActiveRecord::Migration[7.0]
  def change
    create_table :service_areas do |t|
      t.text :requestNumber
      t.references :primary_service_area_codes, foreign_key: true
      t.references :additional_service_area_codes, foreign_key: true
    end
  end
end
