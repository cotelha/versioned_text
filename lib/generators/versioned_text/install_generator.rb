require 'rails/generators'
require 'rails/generators/migration'
require 'active_record'
require 'rails/generators/active_record'

module VersionedText
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)

      # Implement the required interface for Rails::Generators::Migration.
      def self.next_migration_number(dirname) #:nodoc:
        next_migration_number = current_migration_number(dirname) + 1
        if ActiveRecord::Base.timestamped_migrations
          [Time.now.utc.strftime("%Y%m%d%H%M%S"), "%.14d" % next_migration_number].max
        else
          "%.3d" % next_migration_number
        end
      end

      def copy_migration
        migration_template 'install.rb', 'db/migrate/install_versioned_text.rb'
        migration_template 'install_acts_as_versioned.rb', 'db/migrate/install_acts_as_versioned_text.rb'
        migration_template 'add_column_relation_type_to_versioned_text.rb', 'db/migrate/add_column_relation_type_to_versioned_text.rb'
      end
    end
  end
end
