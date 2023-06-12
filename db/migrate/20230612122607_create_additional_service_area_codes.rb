class CreateAdditionalServiceAreaCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :additional_service_area_codes do |t|
      t.text :SACode, array: true, default: []
    end
  end
end
