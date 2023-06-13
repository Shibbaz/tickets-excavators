class CreateAdressInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :adress_infos do |t|
      t.text :state
      t.text :county
      t.text :place
      t.text :zip
      t.references :adress_digsite, null: false, foreign_key: true
      t.references :street_digsite, null: false, foreign_key: true
    end
  end
end
