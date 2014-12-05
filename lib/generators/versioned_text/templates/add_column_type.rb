class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    add_column :version_texts, :type,  :integer
  end

  def self.down
    remove_column :version_texts, :type
  end
end
