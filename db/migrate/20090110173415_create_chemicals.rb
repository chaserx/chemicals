class CreateChemicals < ActiveRecord::Migration
  def self.up
    create_table :chemicals do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :chemicals
  end
end
