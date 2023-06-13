class CreateStreetDigsites < ActiveRecord::Migration[7.0]
  def change
    create_table :street_digsites do |t|
      t.text :prefix
      t.text :name
      t.text :dig_type
      t.text :suffix
    end
  end
end
