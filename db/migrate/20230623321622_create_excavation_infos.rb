class CreateExcavationInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :excavation_infos do |t|
      t.text :type_of_work
      t.text :work_done_for
      t.datetime :project_start_date, null: false
      t.text :project_duration
      t.text :explosives
      t.text :under_ground_over_head
      t.text :horizontal_boring
      t.text :white_lined
      t.text :locate_instructions
      t.text :remarks
      t.references :digsite_infos, null: false, foreign_key: true

      t.timestamps
    end
  end
end
