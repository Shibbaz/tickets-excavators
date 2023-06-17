class CreatePrimaryServiceAreaCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :primary_service_area_codes, id: :uuid do |t|
      t.text :sa_code
    end
  end
end
