class AddIntrodutionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introdution, :string
  end
end
