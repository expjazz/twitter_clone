# frozen_string_literal: true

class AddNameUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
  end
end
