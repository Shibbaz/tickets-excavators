class CreateIntersections < ActiveRecord::Migration[7.0]
  def change
    create_table :intersections do |t|
      t.text :itoi_ids, array: true, default: []

      t.timestamps
    end
  end
end
