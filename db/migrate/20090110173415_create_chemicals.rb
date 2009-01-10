class CreateChemicals < ActiveRecord::Migration
  def self.up
    create_table :chemicals do |t|
      t.string :name
      t.column :amount, :string
      t.column :quantity, :integer
      t.column :location, :string
      t.column :storage, :string
      t.column :notes, :text
      t.column :formula, :string
      t.column :cas, :string
      t.column :supplier, :string
      t.column :catalognumber, :string
      t.column :smiles, :string
      t.column :inchi, :string
      t.timestamps
    end
  end
  
  def self.down
    drop_table :chemicals
  end
end
