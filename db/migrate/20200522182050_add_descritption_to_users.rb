# frozen_string_literal: true

class AddDescritptionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :string
  end
end
