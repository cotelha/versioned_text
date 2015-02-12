require 'active_record'
require "acts_as_versioned"
require 'active_support/concern'

require "versioned_text/version"

module VersionedText
  module Behaviors
    extend ActiveSupport::Concern

    included do
      has_many field_param.to_sym, :polymorphic => true
    end
  end

  # VersionText
  #
  # * <tt>versionable</tt>: O ActiveRecord model que possui o texto
  # * <tt>text</tt>: texto a ser versionado
  # * <tt>user</tt>: usuário que executou a alteração
  #
  class VersionText < ::ActiveRecord::Base
    acts_as_versioned

    belongs_to :versionable, :polymorphic => true

    default_scope order(:version)
    scope :descending, lambda { reorder("version DESC") }
    scope :versionable_finder, lambda {|auditable_id, auditable_type| where(:auditable_id => auditable_id, :auditable_type => auditable_type)}

    def blank?
      return self.text.blank?
    end

  end

  def add_versioned_text_field(field_param, options = {}, &block)
    include VersionedText::Behaviors
  end
end
