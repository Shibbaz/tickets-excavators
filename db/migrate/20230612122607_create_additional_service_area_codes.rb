class CreateAdditionalServiceAreaCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :additional_service_area_codes, id: :uuid do |t|
      t.text :sa_code, array: true, default: []
    end
  end
end
