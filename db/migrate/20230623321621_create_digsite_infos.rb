class CreateDigsiteInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :digsite_infos do |t|
      t.text :look_up_by
      t.text :location_type
      t.text :subdivision
      t.references :adress_info, null: false, foreign_key: true
      t.references :near_streets, null: false, foreign_key: true
      t.references :intersections, null: false, foreign_key: true
      t.st_polygon :polygon
    end
  end
end
