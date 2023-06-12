class CreatePrimaryServiceAreaCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :primary_service_area_codes do |t|
      t.text :SACode
    end
  end
end
