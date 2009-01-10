class AddAttachmentsMsdsToChemical < ActiveRecord::Migration
  def self.up
    add_column :chemicals, :msds_file_name, :string
    add_column :chemicals, :msds_content_type, :string
    add_column :chemicals, :msds_file_size, :integer
    add_column :chemicals, :msds_updated_at, :datetime
  end

  def self.down
    remove_column :chemicals, :msds_file_name
    remove_column :chemicals, :msds_content_type
    remove_column :chemicals, :msds_file_size
    remove_column :chemicals, :msds_updated_at
  end
end
