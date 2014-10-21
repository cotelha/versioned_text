class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    VersionedText::VersionText.create_versioned_table
  end

  def self.down
    VersionedText::VersionText.drop_versioned_table
  end
end