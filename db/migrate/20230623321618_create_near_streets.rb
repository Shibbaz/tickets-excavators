class CreateNearStreets < ActiveRecord::Migration[7.0]
  def change
    create_table :near_streets do |t|
      t.text :state
      t.text :county
      t.text :place
      t.text :prefix
      t.text :name
      t.text :dig_type
      t.text :suffix

      t.timestamps
    end
  end
end