class CreateIntersections < ActiveRecord::Migration[7.0]
  def change
    create_table :intersections, id: :uuid do |t|
      t.uuid :itoi_ids, array: true, default: []

      t.timestamps
    end
  end
end
