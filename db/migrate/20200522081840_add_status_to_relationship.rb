# frozen_string_literal: true

class AddStatusToRelationship < ActiveRecord::Migration[6.0]
  def change
    add_column :relationships, :status, :boolean
  end
end
