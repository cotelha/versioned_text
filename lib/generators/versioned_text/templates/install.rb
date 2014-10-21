class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :version_texts, :force => true do |t|
      t.column :versionable_id, :integer
      t.column :versionable_type, :string
      t.column :user_id, :integer
      t.column :text, :text

      t.timestamps
    end
  end

  def self.down
    drop_table :version_texts
  end
end