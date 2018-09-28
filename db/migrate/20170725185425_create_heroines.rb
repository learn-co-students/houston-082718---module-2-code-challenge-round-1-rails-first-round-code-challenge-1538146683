class CreateHeroines < ActiveRecord::Migration[5.0]
  def change
    create_table :heroines do |t|
      t.string :name
      t.string :super_name
      add_foreign_key :heroines, :power, foreign_key: true
      t.timestamps
    end
  end
end
