class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    add_column :version_texts, :relation_type,  :integer
    add_column :version_text_versions, :relation_type, :integer
  end

  def self.down
    remove_column :version_texts, :relation_type
    remove_column :version_text_versions, :relation_type
  end
end
