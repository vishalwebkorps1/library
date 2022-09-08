class Removeroles < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role_id, :integer
    remove_column :users ,:role, :string

  end
end
