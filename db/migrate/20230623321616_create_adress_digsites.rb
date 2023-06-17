class CreateAdressDigsites < ActiveRecord::Migration[7.0]
  def change
    create_table :adress_digsites, id: :uuid do |t|
      t.text :adress_num, array: true, default: []
    end
  end
end
